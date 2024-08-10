// mysql.js
const { createConnection } = require("./dbConnection");

// 执行 SQL 查询的函数
const executeQuery = (sql, callback) => {
  const connection = createConnection();

  connection.connect((err) => {
    if (err) {
      console.error("Error connecting to the database:", err.stack);
      return callback(err, null); // 通过回调函数返回错误
    }

    connection.query(sql, (err, results) => {
      connection.end(); // 关闭连接

      if (err) {
        console.error("Error executing query:", err.stack);
        return callback(err, null); // 通过回调函数返回错误
      }

      callback(null, results); // 通过回调函数返回查询结果
    });
  });
};

module.exports = {
  executeQuery,
};
