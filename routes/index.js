const express = require('express');
const router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Jurassic Park' });
});

router.get('/reservations', function(req, res, next) {
  res.render('reservation_index', {title: 'Jurassic Park', });
});

router.get('/new_reservation', function(req, res, next) {
  res.render('new_reservation', {title: 'Jurassic Park', });
});

module.exports = router;
