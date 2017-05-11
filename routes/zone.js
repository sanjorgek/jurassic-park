const express = require('express');
const router = express.Router();
const waterfall  = require('async/waterfall');
const uuid = require('uuid/v4');
const debug = require('debug')('jurassic-park:zones');

module.exports = (models) => {
  router.get('/:zoneId/new_student', function(req, res, next) {
    return res.render('new_student', {title: 'Jurassic Park', zone_id: req.params.zoneId});
  });

  router.post('/:zoneId/new_student', function(req, res, next) {
    debug(req.body);
    models.Student.createOne({zone_id: req.params.zoneId, name : req.body.name})(function(err, result) {
      if(err) return next(err);
      res.render('new_student', {title: 'Jurassic Park', zone_id: req.params.zoneId});
    });
  });

  return router;
};
