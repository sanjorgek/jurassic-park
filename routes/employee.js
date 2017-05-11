const express = require('express');
const router = express.Router();
const waterfall  = require('async/waterfall');
const uuid = require('uuid/v4');
const debug = require('debug')('jurassic-park:employee');

module.exports = (models) => {
  router.get('/', function(req, res, next) {
    models.Employee.findList({})(function(err, employees) {
      if(err) return next(err);
      return res.render('employees', {title: 'Jurassic Park', employees: employees});
    });
  });

  router.post('/', function(req, res, next) {
    debug(req.body);
    let query = req.body;
    waterfall(
      [
        models.Address.createOne(req.body),
        function(newAddress, next) {
          models.Employee.createOne(req.body)(next);
        }
      ],
      function(err, result) {
        debug(result);
        if(err) return next(err);
        else res.redirect('/employees');
      }
    );
  });

  return router;
};