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

export async function getVerbById(req, res) {
    try {
        const id = req.params.id;
        const verb = await pool.query(`SELECT * FROM verbs WHERE id = $1`, [id]);

        if (verb.rows === undefined || verb.rows.length === 0) {
            return res.status(404).json({ error: 'Verbe non trouvé' });
        } return res.json(verb.rows);
    } catch (error) {
        console.error(error);
        res.status(500).json({error: 'Erreur Serveur'});
    }
}