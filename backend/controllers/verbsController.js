import pool from '../db/connection.js'

export async function getAllVerbs(req, res) {
    try {
        const allVerbs = await pool.query(`SELECT * FROM verbs`);
        res.json(allVerbs.rows)
    } catch(error) {
        console.error(error);
        res.status(500).json({error: 'Erreur Serveur'});
    }
}