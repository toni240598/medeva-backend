const { body } = require('express-validator');

const createValidator = (field, rules) => {
    return rules.map(rule => {
        const validator = body(field);
        if (rule.required) validator.notEmpty().withMessage(`${field} tidak boleh kosong`);
        if (rule.isString) validator.isString().withMessage(`${field} harus berupa string`);
        if (rule.isNumber) validator.isNumeric().withMessage(`${field} harus berupa angka`);
        if (rule.minLength) validator.isLength({ min: rule.minLength }).withMessage(`${field} minimal ${rule.minLength} karakter`);
        // Tambahkan rule lainnya sesuai kebutuhan
        return validator;
    });
};

const bodyValidator = {
    login: {
        username: [{ required: true, isString: true },],
        password: [{ required: true, isString: true, minLength: 6 },],
    },
    createRole: {
        name: [{ required: true, isString: true },],
    },
    createJobTitle: {
        name: [{ required: true, isString: true },],
    },
    createProvince: {
        name: [{ required: true, isString: true },],
    },
    createCity: {
        name: [{required: true, isString: true}],
        provinceId: [{required: true, isNumber: true}],
    },
    createDistrict: {
        name: [{required: true, isString: true}],
        cityId: [{required: true, isNumber: true}],
    },
    createVillage: {
        name: [{required: true, isString: true}],
        districtId: [{required: true, isNumber: true}],
    },
};

const buildValidators = (rules) => {
    return Object.entries(rules).flatMap(([field, fieldRules]) => {
        return createValidator(field, fieldRules);
    });
};

module.exports = { buildValidators, bodyValidator };