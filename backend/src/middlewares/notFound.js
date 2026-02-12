export function notFound (req, res){
  const response = {
    error: `Route ${req.method} ${req.url} not found`
  };

  return res.status(404).json(response);
}