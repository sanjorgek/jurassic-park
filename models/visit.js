const connection = require('./connection');
const waterfall  = require('async/waterfall');
const debug = require('debug')('jurassic-park:zone');

const createOne = (query) => (cb) => {
  waterfall(
    [
      function(next) {
        let querySQL = "INSERT INTO visit (reserve_zone_id,zone_code)\n"+
          " VALUES ("+query.reserve_zone_id+",'"+query.zone_code+"');";
        next(null, querySQL);
      },
      connection
    ],
    cb
  );
};

const deleteByZone = (query) => (cb) => {
  waterfall(
    [
      function(next) {
        let querySQL = "DELETE FROM visit\n"+
          " WHERE reserve_zone_id="+query.reserve_zone_id+" and zone_code='"+query.zone_code+"';";
        next(null, querySQL);
      },
      connection
    ],
    cb
  );
}

module.exports = {
  createOne,
  deleteByZone
};
