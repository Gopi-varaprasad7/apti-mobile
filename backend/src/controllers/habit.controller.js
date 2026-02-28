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

exports.updateHabit = (req,res) => {
  const {habitId} = req.body;

  const query = 'SELECT habitId FROM Habit WHERE habitId = ?'
  db.query(query,[habitId],(err,result) => {
    if (err) return res.status(500).json(err);
  
      res.json(result);
  })
}

exports.deleteHabit = (req, res) => {
  const { habitId } = req.body;

  // 1. Validation: Ensure an ID was actually sent
  if (!habitId) {
    return res.status(400).json({ message: "Habit ID is required" });
  }

  // 2. The SQL Query: Using 'DELETE' with a placeholder (?) for security
  const query = 'DELETE FROM habits WHERE id = ?';

  // 3. Execute the query
  db.query(query, [habitId], (err, result) => {
    if (err) {
      console.error("Database error:", err);
      return res.status(500).json({ error: "Internal server error" });
    }

    // 4. Check if a row was actually deleted
    if (result.affectedRows === 0) {
      return res.status(404).json({ message: "Habit not found" });
    }

    return res.status(200).json({ message: "Habit deleted successfully" });
  });
};