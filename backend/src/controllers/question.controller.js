const db = require('../config/db');

exports.getQuestions = async (req,res) => {
    try{
        const {category, difficulty} = req.body;
        if(!category || !difficulty){
            return res.status(400).json({message:"Category and difficulty required"})
        }
        const [questions] = await db.query(
            `SELECT
            id
            question,
            option1,
            option2,
            option3,
            option4
            ask_ai
            FROM questions
            WHERE category = ? AND difficulty = ?
            `,[category,difficulty]
        )
        if (questions.length === 0) {
            return res.status(404).json({ message: 'No questions found' });
          }
        res.status(200).json({questions});

    }
    catch(error){
        res.status(500).json({ message: 'Server error' });
    }
}

exports.checkAnswer = async (req, res) => {
    try {
      const { questionId, selectedOption } = req.body;
  
      const [result] = await db.query(
        'SELECT correct_option FROM questions WHERE id = ?',
        [questionId]
      );
  
      if (result.length === 0) {
        return res.status(404).json({ message: 'Question not found' });
      }
  
      const isCorrect = result[0].correct_option === selectedOption;
  
      res.status(200).json({
        correct: isCorrect,
        correctAnswer: result[0].correct_option,
      });
    } catch (error) {
      res.status(500).json({ message: 'Server error' });
    }
  };