const connection = require('./connection');
const waterfall  = require('async/waterfall');

const findOne = (query) => (cb) => {
  waterfall([
    function(next) {
      let querySQL = "select Ad.id as 'address_id', Ad.pc, Ad.street, Ct.name as 'city_name', St.name as 'state_name', Ct.name as 'country_name', Ad.created_at, Ad.updated_at from address as Ad inner join city as Cy on Ad.city_id=Cy.id inner join state as St on Cy.state_id=St.id inner join country as Ct on Ct.id=St.country_id where St.name='"+query.state+"' and Ct.name='"+query.country+"' and Cy.name='"+query.city+"' and Ad.pc='"+query.pc+"' and Ad.street='"+query.number+", "+query.street+"' and Ad.district='"+query.district+"'";
      next(null, querySQL);
    },
    connection,
    function(rows, next) {
      if(rows.length===0) return next(new Error("Not Found"));
      else next(null, rows[0]);
    }
  ], cb);
};

createOne = (query) => (cb) => {
  waterfall([
    function(next) {
      let querySQL = "INSERT INTO country (name)\n"+
        "VALUES ('"+query.country+"')\n"+
        "on duplicate key update updated_at=now();\n"+
        "INSERT INTO state (name,country_id)\n"+
        "VALUES ('"+query.state+"',(select id from country where name='"+query.country+"'))\n"+
        "on duplicate key update updated_at=now();\n"+
        "INSERT INTO city (name,state_id)\n"+
        "VALUES ('"+query.city+"',(select St.id from state as St inner join country as Ct on Ct.id=St.country_id where St.name='"+query.state+"' and Ct.name='"+query.country+"'))\n"+
        "on duplicate key update updated_at=now();\n"+
        "INSERT INTO address (pc,street,district,city_id)\n"+
        "VALUES ("+query.pc+",'"+query.number+", "+query.street+"','"+query.district+"',(select Cy.id from state as St inner join country as Ct on Ct.id=St.country_id inner join city as Cy on Cy.state_id=St.id where St.name='"+query.state+"' and Ct.name='"+query.country+"' and Cy.name='"+query.city+"'))\n"+
        "on duplicate key update updated_at=now();\n";
      next(null, querySQL);
    },
    connection,
    function(rows, next) {
      findOne(query)(next);
    }
  ], cb);
};

module.exports = {
  findOne,

  createOne
};
