import express from 'express';
import pool from '../db/connection.js';
import cors from 'cors';

import routes from './routes/index.js';
import { errorHandler } from './middlewares/errorHandler.js';

const app = express();
app.use(cors());
app.use(express.json());

app.use('/api', routes);

app.get('/', (req, res) => {
  res.json({ message: 'Backend is running! 🚀' });
});

app.use(errorHandler);

//Tester la connexion à la BDD
pool.query('SELECT NOW()')
  .then(() => console.log('✅ Database connected'))
  .catch(err => console.error('❌ Database connection failed:', err));

export default app;