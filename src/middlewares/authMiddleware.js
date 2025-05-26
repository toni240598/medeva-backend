const jwt = require('jsonwebtoken');
const createError = require('http-errors');
require('dotenv').config();

const authenticateToken = (req, res, next) => {
  const authHeader = req.headers['authorization'];
  if (!authHeader) throw createError(401, 'Authorization header missing');
  
  const token = authHeader.split(' ')[1];
  if (!token) throw createError(401, 'Bearer token missing');

  jwt.verify(token, process.env.JWT_SECRET, (err, user) => {
    if (err) throw createError(403, 'Invalid token');
    req.user = user;
    next();
  });
};

module.exports = authenticateToken;
