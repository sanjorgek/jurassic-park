const connection = require('./connection');
const waterfall  = require('async/waterfall');
const debug = require('debug')('jurassic-park:visittype');

const findList = (query) => (cb) => {
  waterfall(
    [
      function(next) {
        let querySQL = "select VT.id, VT.code, VT.name\n"+
          "from visit_type as VT;";
        next(null, querySQL);
      },
      connection
    ],
    cb
  );
};

module.exports = {
  findList
};
