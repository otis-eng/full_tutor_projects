const express = require("express");
const router = express.Router();
const requrestController = require("../controller/requrestController");



router.post('/createRequest',requrestController.addRequest);

router.get('/getRequest/:id',requrestController.getRequrestById);

router.post('/acceptRequest/:id',requrestController.acceptRequest);

router.post('/cancelRequest/:id',requrestController.cancelRequest);

router.get("/getAllRequestWithCourse/:idCourse",requrestController.getAllRequestWithCourse);
module.exports = router;