const express = require('express');
const router = express.Router();
const waterfall  = require('async/waterfall');
const uuid = require('uuid/v4');
const debug = require('debug')('jurassic-park:school');

module.exports = (models) => {
  router.get('/', function(req, res, next) {
    models.School.findList({})(function(err, schools) {
      if(err) return next(err);
      debug(schools);
      return res.render('schools', {title: 'Jurassic Park', schools: schools});
    });
  });

  router.post('/', function(req, res, next) {
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
        if(err) return next(err);
        else res.redirect('/schools');
      }
    );
  });

  router.get('/:schoolCode/new_reservation', function(req, res, next) {
    debug(req.params);
    waterfall(
      [
        function(next) {
          models.School.findByCode({code: req.params.schoolCode})(function(err, schoolF) {
            next(err, schoolF);
          });
        }
      ],
      function(err, result) {
        debug(result);
        if(err) return next(err);
        res.render('new_school_reservation', {title: 'Jurassic Park', school: result});
      }
    );
  });

  router.post('/:schoolCode/new_reservation', function(req, res, next) {
    debug(req.body);
    waterfall(
      [
        function(next) {
          models.School.findByCode({code: req.params.schoolCode})(function(err, schoolF) {
            next(err, schoolF);
          });
        },
        function(school, next) {
          let visitDate = req.body.visit_date.split(" ");
          models.Reservation.createOne({
            school_code: school.school_code,
            school_id: school.school_id,
            visit_date: visitDate[0],
            visit_hour: visitDate[1],
            method: req.body.method_type
          })(function(err, newReservation) {
            next(err, {school: school, reservation: newReservation});
          });
        }
      ],
      function(err, result) {
        debug(result);
        if(err) return next(err);
        res.redirect('/reservations');
      }
    );
  });

  return router;
};
