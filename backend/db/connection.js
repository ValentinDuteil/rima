import { Pool } from 'pg';
import { dbConfig } from '../src/config/database.js';

const pool = new Pool(dbConfig);

export default pool;