const { Role, JobTitle, Province, City, District, Village } = require('../models');

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


module.exports = {
    getProfile, getRoles, getJobTitles, createRole, createJobTitle, getProvinces, createProvince, getCities, createCity,
    getDistricts, createDistrict, getVillages, createVillage,
};
