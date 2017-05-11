const express = require('express');
const router = express.Router();
const waterfall  = require('async/waterfall');
const uuid = require('uuid/v4');
const debug = require('debug')('jurassic-park:reservation');

module.exports = (models) => {
  router.get('/', function(req, res, next) {
    models.Zone.findList2({})(function(err, zones) {
      if(err) return next(err);
      return res.render('zones', {title: 'Jurassic Park', zones: zones});
    });
  });

  router.get('/:zoneId', function(req, res, next) {
    models.Zone.findOneById({ zone_id: req.params.zoneId })(function(err, zone) {
      if(err) return next(err);
      return res.render('zone', {title: 'Jurassic Park', zone: zone});
    });
  });

  return router;
};