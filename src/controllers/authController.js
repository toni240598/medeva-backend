const jwt = require('jsonwebtoken');
const createError = require('http-errors');
require('dotenv').config();

const login = (req, res) => {
  const { username, password } = req.body;

  // Dummy check
  if (username === 'admin' && password === 'admin123') {
    const token = jwt.sign({ username }, process.env.JWT_SECRET, { expiresIn: '1d' });
    const items = { token };
    res.json(items);
  } else {
    throw createError(401, 'Invalid credentials');
  }
};

module.exports = { login };
