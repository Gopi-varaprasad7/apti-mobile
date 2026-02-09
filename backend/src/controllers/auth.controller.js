const jwt = require('jsonwebtoken');
const bcrypt = require('bcrypt');
const db = require('../config/db');

exports.register = async (req,res) => {
   try{
     const {name, email, password} = req.body;

    const [existing] = await db.query(
        'SELECT id FROM users WHERE email = ?',[email]
    );
    if(existing.length > 0){
        return res.status(400).json({message:"User already exist"});
    }

    const hashedPassword = await bcrypt.hash(password,10);
    await db.query('INSERT INTO users (name, email, password) VALUES (?, ?, ?)',[name, email, hashedPassword]);

    res.status(200).json({message:"User registered succesfully"})
   }
   catch(error){
        res.status(500).json({message:"Server error"})
   }
}

exports.login = async (req,res) => {
    try{
        const {email, password} = req.body;
        const[users] = await db.query(
            'SELECT * FROM users WHERE email = ?',[email]
        )

        if(users.length == 0){
            return res.status(401).json({message:'Invalid credentials'})
        }
        const user = users[0];
        const match = await bcrypt.compare(password,user.password);
        if(!match){
            return res.status(401).json({message:'Inavlid credentials'});   
        }
        const token = jwt.sign({userID:user.id},process.env.JWT_SECRET,{expiresIn:'1d'})
        return res.status(200).json({
            message: 'Login successful',
            token,
            user: {
              id: user.id,
              name: user.name,
              email: user.email
            }
          });
    }
    catch(error){
        res.status(500).json({message:'Server error'})
    }
}