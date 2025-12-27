import pool from '../db/connection.js'

export async function getAllVerbs(req, res, next) {
    try {
        let sql = `SELECT * FROM verbs`;
        const params = [];

        if (req.query.group) {
            sql += ' WHERE "group" = $1';
            params.push(req.query.group);
        }

        if (req.query.sort === 'greek') {
            sql += ' ORDER BY greek'
        }
        
        const allVerbs = await pool.query(`SELECT * FROM verbs`);
        res.json(allVerbs.rows)
    } catch (error) {
        next(error);
    }
}

export async function getVerbById(req, res, next) {
    try {
        const id = req.params.id;
        const verb = await pool.query(`SELECT * FROM verbs WHERE id = $1`, [id]);

        if (verb.rows.length === 0) {
            return res.status(404).json({ error: 'Verbe non trouvé' });
        } return res.json(verb.rows);
    } catch (error) {
        next(error);
    }
}

export async function searchVerbs(req, res, next) {
    try {
        const q = req.query.q;
        if (q === undefined || q === '') {
            return res.status(400).json({ error: 'Paramètre de recherche manquant' });
        }

        const searchPattern = `%${q}%`;
        const verb = await pool.query(`
            SELECT DISTINCT v.* 
            FROM verbs v
            LEFT JOIN translations t ON v.id = t.verb_id
            LEFT JOIN conjugations c ON v.id = c.verb_id
            WHERE v.greek ILIKE $1
                OR t.translation ILIKE $1
                OR c.form ILIKE $1
            `, [searchPattern])
        return res.json(verb.rows);
    } catch (error) {
        next(error);
    }
}

export async function getVerbConjugations(req, res, next) {
    try {
        const id = req.params.id;
        const verb = await pool.query(`SELECT * FROM conjugations WHERE verb_id = $1`, [id]);
    
        if (verb.rows.length === 0) {
            return res.status(404).json({ error: 'Verbe non trouvé' });
        } return res.json(verb.rows);
        } catch (error) {
            next(error);
        }
}
