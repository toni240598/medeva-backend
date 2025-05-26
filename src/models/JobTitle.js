module.exports = (sequelize, DataTypes) => {
  return sequelize.define('JobTitle', {
    name: {
      type: DataTypes.STRING,
      allowNull: false,
      unique: true,
    }
  }, {
    tableName: 'job_titles',
    timestamps: false,
  });
};
