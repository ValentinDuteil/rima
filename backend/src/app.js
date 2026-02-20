import express from 'express';
import pool from '../db/connection.js';
import cors from 'cors';

import routes from './routes/index.js';
import authRoutes from './routes/auth.routes.js';

import { errorHandler } from './middlewares/errorHandler.js';
import { notFound } from './middlewares/notFound.js';

const app = express();
app.use(cors());
app.use(express.json());

app.use('/api/auth', authRoutes);
app.use('/api', routes);

app.get('/', (req, res) => {
  res.json({ message: 'Backend is running! 🚀' });
});

//Tester la connexion à la BDD
pool.query('SELECT NOW()')
  .then(() => console.log('✅ Database connected'))
  .catch(err => console.error('❌ Database connection failed:', err));

app.use(notFound);
app.use(errorHandler);

export default app;