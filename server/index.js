//const express = require('express');
import express from 'express'
import dotenv from 'dotenv'
import cookieParser from 'cookie-parser'
import cors from 'cors';  // ✅ Import CORS

import connectToMongoDB from './db/connectToMongoDB.js'

const app = express();
dotenv.config()

app.use(cors());

app.use(express.json())
app.use(cookieParser())

// Routes imports
import userRoutes from './routes/user.routes.js'
import reportRoutes from './routes/report.routes.js'
import reviewRoutes from './routes/review.routes.js'
import followRoutes from './routes/follow.routes.js'
import musicRoutes from './routes/music.routes.js'
import moderationRoutes from './routes/moderation.routes.js';

// Importando as rotas projeto abaixo
app.use('/users', userRoutes)
app.use('/reports', reportRoutes)
app.use('/reviews', reviewRoutes)
app.use('/follows', followRoutes)
app.use('/musics', musicRoutes)
app.use('/moderation', moderationRoutes); 


app.listen(4000, () => {
  connectToMongoDB()
  console.log("Running at Port 4000")
});