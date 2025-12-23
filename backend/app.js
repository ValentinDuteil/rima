import express from 'express';
import pool from './db/connection.js';

const app = express();
const PORT = process.env.PORT;


app.get('/', (req, res) => {
  res.json({ message: 'Backend is running! 🚀' });
});


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

