const express = require('express');
const router = express.Router();
const waterfall  = require('async/waterfall');
const uuid = require('uuid/v4');
const debug = require('debug')('jurassic-park:reservezones');

module.exports = (models) => {
  router.get('/:gradeId/new_student', function(req, res, next) {
    return res.render('new_student', {title: 'Jurassic Park', zone_id: req.params.gradeId});
  });

  router.post('/:gradeId/new_student', function(req, res, next) {
    debug(req.body);
    models.Student.createOne({zone_id: req.params.gradeId, name : req.body.name})(function(err, result) {
      if(err) return next(err);
      res.render('new_student', {title: 'Jurassic Park', zone_id: req.params.gradeId});
    });
  });

  router.get('/:gradeId/new_visit', function(req, res, next) {
    models.Zone.findList({ reserve_zone_id: req.params.gradeId, is_assigned: false })(function(err, zones) {
      if(err) return next(err);
      return res.render('new_visit', {title: 'Jurassic Park', reserve_zone_id: req.params.gradeId, zones: zones});
    });
  });

  router.post('/:gradeId/new_visit', function(req, res, next) {
    console.log(req.body);
    models.Visit.createOne({reserve_zone_id: req.params.gradeId, zone_code: req.body.zone })(function(err, result) {
      if(err) return next(err);
      res.redirect("/reservations/"+req.params.gradeId);
    });
  });

  router.get('/:gradeId/delete_visit', function(req, res, next) {
    models.Zone.findList({ reserve_zone_id: req.params.gradeId, is_assigned: true })(function(err, zones) {
      if(err) return next(err);
      return res.render('new_visit', {title: 'Jurassic Park', reserve_zone_id: req.params.gradeId, zones: zones});
    });
  });

  router.post('/:gradeId/delete_visit', function(req, res, next) {
    console.log(req.body);
    models.Visit.deleteByZone({reserve_zone_id: req.params.gradeId, zone_code: req.body.zone })(function(err, result) {
      if(err) return next(err);
      res.redirect("/reservations/"+req.params.gradeId);
    });
  });

  router.get('/:gradeId/delete_grade', function(req, res, next) {
    models.ReserveZone.deleteById({ reserve_zone_id: req.params.gradeId })(function(err, zones) {
      if(err) return next(err);
      res.redirect("/reservations/"+req.params.gradeId);
    });
  });

  return router;
};
