
const { course } = require('../models');
const db = require('../models')
const Request = db.request;
const Course = db.course;


const addRequest = async (req,res) =>{
    try {
        let items = {
            author: req.body.author,
            student: req.body.student,
            course: req.body.course,
        }
        await Request.create(items);
        return res.status(200).send({Message: 'Course added successfully'});
    }catch(e){
        res.status(400).send({mesage: e.message});
    }   
} 

const getRequrestById = async (req,res) =>{
    
    try{
        const id = req.params.id;
        const request = await Request.findAll(
                {
                    where: {
                        author:id,
                        status:"processing"
                    }
                }

            );
        return res.status(200).send( request)
    }catch(err){
        return res.status(400).send({mesage: err.message});
    }

}

const getRequestDone = async (req,res) =>{
    
    try{
        const id = req.params.id;
        const request = await Request.findAll(
                {
                    where: {
                        author:id,
                        status:"done"
                    }
                }

            );
        return res.status(200).send( request)
    }catch(err){
        return res.status(400).send({mesage: err.message});
    }

}

const cancelRequest = async (req,res) =>{

    try{
        const id = req.params.id;
        const reposne = await Request.destroy(
            {       
                where:{
                    id:id
                }
            }
        );
        return res.status(200).send({
            success:"true",
            mesage: reposne
        })
    }catch(err){
        return res.status(400).send({
            success:false,
            mesage: err.message});
    }

}

const acceptRequest = async (req,res) =>{

    try{
        const id = req.params.id;
        const request = await Request.findByPk(id);
        if(request != null){
            const response =   request.update({status:"true"})
            console.log(response);
            try{
            const course = await Course.findByPk(request.course);


            course.update({
                "student":request.student
            }).then((result) => {
                return res.status(200).send(true);
            }).catch((err) => {
                return res.status(400).send(false);
            })



            }catch(err){
                return res.status(400).send(false);
            }


        }else{
            return res.status(400).send(false);
        }


        
    }catch(err){
        return res.status(400).send({success:"false", message:err.message});
    }

}
const doneRequest = async (req,res) =>{

    try{
        const body = req.body;
        const request = await Request.findOne({
            where:{
               
                course:body.course,
                status:"true"
            }
        })
        console.log(request);
        if(request != null){
            request.update({status:"done"}).then((result) =>{
                res.status(200).send(true)
            }).catch(err =>{
                return res.status(400).send(true);
            });
        }else{
            return res.status(400).send(false);
        }

        
    }catch(err){
        return res.status(400).send({success:"false", message:err.message});
    }

}

const getAllRequestWithCourse = async (req,res) =>{
    try{
        const id = req.params.idCourse;
        const reponse = await Request.findAll({
            where:{
                course:id,
                status:"true"
            }
        })
        return res.status(200).send(reponse);
    }catch(err){
        return res.status(400).send({success:"false", message})
    }
    

    
}



module.exports = {
    addRequest,
    getRequrestById,
    cancelRequest,
    acceptRequest,
    getAllRequestWithCourse,
    doneRequest,
    getRequestDone

}