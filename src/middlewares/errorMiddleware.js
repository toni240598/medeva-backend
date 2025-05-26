function errorHandler(err, req, res, next) {
  console.error(err);

  const statusCode = err.statusCode || 500;
  const message = err.message || 'Internal Server Error';

  const errorResponse = {
    status: 'error',
    message,
    error: process.env.NODE_ENV === 'production' ? undefined : err.stack,
    timestamp: new Date().toISOString(),
  };

  res.status(statusCode).json(errorResponse);
}

module.exports = errorHandler;
