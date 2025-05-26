const express = require('express');
const cors = require('cors');
const db = require('./models');
const apiRoutes = require('./routes/api');
const responseMiddleware = require('./middlewares/responseMiddleware');
const errorMiddleware = require('./middlewares/errorMiddleware');

const app = express();

app.use(cors());
app.use(express.json());
db.sequelize.sync({ alter: true })  // atau force: true
  .then(() => {
    console.log("✅ Database synced!");
  })
  .catch((err) => {
    console.error("❌ Failed to sync database:", err);
  });

app.use(responseMiddleware); // harus di taruh setelah app.use dari library
app.use('/api', apiRoutes);
app.use('/api/files', express.static("uploads"));
app.use((req, res) => {
    res.status(404).json({ message: 'Route not found' });
});
app.use(errorMiddleware); // harus ditaruh di akhir agar terbaca

module.exports = app;
