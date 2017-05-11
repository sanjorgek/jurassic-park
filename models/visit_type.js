const connection = require('./connection');
const waterfall  = require('async/waterfall');
const debug = require('debug')('jurassic-park:visittype');

const findList = (query) => (cb) => {
  waterfall(
    [
      function(next) {
        let querySQL = "select VT.id, VT.code, VT.name, PV.cost\n"+
          "from `jurassicParkDB`.`visit_type` as VT\n"+
          "inner join `jurassicParkDB`.`product_visit` as PV on VT.id=PV.visit_type_id and VT.code=PV.visit_type_code\n";
        if(query.isActive) querySQL += "where PV.is_active;";
        else querySQL += ";";
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
