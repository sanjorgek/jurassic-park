const connection = require('./connection');
const waterfall  = require('async/waterfall');
const debug = require('debug')('jurassic-park:zone');

const assigned = (is_assigned) => {
  return (is_assigned)? " not " : " " ;
};

const findList = (query) => (cb) => {
  waterfall(
    [
      function(next) {
        let querySQL = "select Zn.code, Dn.name\n"+
          " from zone as Zn\n"+
          " inner join dinosaur as Dn on Zn.code=Dn.zone_code\n"+
          " left join visit as Vs on Zn.code=Vs.zone_code and Vs.reserve_zone_id="+query.reserve_zone_id+"\n"+
          " where Vs.reserve_zone_id is"+assigned(query.is_assigned)+"null;";
        next(null, querySQL);
      },
      connection
    ],
    cb
  );
}

module.exports = {
  findList
};
