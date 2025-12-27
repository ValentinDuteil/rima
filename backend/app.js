import express from 'express';
import pool from './db/connection.js';

import routes from './routes/index.js';
import { errorHandler } from './middlewares/errorHandler.js';

const app = express();
const PORT = process.env.PORT;

app.use('/api', routes);

app.get('/', (req, res) => {
  res.json({ message: 'Backend is running! 🚀' });
});

app.use(errorHandler);

async function startServer(){
  try {
    const connection = await pool.query('SELECT NOW()')
    console.log(connection);

    app.listen(PORT, () => {
    console.log(`Server running on http://localhost:${PORT}`);
});

  } catch (e) {
    console.error(e);
  }
}

startServer();

