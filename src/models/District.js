module.exports = (sequelize, DataTypes) => {
    const District = sequelize.define("District", {
        name: {
            type: DataTypes.STRING,
            allowNull: false,
        },
        cityId: {
            type: DataTypes.INTEGER,
            allowNull: false,
        },
    }, {
        tableName: 'districts',
        timestamps: false,
    });

    District.associate = (models) => {
        District.belongsTo(models.City, { foreignKey: "cityId", as: 'city' });
        District.hasMany(models.Village, { foreignKey: "districtId" });
    };

    return District;
};
