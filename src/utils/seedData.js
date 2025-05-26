const { sequelize, Role, JobTitle, Province, City, District, Village } = require('../models');

const seed = async () => {
  try {
    await sequelize.sync({ force: true }); // Hapus dan buat ulang tabel

    await Role.bulkCreate([
      { name: 'Manager' },
      { name: 'Admin' },
      { name: 'Resepsionis' },
      { name: 'Manajemen' },
      { name: 'Finance' },
      { name: 'Kasir' },
      { name: 'Purchasing' }
    ]);

    await JobTitle.bulkCreate([
      { name: 'Perawat' },
      { name: 'Bidan' },
      { name: 'Dokter' },
      { name: 'Lainnya' }
    ]);

    // 1. Province
    const [jawaTimur] = await Province.bulkCreate([
      { name: "Jawa Timur" },
    ], { returning: true });

    // 2. City
    const [kotaMalang] = await City.bulkCreate([
      { name: "Kota Malang", provinceId: jawaTimur.id },
    ], { returning: true });

    // 3. Districts
    const [klojen, lowokwaru] = await District.bulkCreate([
      { name: "Klojen", cityId: kotaMalang.id },
      { name: "Lowokwaru", cityId: kotaMalang.id },
    ], { returning: true });

    // 4. Villages
    await Village.bulkCreate([
      // Klojen
      { name: "Bareng", districtId: klojen.id },
      { name: "Kasin", districtId: klojen.id },

      // Lowokwaru
      { name: "Jatimulyo", districtId: lowokwaru.id },
      { name: "Dinoyo", districtId: lowokwaru.id },
    ]);

    console.log('✅ Seeder selesai');
    process.exit();
  } catch (err) {
    console.error('❌ Seeder error:', err);
    process.exit(1);
  }
};

seed();
