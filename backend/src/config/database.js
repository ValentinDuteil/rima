import 'dotenv/config';

export const dbConfig = {
  host: process.env.PGHOST || 'localhost',
  port: process.env.PGPORT || 5432,
  database: process.env.PGDATABASE || 'rima',
  user: process.env.PGUSER || 'rima1',
  password: process.env.PGPASSWORD
};