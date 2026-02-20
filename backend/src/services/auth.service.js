import pool from '../../db/connection.js';
import argon2 from 'argon2';

// GET user by email
//==========================
export async function getUserByEmail(email) {
  const query = 'SELECT * FROM users WHERE email = $1';
  
  const result = await pool.query(query, [email]);
  const user = result.rows[0];

  return user;
}

//POST new user
//=============
export async function createUser(email, password) {
  const passwordHash = await argon2.hash(password);

  const query = `INSERT INTO users(email, password_hash) 
    VALUES($1, $2) 
    RETURNING id, email, created_at
    `;
  
  const result = await pool.query(query, [email, passwordHash]);
  const user = result.rows[0];

  return user;
}
