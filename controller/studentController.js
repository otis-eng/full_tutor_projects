const db = require('../models');

const Student = db.students;


const registerStudent = async (req,res)=>{
    const {email,name,password,address} = await req.body;
     isUser = await Student.findOne({where: {email: email}});
    if(!isUser) {
        
        const items = {
            email: email,
            name:name,
            password: password,
            address: address
        }
        try{
            await Student.create(items);
            return res.status(200).send("Create student success!");
        }catch(err){
            return res.status(400).send({message: err.message});
        }
    }else{
        return res.status(400).send({message:"Email alredy useing"});
    }
}
const LoginStudenWithUsername = async (req,res)=>{
    try{
        const {email,password} = req.body;
        const reponse = await Student.findOne({
            where: {email: email,
                password: password
            }
        })
        console.log("resposne"+ reponse)
        if(reponse){
            
                return res.status(200).send(reponse);
           
            
        }else{
            return res.status(400).send(false);
        }
    }catch(err){
        return res.status(400).send(false);
    }
}

const getStudentProfile = async(req,res) => {
    const id  = req.params.idStudent;
    const items = await Student.findOne(id);
    if(items != null){
        return res.status(200).send({profile:items});
    }else{
        return res.status(400).send({message:"No profile with id"+id});
    }
}





module.exports = {
    registerStudent,
    getStudentProfile,
    LoginStudenWithUsername
}