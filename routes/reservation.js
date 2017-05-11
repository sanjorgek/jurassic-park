const express = require('express');
const router = express.Router();
const waterfall  = require('async/waterfall');
const uuid = require('uuid/v4');
const debug = require('debug')('jurassic-park:reservation');

module.exports = (models) => {
  router.get('/', function(req, res, next) {
    models.Reservation.findList({isActive: true})(function(err, reservations) {
      if(err) return next(err);
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
      return res.render('reservation', {title: 'Jurassic Park', reservation_id: req.params.reservationId, reservations: result.reservations, grades: result.grades});
    });
  });

  router.get('/:reservationId/new_grade', function(req, res, next) {
    waterfall(
      [
        models.VisitType.findList({ reservation_id: req.params.reservationId })
      ],
      function(err, result) {
        if(err) return next(err);
        res.render('new_grade', { title: 'Jurassic Park', reservation_id: req.params.reservationId, visit_types: result });
      }
    );
  });

  router.post('/:reservationId/new_grade', function(req, res, next) {
    let visit_type = req.body.visit_type.split(" ");
    waterfall(
      [
        models.ReserveZone.createOne({
          reservation_id: req.params.reservationId,
          visit_type_id: visit_type[0],
          visit_type_code: visit_type[1],
          principal_teacher: req.body.principal_teacher,
          grade: req.body.grade
        })
      ],
      function(err, result) {
        if(err) return next(err);
        res.redirect("/reservations/"+req.params.reservationId);
      }
    );
  });

  router.get('/:reservationId/students/:studentId/delete', function(req, res, next) {
    console.log(req.params);
    models.Student.deleteById({ student_id: req.params.studentId })(function(err, result) {
      if(err) return next(err);
      res.redirect("/reservations/"+req.params.reservationId);
    });
  });

  return router;
};
