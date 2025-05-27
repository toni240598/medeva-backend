const { Op } = require("sequelize");
const createError = require('http-errors');
const { Role, JobTitle, Province, City, District, Village, DoctorCode, Employee } = require('../models');

const getProfile = (req, res) => {
    res.json(req.user);
};

const getRoles = async (req, res) => {
    const roles = await Role.findAll();
    res.json(roles);
};

const createRole = async (req, res) => {
    const { name } = req.body;
    const role = await Role.create({ name });
    res.json(role);
};

const createJobTitle = async (req, res) => {
    const { name } = req.body;
    const jobTitle = await JobTitle.create({ name });
    res.json(jobTitle);
};

const getJobTitles = async (req, res) => {
    const jobs = await JobTitle.findAll();
    res.json(jobs);
};

const getProvinces = async (req, res) => {
    const data = await Province.findAll();
    res.json(data);
};

const createProvince = async (req, res) => {
    const { name } = req.body;
    const newProvince = await Province.create({ name });
    res.status(201).json(newProvince);
};

const getCities = async (req, res) => {
    const data = await City.findAll({
        include: [{ model: Province, as: 'province', attributes: ['name'] },],
    });
    res.json(data);
};

const createCity = async (req, res) => {
    const { name, provinceId } = req.body;
    const newCity = await City.create({ name, provinceId });
    res.status(201).json(newCity);
};

const getDistricts = async (req, res) => {
    const data = await District.findAll({
        include: [{ model: City, as: 'city', attributes: ['name'] },],
    });
    res.json(data);
};

const createDistrict = async (req, res) => {
    const { name, cityId } = req.body;
    const newDistrict = await District.create({ name, cityId });
    res.status(201).json(newDistrict);
};


const getVillages = async (req, res) => {
    const data = await Village.findAll({
        include: [{ model: District, as: 'district', attributes: ['name'] },],
    });
    res.json(data);
};

const createVillage = async (req, res) => {
    const { name, districtId } = req.body;
    const newVillage = await Village.create({ name, districtId });
    res.status(201).json(newVillage);
};


const getDoctorCodes = async (req, res) => {
    const data = await DoctorCode.findAll();
    res.json(data);
};

const createDoctorCode = async (req, res) => {
    const { code, description } = req.body;
    const newDoctorCode = await DoctorCode.create({ code, description });
    res.status(201).json(newDoctorCode);
};

const createEmployee = async (req, res) => {
    const {
        fullName, identityNumber, gender, birthPlace, birthDate,
        phoneNumber, provinceId, cityId, districtId, villageId,
        addressDetail, username, email, password,
        contractStartDate, contractEndDate, martialStatus, doctorCodeId,
        jobTitleId, roleIds, customJobTitle,
    } = req.body;

    // Cek apakah salah satu sudah ada
    const existingEmployee = await Employee.findOne({
        where: {
            [Op.or]: [
                { email },
                { username },
                { identityNumber }
            ]
        }
    });

    if (existingEmployee) {
        const conflictFields = [];
        if (existingEmployee.email === email) conflictFields.push('email');
        if (existingEmployee.username === username) conflictFields.push('username');
        if (existingEmployee.identityNumber === identityNumber) conflictFields.push('identityNumber');

        throw createError(409, `${conflictFields.join(', ')} already exist`);
    }

    const photoUrl = req.file ? `/api/files/${req.file.filename}` : null;
    const dataRoleIds = Array.isArray(roleIds)
        ? roleIds.map(id => parseInt(id))
        : [parseInt(roleIds)];

    const newEmployee = await Employee.create({
        fullName, identityNumber, gender, birthPlace, birthDate,
        phoneNumber, provinceId, cityId, districtId, villageId,
        addressDetail, username, email, password,
        contractStartDate, contractEndDate, martialStatus, doctorCodeId,
        photoUrl, jobTitleId, customJobTitle,
    });
    await newEmployee.setRoles(dataRoleIds);
    res.status(201).json(newEmployee);
}


const updateEmployee = async (req, res) => {
    const { id } = req.params;
    const {
        fullName, identityNumber, gender, birthPlace, birthDate,
        phoneNumber, provinceId, cityId, districtId, villageId,
        addressDetail, username, email, martialStatus, doctorCodeId,
        contractStartDate, contractEndDate,
        jobTitleId, roleIds, customJobTitle,
    } = req.body;

    // Cek apakah salah satu sudah ada
    const existingEmployee = await Employee.findOne({
        where: {
            [Op.and]: [
                {
                    [Op.or]: [
                        { email },
                        { username },
                        { identityNumber }
                    ]
                },
                { id: { [Op.ne]: id } } // pengecualian untuk id milik dirinya sendiri
            ]
        }
    });

    if (existingEmployee) {
        const conflictFields = [];
        if (existingEmployee.email === email) conflictFields.push('email');
        if (existingEmployee.username === username) conflictFields.push('username');
        if (existingEmployee.identityNumber === identityNumber) conflictFields.push('identityNumber');

        throw createError(409, `${conflictFields.join(', ')} already exist`);
    }

    // const photoUrl = req.file ? `/api/files/${req.file.filename}` : null;
    const dataRoleIds = Array.isArray(roleIds)
        ? roleIds.map(id => parseInt(id))
        : [parseInt(roleIds)];

    // Cari employee berdasarkan ID
    const employee = await Employee.findByPk(id);
    if (!employee) {
        throw createError(404, 'Employee not found');
    }

    // Update data employee
    await employee.update({
        fullName, identityNumber, gender, birthPlace, birthDate,
        phoneNumber, provinceId, cityId, districtId, villageId,
        addressDetail, username, email,
        contractStartDate, contractEndDate, martialStatus, doctorCodeId,
        jobTitleId, customJobTitle,
    });
    await employee.setRoles(dataRoleIds);
    res.status(201).json(employee);
}

const getEmployees = async (req, res) => {
    const { status, search } = req.query;

    const where = {};
    if (status) where.status = status;
    if (search) where.fullName = { [Op.iLike]: `%${search}%` };

    const employees = await Employee.findAll({
        where,
        include: ['province', "city", "district", "village", "doctorCode", 'roles', 'jobTitle'],
        order: [["createdAt", "DESC"]],
    });

    res.json(employees);
};

module.exports = {
    getProfile, getRoles, getJobTitles, createRole, createJobTitle, getProvinces, createProvince, getCities, createCity,
    getDistricts, createDistrict, getVillages, createVillage, getDoctorCodes, createDoctorCode, getEmployees, createEmployee,
    updateEmployee,
};
