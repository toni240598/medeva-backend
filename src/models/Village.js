module.exports = (sequelize, DataTypes) => {
    const Village = sequelize.define("Village", {
        name: {
            type: DataTypes.STRING,
            allowNull: false,
        },
        districtId: {
            type: DataTypes.INTEGER,
            allowNull: false,
        },
    }, {
        tableName: 'villages',
        timestamps: false,
    });

    Village.associate = (models) => {
        Village.belongsTo(models.District, { foreignKey: "districtId", as: 'district' });
    };

    return Village;
};
