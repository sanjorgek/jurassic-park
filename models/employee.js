const connection = require('./connection');
const waterfall  = require('async/waterfall');
const debug = require('debug')('jurassic-park:employee');

const findList = (query) => (cb) => {
  waterfall(
    [
      function(next) {
        let querySQL = "select Em.rfc, Em.names, Em.father_last_name, Em.mother_last_name, Em.email, Em.telephone, Em.day_off, Ad.pc, Ad.street, Ad.district, Ct.name as 'city', St.name as 'state', Co.name as 'country', IF(Qt.rfc is null, 0, 1) AS isQuatermaster, IF(Dv.rfc is null, 0, 1) AS isDriver, IF(Pl.rfc is null, 0, 1) AS isSecurity, IF(Sc.rfc is null, 0, 1) AS isScientist, IF(Vt.rfc is null, 0, 1) AS isVeterinary\n"+
          " from employee as Em\n"+
          " inner join address as Ad on Em.address_id=Ad.id\n"+
          " inner join city as Ct on Ad.city_id=Ct.id\n"+
          " inner join state as St on Ct.state_id=St.id\n"+
          " inner join country as Co on Co.id=St.country_id\n"+
          " left join driver as Dv on Dv.rfc=Em.rfc\n"+
          " left join police as Pl on Pl.rfc=Em.rfc\n"+
          " left join quatermaster as Qt on Qt.rfc=Em.rfc\n"+
          " left join scientist as Sc on Sc.rfc=Em.rfc\n"+
          " left join veterinary as Vt on Vt.rfc=Em.rfc\n"+
          " group by Em.rfc\n"+
          " order by Em.rfc;";
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
