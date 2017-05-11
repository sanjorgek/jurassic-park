const connection = require('./connection');
const waterfall  = require('async/waterfall');
const debug = require('debug')('jurassic-park:reservezone');

const createOne = (query) => (cb) => {
  waterfall(
    [
      function(next) {
        let querySQL = "INSERT INTO reserve_zone (`reservation_id`,`visit_type_id`,`visit_type_code`,`principal_teacher`,`grade`)\n"+
         "VALUES ("+query.reservation_id+","+query.visit_type_id+",'"+query.visit_type_code+"','"+query.principal_teacher+"','"+query.grade+"');";
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
        let querySQL = "DELETE FROM reserve_zone\n"+
          " WHERE id="+query.reserve_zone_id+";";
        next(null, querySQL);
      },
      connection
    ],
    cb
  );
}

module.exports = {
  createOne,
  deleteById
};
