const express = require('express');
const dotenv = require('dotenv');
const cors = require('cors');
dotenv.config();

const authRoutes = require('./routes/auth.routes');
const questionRoutes = require('./routes/question.routes');
const app = express();

app.use(cors());
app.use(express.json());

app.use('/api/auth',authRoutes);
app.use('/api/questions',questionRoutes);

module.exports = app;