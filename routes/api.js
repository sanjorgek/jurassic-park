const express = require('express');
const router = express.Router();
const waterfall  = require('async/waterfall');
const uuid = require('uuid/v4');
const debug = require('debug')('jurassic-park:api');

module.exports = (models) => {
  router.post('/school', function(req, res, next) {
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
        if(err) res.send(400, {error: err});
        else res.send(result);
      }
    );
  });

  return router;
};
