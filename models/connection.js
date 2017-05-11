const mysql      = require('mysql2');
const debug = require('debug')('jurassic-park:connection');

const pool = mysql.createPool({
  connectionLimit : 100,
  multipleStatements: true,
  host     : 'localhost',
  user     : 'jpAdmin',
  password : 'apophis89hep',
  database : 'jurassicParkDB'
});

module.exports = (query, cb) => {
  pool.getConnection(function(err,connection){
    if (err) {
      connection.release();
      return cb(err);
    }else{
      debug(query);
      connection.query(query, function (err, rows, fields) {
        debug(rows);
        if (err) {
          connection.release();
          return cb(err);
        }else{
          return cb(null, rows);
        }
      });
    }
  });
};
