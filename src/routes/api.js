const express = require('express');
const { login } = require('../controllers/authController');
const { getProfile, getRoles, getJobTitles, createRole, createJobTitle, getProvinces, createProvince, getCities, createCity, getDistricts, createDistrict, getVillages, createVillage } = require('../controllers/employeeController');
const authenticateToken = require('../middlewares/authMiddleware');
const { validateRequest } = require('../utils/validator');
const { buildValidators, bodyValidator } = require('../utils/validatorBuilder');

const router = express.Router();

// Public route (no auth)
router.post('/login', buildValidators(bodyValidator.login), validateRequest, login);

// Protected route
router.get('/profile', authenticateToken, getProfile);
router.get('/roles', authenticateToken, getRoles);
router.post('/roles', authenticateToken, buildValidators(bodyValidator.createRole), validateRequest, createRole);
router.get('/job-titles', authenticateToken, getJobTitles);
router.post('/job-titles', authenticateToken, buildValidators(bodyValidator.createJobTitle), validateRequest, createJobTitle);
router.get('/provinces', authenticateToken, getProvinces);
router.post('/provinces', authenticateToken, buildValidators(bodyValidator.createProvince), validateRequest, createProvince);
router.get('/cities',authenticateToken, getCities);
router.post('/cities', authenticateToken, buildValidators(bodyValidator.createCity), validateRequest, createCity);
router.get('/districts',authenticateToken, getDistricts);
router.post('/districts', authenticateToken, buildValidators(bodyValidator.createDistrict), validateRequest, createDistrict);
router.get('/villages',authenticateToken, getVillages);
router.post('/villages', authenticateToken, buildValidators(bodyValidator.createVillage), validateRequest, createVillage);

module.exports = router;
