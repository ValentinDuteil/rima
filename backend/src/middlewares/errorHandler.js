export function errorHandler(err, _req, res, _next) {
  const statusCode = err.statusCode || 500;
  const isOperational = err.isOperational || false;

  // Log différent selon le type d'erreur
  if (isOperational) {
    console.log(`⚠️  ${err.message}`);  // Simple log
  } else {
    console.error('💥 BUG DÉTECTÉ:', err);  // Log complet pour debug
  }

  // Construction de la réponse
  const response = {
    error: isOperational ? err.message : 'Internal Server Error'
  };
  
  // En DEV : affiche la stack trace
  // En PROD : ne l'affiche pas
  
  // Ajouter la stack SEULEMENT en dev
  if (process.env.NODE_ENV === 'development') {
    response.stack = err.stack;  // ← Stack trace complète
  }

  res.status(statusCode).json(response);
}