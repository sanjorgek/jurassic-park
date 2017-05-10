const express = require('express');
const router = express.Router();
const waterfall  = require('async/waterfall');
const uuid = require('uuid/v4');
const debug = require('debug')('jurassic-park:api');

module.exports = (models) => {
  router.get('/', function(req, res, next) {
    models.School.findList({})(function(err, schools) {
      if(err) return next(400);
      debug(schools);
      return res.render('schools', {title: 'Jurassic Park', schools: schools});
    });
  });

  router.post('/', function(req, res) {
    debug(req.body);
    let query = req.body;
    query.uuid = uuid();
    waterfall(
      [
        models.Address.createOne(req.body),
        function(newAddress, next) {
          models.School.createOne(req.body)(next);
        }
      ],
      function(err, result) {
        debug(result);
        if(err) res.send(400, {error: err});
        else res.redirect('/schools');
      }
    );
  });

  return router;
};
