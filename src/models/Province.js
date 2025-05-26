module.exports = (sequelize, DataTypes) => {
    const Province = sequelize.define("Province", {
        name: {
            type: DataTypes.STRING,
            allowNull: false,
        },
    }, {
        tableName: 'provinces',
        timestamps: false,
    });

    Province.associate = (models) => {
        Province.hasMany(models.City, { foreignKey: "provinceId" });
    };

    return Province;
};