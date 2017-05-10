const connection = require('./connection');
const waterfall  = require('async/waterfall');
const debug = require('debug')('jurassic-park:school');

const findList = function(query){
  return function(cb) {
    waterfall([
      function(next) {
        let querySQL = "select Sc.id as 'school_id', Sc.code as 'school_code', Sc.name as 'school_name', Ad.pc, Ad.street, Ct.name as 'city_name', St.name as 'state_name', Co.name as 'country_name', group_concat(ScT.telephone) as 'telephones', group_concat(ScE.email) as 'emails', Sc.created_at, Sc.updated_at\n"+
        "from school as Sc\n"+
        "left join school_telephone as ScT on Sc.id=ScT.school_id and Sc.code=ScT.school_code\n"+
        "left join school_email as ScE on Sc.id=ScE.school_id and Sc.code=ScE.school_code\n"+
        "inner join address as Ad on Sc.address_id=Ad.id\n"+
        "inner join city as Ct on Ad.city_id=Ct.id\n"+
        "inner join state as St on Ct.state_id=St.id\n"+
        "inner join country as Co on Co.id=St.country_id\n"+
        "group by Sc.id, Sc.code\n"+
        "order by Sc.id;\n";
        next(null, querySQL);
      },
      connection,
      function(rows, next) {
        debug(rows);
        next(null, rows);
      }
    ], cb);
  }
};

const findOne = function(query){
  return function(cb) {
    waterfall([
      function(next) {
        let querySQL = "select Sc.id as 'school_id', Sc.code as 'school_code', Sc.name as 'school_name', Ad.pc, Ad.street, Ct.name as 'city_name', St.name as 'state_name', Co.name as 'country_name', group_concat(ScT.telephone) as 'telephones', group_concat(ScE.email) as 'emails', Sc.created_at, Sc.updated_at\n"+
          "from school as Sc\n"+
          "left join school_telephone as ScT on Sc.id=ScT.school_id and Sc.code=ScT.school_code\n"+
          "left join school_email as ScE on Sc.id=ScE.school_id and Sc.code=ScE.school_code\n"+
          "left join address as Ad on Sc.address_id=Ad.id\n"+
          "left join city as Ct on Ad.city_id=Ct.id\n"+
          "left join state as St on Ct.state_id=St.id\n"+
          "left join country as Co on Co.id=St.country_id\n"+
          "where Sc.name='"+query.name+"'\n"+
          "group by Sc.id, Sc.code\n"+
          "order by Sc.id;\n";
        next(null, querySQL);
      },
      connection,
      function(rows, next, other) {
        if(rows.length===0) return next(new Error("Not Found"));
        else next(null, rows[0]);
      }
    ], cb);
  }
};

/**
const findByID = function(query){
  return function(cb) {
    waterfall([
      function(next) {
        let querySQL = "select Sc.id as 'school_id', Sc.code as 'school_code', Sc.name as 'school_name', Ad.pc, Ad.street, Ct.name as 'city_name', St.name as 'state_name', Co.name as 'country_name', group_concat(ScT.telephone) as 'telephones', group_concat(ScE.email) as 'emails', Sc.created_at, Sc.updated_at\n"+
          "from school as Sc\n"+
          "left join school_telephone as ScT on Sc.id=ScT.school_id and Sc.code=ScT.school_code\n"+
          "left join school_email as ScE on Sc.id=ScE.school_id and Sc.code=ScE.school_code\n"+
          "inner join address as Ad on Sc.address_id=Ad.id\n"+
          "inner join city as Ct on Ad.city_id=Ct.id\n"+
          "inner join state as St on Ct.state_id=St.id\n"+
          "inner join country as Co on Co.id=St.country_id\n"+
          "where Sc.code='"+query.uuid+"'\n"+
          "group by Sc.id, Sc.code\n"+
          "order by Sc.id;\n";
        next(null, querySQL);
      },
      connection,
      function(rows, next) {
        debug(rows);
        if(rows.length===0) return next(new Error("Not Found"));
        else next(null, rows[0]);
      }
    ], cb);
  }
};
*/

const createOne = function(query){
  return function(cb) {
    waterfall([
      function(next) {
        let querySQL = "INSERT INTO school (code,name,address_id)" +
          "VALUES (upper('"+query.uuid+"'),'"+ query.name +"',(select Ad.id from address as Ad inner join city as Cy on Ad.city_id=Cy.id inner join state as St on Cy.state_id=St.id inner join country as Ct on Ct.id=St.country_id where St.name='"+query.state+"' and Ct.name='"+query.country+"' and Cy.name='"+query.city+"' and Ad.pc='"+query.pc+"' and Ad.street='"+query.number+", "+query.street+"' and Ad.district='"+query.district+"'))" +
          "on duplicate key update updated_at=now();";
        next(null, querySQL);
      },
      connection,
      function(rows, next) {
        findOne(query)(next);
      },
      function(school, next) {
        let querySQL = "insert into school_telephone (school_id,school_code,telephone)\n"+
          "values ("+school.school_id+",'"+school.school_code+"','"+query.telephone+"')\n"+
          "on duplicate key update updated_at=now();\n"+
          "insert into school_email (school_id,school_code,email)\n"+
          "values ("+school.school_id+",'"+school.school_code+"','"+query.email+"')\n"+
          "on duplicate key update updated_at=now();\n";
        next(null, querySQL);
      },
      connection,
      function(rows, next) {
        findOne(query)(next);
      }
    ], cb);

  }
};

module.exports = {
  findList,
  findOne,
  //findByID,
  createOne
};
