const db = require('../config/db');
const {v4:uuidv4} = require('uuid');

exports.createHabit = async (req,res) => {
    const {name, period, color , userId} = req.body;

    const id = uuidv4();

    const query = "INSERT INTO Habits (id, name, period, color, userId) VALUES (? , ? , ? , ? , ? )";
    db.query(query,[id,name,period,color,userId], (err,result) => {
        if(err) return res.status(500).json(err);
        res.status(201).json({
            message: "Habit created successfully",
            habitId: id,
          });
    })
}

exports.getHabitsByUser = (req, res) => {
    const userId = req.params.userId;
  
    const sql = "SELECT * FROM Habit WHERE userId = ?";
  
    db.query(sql, [userId], (err, results) => {
      if (err) return res.status(500).json(err);
  
      res.json(results);
    });
  };