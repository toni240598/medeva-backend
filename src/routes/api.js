const express = require('express');
const { body, query } = require('express-validator');
const { login } = require('../controllers/authController');
const { getProfile, getRoles, getJobTitles, createRole, createJobTitle, getProvinces, createProvince, getCities, createCity, getDistricts,
    createDistrict, getVillages, createVillage, getDoctorCodes,
    createDoctorCode, createEmployee,
    getEmployees } = require('../controllers/employeeController');
const authenticateToken = require('../middlewares/authMiddleware');
const { validateRequest } = require('../utils/validator');
const { buildValidators, bodyValidator } = require('../utils/validatorBuilder');
const upload = require("../middlewares/upload");
const { route } = require('../app');
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
router.get('/cities', authenticateToken, getCities);
router.post('/cities', authenticateToken, buildValidators(bodyValidator.createCity), validateRequest, createCity);
router.get('/districts', authenticateToken, getDistricts);
router.post('/districts', authenticateToken, buildValidators(bodyValidator.createDistrict), validateRequest, createDistrict);
router.get('/villages', authenticateToken, getVillages);
router.post('/villages', authenticateToken, buildValidators(bodyValidator.createVillage), validateRequest, createVillage);
router.get('/doctor-codes', authenticateToken, getDoctorCodes);
router.post('/doctor-codes', authenticateToken, buildValidators(bodyValidator.createDoctorCode), validateRequest, createDoctorCode);
router.get(
    '/employees',
    authenticateToken,
    [
        query("status")
            .optional()
            .isIn(["active", "inactive"])
            .withMessage("Status harus active atau inactive"),
        query("search").optional().isString(),
    ],
    validateRequest,
    getEmployees
);
router.post(
    "/employees",
    authenticateToken,
    upload.single("photo"),
    [
        body("fullName").notEmpty().withMessage("Nama lengkap wajib diisi"),
        body("identityNumber").notEmpty().withMessage("No kartu identitas wajib diisi"),
        body("gender").isIn(["male", "female"]).withMessage("Jenis kelamin harus 'male' atau 'female'"),
        body("birthPlace").notEmpty().withMessage("Tempat lahir wajib diisi"),
        body("birthDate").isDate().withMessage("Tanggal lahir harus valid"),
        body("phoneNumber").notEmpty().withMessage("No telepon wajib diisi"),
        body("provinceId").isInt().withMessage("ProvinceId harus angka"),
        body("cityId").isInt().withMessage("CityId harus angka"),
        body("districtId").isInt().withMessage("DistrictId harus angka"),
        body("roleIds.*")
            .isInt().withMessage("Setiap RoleId harus berupa angka"),
        body("jobTitleId").isInt().withMessage("JobeTitleId harus angka"),
        body("villageId").isInt().withMessage("VillageId harus angka"),
        body("username").notEmpty().withMessage("Username wajib diisi"),
        body("email").isEmail().withMessage("Email harus valid"),
        body("password").isLength({ min: 6 }).withMessage("Password minimal 6 karakter"),
        body("contractStartDate").isDate().withMessage("Tanggal mulai kontrak harus valid"),
        body("contractEndDate").optional({ nullable: true }).isDate().withMessage("Tanggal selesai kontrak harus valid"),
        body("maritalStatus").isIn(["single", "married", "divorced"]).withMessage("Status menikah tidak valid"),
        body("doctorCodeId").isInt().withMessage("DoctorCodeId harus angka"),
    ],
    validateRequest,
    createEmployee
);
module.exports = router;
