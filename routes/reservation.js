const express = require('express');
const router = express.Router();
const waterfall  = require('async/waterfall');
const uuid = require('uuid/v4');
const debug = require('debug')('jurassic-park:api');

module.exports = (models) => {
  router.get('/', function(req, res, next) {
    models.Reservation.findList({isActive: true})(function(err, reservations) {
      if(err) return next(400);
      debug(reservations);
      return res.render('reservations', {title: 'Jurassic Park', reservations: reservations});
    });
  });

  return router;
};
