const express = require('express');

const {getQuestions, checkAnswer} = require('../controllers/question.controller');

const router = express.Router();

router.get('/',getQuestions);
router.post('/check',checkAnswer);

module.exports = router;