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

  return router;
};