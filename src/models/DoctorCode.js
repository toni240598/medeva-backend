module.exports = (sequelize, DataTypes) => {
    return sequelize.define("DoctorCode", {
        code: {
            type: DataTypes.STRING,
            allowNull: false,
            unique: true,
        },
        description: {
            type: DataTypes.STRING,
            allowNull: true,
        },
    }, {
        tableName: 'doctor_codes',
        timestamps: false,
    });
};