const connection = require('./connection');
const waterfall  = require('async/waterfall');
const debug = require('debug')('jurassic-park:student');

const createOne = (query) => (cb) => {
  waterfall(
    [
      function(next) {
        let querySQL = "INSERT INTO student (`reserve_zone_id`,`name`)\n"+
         "VALUES ('"+query.zone_id+"','"+query.name+"');";
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
        let querySQL = "DELETE FROM student\n"+
          " WHERE id="+query.student_id+";";
         next(null, querySQL);
      },
      connection
    ],
    cb
  );
};

module.exports = {
  createOne,
  deleteById
};
