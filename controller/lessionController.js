const db = require('../models');

const Lession = db.lession;


const addLession = async (req,res) =>{
    const course = req.params.course;
    const {students,linkMeet,timeStart,timeEnd,date,description}  = req.body;
    const lession =  {
        student:students,
        linkMeet:linkMeet,
        timeStart:timeStart,
        timeEnd:timeEnd,
        date:date,
        description:description,
        course:course
        
    }
    try{
        await Lession.create(lession);
         return res.status(200).send(true);
    }catch(err){
        return res.status(400).send(false);
    }

}

const getAllLession = async (req,res) =>{

    try{
        const cousrse = req.params.course;
        const response = await Lession.findAll({
            where:{
                course:cousrse
            }
        
        })
        return res.status(200).send(response);
    }catch(err){
        return res.status(400).send({mesage:err.message});
    }

}

const getDetailLession = async (req,res) =>{

    try{
        const id =  req.params.id;
        const response = Lession.findOne({
            where:{
                id:id
            }
        })
        return res.status(200).send(response);
        
    }catch(err){
        return res.status(400).send({mesage: err.message})
    }

}

const getLessionWithStudent = async (req,res) =>{
    try{
        const student = req.params.student;
        const response =  await Lession.findAll({
            where:{student: student}
        })
        return res.status(200).send(response);
    }catch(err){
        return res.status(400).send({mesage: err.message})
    }
}


module.exports = {


    getDetailLession,
    getAllLession,
    addLession,
    getLessionWithStudent
}