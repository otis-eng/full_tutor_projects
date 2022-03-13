const express = require('express');
const router = express.Router();
const tutorController = require("../controller/tutorController");

router.post('/registerTutor',tutorController.registerTutors);

router.post('/login',tutorController.loginWithUsername);

router.get('/getTutorProfile/:email',tutorController.getTutorProfile);

router.put('/acceptTutor/:idTutor',tutorController.acceptTutor);

router.put('/updateTutor/:id',tutorController.updateProfile)

router.get('/getAllTutor',tutorController.getAllTutor);

module.exports = router;