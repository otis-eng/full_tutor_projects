const express = require("express");
const lessionRouter = express.Router();
const lessionController = require("../controller/lessionController");


lessionRouter.post("/addLession/:course",lessionController.addLession);
lessionRouter.get("/getAll/:course",lessionController.getAllLession);
lessionRouter.get("/getDetail/:id",lessionController.getDetailLession);
lessionRouter.get("/getLessionStudent/:student",lessionController.getLessionWithStudent);




module.exports = lessionRouter;