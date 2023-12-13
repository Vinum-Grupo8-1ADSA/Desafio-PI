var express = require("express");
var router = express.Router();

var sensorController = require("../controllers/sensorController");

router.get("/listarSensor/:idEmpresa", function (req, res) {
    sensorController.listarSensor(req, res);
  });

module.exports = router;