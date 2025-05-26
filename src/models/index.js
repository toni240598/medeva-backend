const fs = require("fs");
const path = require("path");
const { Sequelize, DataTypes } = require("sequelize");

// Setup koneksi ke PostgreSQL
const sequelize = new Sequelize(process.env.DATABASE_URL || 'postgres://user:pass@localhost:5432/dbname', {
  dialect: "postgres",
  logging: false,
});

const db = {};

// Ambil semua file model di folder ini (kecuali index.js)
fs.readdirSync(__dirname)
  .filter((file) => file !== "index.js" && file.endsWith(".js"))
  .forEach((file) => {
    const model = require(path.join(__dirname, file))(sequelize, DataTypes);
    db[model.name] = model;
  });

// Jalankan fungsi associate() jika ada di masing-masing model
Object.keys(db).forEach((modelName) => {
  if (db[modelName].associate) {
    db[modelName].associate(db); // <-- relasi antar model terjadi di sini
  }
});

// Export objek sequelize dan semua model
db.sequelize = sequelize;
db.Sequelize = Sequelize;

module.exports = db;