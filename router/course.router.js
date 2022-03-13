const express = require("express");
const router = express.Router();
const courseController = require("../controller/courseController");



router.post('/createCourse',courseController.addCourse);

router.get('/getAllCourse',courseController.getALlCourse);

router.get('/getCourse/:id',courseController.getCourseWithId);


router.delete('/deleteCourse/:id',courseController.deleteCourse);

router.get('/getCourseWithStudent/:idStudent',courseController.getCourseWithStudent)

module.exports = router;