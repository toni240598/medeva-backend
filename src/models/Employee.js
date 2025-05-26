const bcrypt = require("bcryptjs");

module.exports = (sequelize, DataTypes) => {
  const Employee = sequelize.define(
    "Employee",
    {
      fullName: {
        type: DataTypes.STRING,
        allowNull: false,
      },
      status: {
        type: DataTypes.ENUM("active", "inactive"),
        defaultValue: "active",
      },
      photoUrl: {
        type: DataTypes.STRING
      },
      identityNumber: {
        type: DataTypes.STRING,
        allowNull: false,
        unique: true,
      },
      gender: {
        type: DataTypes.ENUM("male", "female"),
        allowNull: false,
      },
      birthPlace: {
        type: DataTypes.STRING,
        allowNull: true,
      },
      birthDate: {
        type: DataTypes.DATEONLY,
        allowNull: true,
      },
      phoneNumber: {
        type: DataTypes.STRING,
        allowNull: true,
      },
      provinceId: {
        type: DataTypes.INTEGER,
        allowNull: true,
      },
      cityId: {
        type: DataTypes.INTEGER,
        allowNull: true,
      },
      districtId: {
        type: DataTypes.INTEGER,
        allowNull: true,
      },
      villageId: {
        type: DataTypes.INTEGER,
        allowNull: true,
      },
      jobTitleId: {
        type: DataTypes.INTEGER,
        allowNull: true,
      },
      jobTitleLabel: {
        type: DataTypes.STRING,
        allowNull: true,
      },
      addressDetail: {
        type: DataTypes.TEXT,
        allowNull: true,
      },
      username: {
        type: DataTypes.STRING,
        allowNull: false,
        unique: true,
      },
      email: {
        type: DataTypes.STRING,
        allowNull: false,
        unique: true,
        validate: {
          isEmail: true,
        },
      },
      password: {
        type: DataTypes.STRING,
        allowNull: false,
      },
      contractStartDate: {
        type: DataTypes.DATEONLY,
        allowNull: true,
      },
      contractEndDate: {
        type: DataTypes.DATEONLY,
        allowNull: true,
      },
      maritalStatus: {
        type: DataTypes.ENUM("single", "married", "divorced"),
        allowNull: true,
      },
      doctorCodeId: {
        type: DataTypes.INTEGER,
        allowNull: true,
      },
    },
    {
      tableName: "employees",
      hooks: {
        beforeCreate: async (employee) => {
          if (employee.password) {
            const salt = await bcrypt.genSalt(10);
            employee.password = await bcrypt.hash(employee.password, salt);
          }
        },
        beforeUpdate: async (employee) => {
          if (employee.changed("password")) {
            const salt = await bcrypt.genSalt(10);
            employee.password = await bcrypt.hash(employee.password, salt);
          }
        },
      },
    }
  );

  Employee.associate = (models) => {
    Employee.belongsTo(models.Province, { foreignKey: "provinceId", as: "province" });
    Employee.belongsTo(models.City, { foreignKey: "cityId", as: "city" });
    Employee.belongsTo(models.District, { foreignKey: "districtId", as: "district" });
    Employee.belongsTo(models.Village, { foreignKey: "villageId", as: "village" });
    Employee.belongsTo(models.DoctorCode, { foreignKey: "doctorCodeId", as: "doctorCode" });
    Employee.belongsTo(models.JobTitle, { foreignKey: "jobTitleId", as: "jobTitle" });
    Employee.belongsToMany(models.Role, { through: 'employee_roles', foreignKey: 'employeeId', otherKey: 'roleId', as: "roles"});
  };

  return Employee;
};
