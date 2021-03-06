const db = require('../models')
const Course = db.course;


const addCourse = async (req,res) =>{
    try {
        let course = {
            author: req.body.author,
            name: req.body.name,
            description: req.body.description,
            ageLimit: req.body.ageLimit,
            price: req.body.price,
        }
        await Course.create(course);
        return res.status(200).send({Message: 'Course added successfully'});
    }catch(e){
        res.status(400).send({mesage: e.message});
    }   


} 

const getALlCourse = async (req,res) =>{

    try{
        const course  = await Course.findAll();
        return res.status(200).send(course);
    }catch(err){
        return res.status(400).send({mesage: err.message});
    }

}

const getCourseWithId = async (req,res) =>{
    try{
        const id = req.params.id;
        const course = await Course.findAll(
{            where: {
                author:id
            }}
        );
        return res.status(200).send(course);
    }catch(err){
        return res.status(400).send({mesage: err.message});
    }
}

const deleteCourse = async (req,res) =>{
    try{
        const id = req.params.id;
        const reponse = await Course.destroy({
            where:{
                id:id
            }
        })
        return res.status(200).send({success:true,mesage: reponse});
    }catch(err){
        return res.status(400).send({success:false,mesage: err.message});
    }
}


const getCourseWithStudent = async(req,res) =>{

    try{
        const idStudent = req.params.idStudent;
        const response = await Course.findAll({
            where:{
                student:idStudent
            }
        });
        return res.status(200).send(response)
    }catch(err){
        return res.status(400).send({success:false,mesage: err.message})
    }


}

module.exports = {
    addCourse,
    getCourseWithId,
    getALlCourse,
    deleteCourse,
    getCourseWithStudent
} 