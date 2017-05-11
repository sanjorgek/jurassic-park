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

const createOne = function(query){
  return function(cb) {
    waterfall([
      function(next) {
        let querySQL = "INSERT INTO employee (rfc,names,father_last_name,mother_last_name,telephone,email,address_id)" +
          "VALUES ('"+query.rfc+"','"+ query.names +"','"+ query.father_last_name +"','"+ query.mother_last_name +"','"+ query.telephone +"','"+ query.email +"',(select Ad.id from address as Ad inner join city as Cy on Ad.city_id=Cy.id inner join state as St on Cy.state_id=St.id inner join country as Ct on Ct.id=St.country_id where St.name='"+query.state+"' and Ct.name='"+query.country+"' and Cy.name='"+query.city+"' and Ad.pc='"+query.pc+"' and Ad.street='"+query.number+", "+query.street+"' and Ad.district='"+query.district+"'))" +
          "on duplicate key update updated_at=now();";
        next(null, querySQL);
      },
      connection
    ], cb);
  }
};

module.exports = {
  findList,
  createOne
};
