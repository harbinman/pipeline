// dbConnection.js
const mysql2 = require("mysql2");
require("dotenv").config();

// 数据库连接配置
const connectionConfig = {
  host: process.env.HOST,
  user: process.env.USER,
  password: process.env.PASSWORD,
  database: process.env.DATABASE,
};

// 创建并导出数据库连接
const createConnection = () => {
  return mysql2.createConnection(connectionConfig);
};

module.exports = {
  createConnection,
};
