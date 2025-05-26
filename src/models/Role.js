module.exports = (sequelize, DataTypes) => {
  const Role = sequelize.define('Role', {
    name: {
      type: DataTypes.STRING,
      allowNull: false,
      unique: true
    }
  }, {
    tableName: 'roles',
    timestamps: false
  });

  Role.associate = (models) => {
    Role.belongsToMany(models.Employee, { through: 'employee_roles', foreignKey: 'roleId', otherKey: 'employeeId', });
  };

  return Role;
};

