module.exports = (sequelize, DataTypes) => {
    const City = sequelize.define("City", {
        name: {
            type: DataTypes.STRING,
            allowNull: false,
        },
        provinceId: {
            type: DataTypes.INTEGER,
            allowNull: false,
        },
    }, {
        tableName: 'cities',
        timestamps: false,
    });

    City.associate = (models) => {
        City.belongsTo(models.Province, { foreignKey: "provinceId", as: 'province' });
        City.hasMany(models.District, { foreignKey: "cityId" });
    };

    return City;
};
