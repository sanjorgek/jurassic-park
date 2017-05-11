const express = require('express');
const router = express.Router();
const waterfall  = require('async/waterfall');
const uuid = require('uuid/v4');
const debug = require('debug')('jurassic-park:reservation');

module.exports = (models) => {
  router.get('/', function(req, res, next) {
    models.Reservation.findList({isActive: true})(function(err, reservations) {
      if(err) return next(400);
      debug(reservations);
      return res.render('reservations', {title: 'Jurassic Park', reservations: reservations});
    });
  });

  router.get('/:reservationId', function(req, res, next) {
    waterfall([
      models.Reservation.findZonesOneByID({reservation_id: req.params.reservationId}),
      function(reservationZoneF, next) {
        models.Reservation.findGradesByOneID({reservation_id: req.params.reservationId})(function(err, gradesF) {
          next(err, {reservations: reservationZoneF, grades: gradesF});
        })
      }
    ], function(err, result) {
      if(err) return next(err);
      debug(result);
      return res.render('reservation', {title: 'Jurassic Park', reservations: result.reservations, grades: result.grades});
    });
  });

  return router;
};
