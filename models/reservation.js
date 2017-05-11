const connection = require('./connection');
const waterfall  = require('async/waterfall');
const debug = require('debug')('jurassic-park:reservation');

const activeQuery = (isActive) =>{
  let now = new Date();
  return (isActive)? "where Rs.visit_date>='"+now.toISOString().substr(0,10)+"'\n":"";
};

const findList = (query) => (cb) => {
  waterfall(
    [
      function(next) {
        let querySQL = "select Rs.id as 'reservation_id', Rs.visit_date, Rs.visit_hour, Sc.code as 'school_code', Sc.name as 'school_name'\n"+
        "from `jurassicParkDB`.`school` as Sc\n"+
        "inner join `jurassicParkDB`.`reservation` Rs on Sc.code=Rs.school_code and Sc.id=Rs.school_id\n"+
        activeQuery(query.isActive)+
        "order by Rs.visit_date, Rs.visit_hour;";
        next(null, querySQL);
      },
      connection
    ],
    cb
  );
};

const findOneByDateSchool = (query) => (cb) => {
  waterfall(
    [
      function(next) {
        let querySQL = "select R.id as 'reservation_id', R.visit_date, R.visit_hour, Sc.code as 'school_code', Sc.name as 'school_name', group_concat(RZ.id), group_concat(RZ.grade), R.created_at, R.updated_at\n"+
        "from `jurassicParkDB`.`reservation` as R\n"+
        "inner join `jurassicParkDB`.`school` as Sc on Sc.id=R.school_id and Sc.code=R.school_code\n"+
        "left join `jurassicParkDB`.`reserve_zone` as RZ on RZ.reservation_id=R.id\n"+
        "where R.id='"+query.reservation_id+"'\n"+
        "group by R.id\n"+
        "order by R.visit_date;";
        next(null, querySQL);
      },
      connection,
      function(reservation, next) {
        if(reservation.length==0) return next(new Error("Not Found"));
        if(reservation.length>1) return next(new Error("More Founded"));
        next(null, reservation[0]);
      }
    ],
    cb
  );
};

const findGradesByOneID = (query) => (cb) => {
  waterfall(
    [
      function(next) {
        let querySQL = "select RZ.grade\n"+
          "from `jurassicParkDB`.`reservation` as R\n"+
          "inner join `jurassicParkDB`.`reserve_zone` as RZ on RZ.reservation_id=R.id\n"+
          "where RZ.reservation_id="+query.reservation_id+"\n"+
          "group by RZ.grade;";
        next(null, querySQL);
      },
      connection
    ],
    cb
  );
};

const findZonesOneByID = (query) => (cb) => {
  waterfall(
    [
      function(next) {
        let querySQL = "select RZ.reservation_id, VT.name as 'visit_name', RZ.id as 'reservation_zone_id', RZ.grade as 'reservation_zone_grade', group_concat(D.name) as 'dino_zones', RZ.principal_teacher, VT.code as 'visit_code', VT.id as 'visit_id', St.id as 'student_id', St.name as 'student_name', PV.cost as 'ticket_cost'"+
          "from reserve_zone as RZ\n"+
          "left join visit as Vi on RZ.id=Vi.reserve_zone_id\n"+
          "inner join zone as Z on Vi.zone_code=Z.code\n"+
          "inner join dinosaur as D on D.zone_code=Z.code\n"+
          "inner join visit_type as VT on VT.code=RZ.visit_type_code and VT.id=RZ.visit_type_id\n"+
          "left join student as St on St.reserve_zone_id=RZ.id\n"+
          "inner join product_visit as PV on PV.visit_type_code=VT.code and PV.visit_type_id=VT.id and PV.is_active\n"+
          "where RZ.reservation_id="+query.reservation_id+"\n"+
          "group by St.id, PV.cost\n"+
          "order by VT.id;";
        next(null, querySQL);
      },
      connection
    ],
    cb
  );
};

const createOne = (query) => (cb) => {
  waterfall(
    [
      function(next) {
        let querySQL = "INSERT INTO reservation (school_code,school_id,visit_date,visit_hour,method)"+
          "VALUES ('"+query.school_code+"',"+query.school_id+",'"+query.visit_date+"','"+query.visit_hour+"','"+query.method+"')"+
          "on duplicate key update updated_at=now();";
        next(null, querySQL);
      },
      connection,
      function(rows, next) {
        findOneByDateSchool(query)(next);
      }
    ],
    cb
  );
};

module.exports = {
  findList,
  findOneByDateSchool,
  findZonesOneByID,
  findGradesByOneID,
  createOne
};
