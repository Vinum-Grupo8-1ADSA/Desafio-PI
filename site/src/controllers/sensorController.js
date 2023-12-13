var sensorModel = require("../models/sensorModel");

function listarSensor(req, res) {
    idEmpresa = req.params.idEmpresa
    sensorModel.listarSensor(idEmpresa).then((resultado) => {
      res.status(200).json(resultado);
    });
  }

module.exports = {
    listarSensor
}