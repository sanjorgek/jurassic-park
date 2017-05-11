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

const findList2 = (query) => (cb) => {
  waterfall(
    [
      function(next) {
        let querySQL = "select Zn.code, Zn.type, Dn.name, Dn.id\n"+
          " from zone as Zn\n"+
          " left join dinosaur as Dn on Zn.code=Dn.zone_code\n"+
          " order by Zn.type;";
        next(null, querySQL);
      },
      connection
    ],
    cb
  );
}

const findOneById = (query) => (cb) => {
  waterfall(
    [
      function(next) {
        let querySQL = "select Zn.code, Zn.type, Zn.police_rfc as 'security', Zn.scientist_rfc as 'antropologist', Zn.veterinary_rfc as 'veterinary', Zn.quatermaster_rfc as 'quatermaster', Dn.name as 'dinosaur_name', Dn.surface, Dn.feed_type, Dn.weight, Dn.height, Dst.name as 'time_distribution', VgT.detail, TC.name as 'tax_class', TP.name as 'tax_phylum', TK.name as 'tax_kingdom'\n"+
          "	from zone as Zn\n"+
          " inner join dinosaur as Dn on Zn.code=Dn.zone_code\n"+
          " inner join distribution as Dst on Dn.distribution_id=Dst.id\n"+
          " inner join tax_class as TC on TC.id=Dn.tax_class_id\n"+
          " inner join tax_phylum as TP on TP.id=TC.tax_phylum_id\n"+
          " inner join tax_kingdom as TK on TK.id=TP.tax_kingdom_id\n"+
          " inner join vegetation_type as VgT on VgT.id=Dn.vegetation_type_id\n"+
          " where Zn.code='"+query.zone_id+"';";
        next(null, querySQL);
      },
      connection,
      function(zones, next) {
        if(zones.length==0) return next(new Error("Not Found"));
        if(zones.length>1) return next(new Error("More Founded"));
        next(null, zones[0]);
      }
    ],
    cb
  );
}

module.exports = {
  findList,
  findList2,
  findOneById
};
