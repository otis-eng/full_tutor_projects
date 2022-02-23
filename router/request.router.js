const express = require("express");
const router = express.Router();
const requrestController = require("../controller/requrestController");



router.post('/createRequest',requrestController.addRequest);

router.get('/getRequest/:id',requrestController.getRequrestById);




module.exports = router;