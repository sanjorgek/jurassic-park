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
        console.log(querySQL);
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
        let querySQL = "select RZ.id, RZ.grade\n"+
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
        let querySQL = "select St.id as 'student_id', PV.visit_type_code, RZ.principal_teacher, group_concat(PV.cost) as 'costs', St.name, DZ.dino_names\n"+
          "from visit_type as VT\n"+
          "inner join product_visit as PV on VT.code=PV.visit_type_code and VT.id=PV.visit_type_id and PV.is_active\n"+
          "inner join reserve_zone as RZ on RZ.visit_type_code=VT.code and RZ.visit_type_id=VT.id\n"+
          "left join student as St on St.reserve_zone_id=RZ.id\n"+
          "left join (select Vs.reserve_zone_id, group_concat(Dn.name) as 'dino_names'\n"+
          "  from visit as Vs\n"+
          "  inner join zone as Zn on Zn.code=Vs.zone_code\n"+
          "  inner join dinosaur as Dn on Dn.zone_code=Zn.code\n"+
          "  group by Vs.reserve_zone_id) as DZ on DZ.reserve_zone_id=RZ.id\n"+
          "left join ticket as Tk on Tk.student_id=St.id\n"+
          "where RZ.reservation_id="+query.reservation_id+"\n"+
          "group by St.name\n"+
          "order by VT.id;";
        console.log(querySQL);
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
      connection
    ],
    cb
  );
};

const deleteById = (query) => (cb) => {
  waterfall(
    [
      function(next) {
        let querySQL = "DELETE FROM reservation\n"+
          " WHERE id="+query.reservation_id+";";
        next(null, querySQL);
      },
      connection
    ],
    cb
  );
}

module.exports = {
  findList,
  findOneByDateSchool,
  findZonesOneByID,
  findGradesByOneID,
  createOne,
  deleteById
};
