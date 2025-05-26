const { validationResult } = require('express-validator');
const createError = require('http-errors');

const validateRequest = (req, res, next) => {
  const errors = validationResult(req);
  const errorMessages = errors.array().map(err => {
    return `• ${err.msg.charAt(0).toUpperCase() + err.msg.slice(1)}`;
  }).join('\n');
  if (!errors.isEmpty()) {
    throw createError(400, 'Terdapat kesalahan validasi:\n' + errorMessages);
  }
  next();
};

module.exports = { validateRequest };
