const connection = require('./connection');
const waterfall  = require('async/waterfall');
const debug = require('debug')('jurassic-park:reservation');

const activeQuery = (isActive) =>{
  let now = new Date();
  return (isActive)? "where R.visit_date>='"+now.toISOString().substr(0,10)+"'\n":"";
};

const findList = (query) => (cb) => {
  waterfall(
    [
      function(next) {
        let querySQL = "select R.id as 'reservation_id', R.visit_date, R.visit_hour, Sc.code as 'school_code', Sc.name as 'school_name', group_concat(RZ.id) as 'zones', group_concat(RZ.grade) as 'grades', R.visit_date, R.created_at, R.updated_at\n"+
        "from `jurassicParkDB`.`reservation` as R\n"+
        "inner join `jurassicParkDB`.`school` as Sc on Sc.id=R.school_id and Sc.code=R.school_code\n"+
        "left join `jurassicParkDB`.`reserve_zone` as RZ on RZ.reservation_id=R.id\n"+
        activeQuery(query.isActive)+
        "group by R.id\n"+
        "order by R.visit_date;";
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
        "where R.school_code='"+query.school_code+"' and R.visit_date>='"+query.visit_date+"'\n"+
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
  createOne
};
