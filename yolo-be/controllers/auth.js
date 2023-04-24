const config = require("../config/config");
const sql = require("mssql");
const {isEmpty} = require('lodash')

const authController = {
  login: async (req, res) => {
    try {
      const pool = await sql.connect(config);
      const { username, password } = req.body;
      const response = await pool
        .request()
        .query(`EXEC dangnhap '${username}', '${password}'`);
      console.log(response.recordset)
      return res.status(200).json({ ...response.recordset[0] , code:200});
    } catch (err) {
      return res.status(200).json({
        code: 101,
        message: err.originalError.info.message
      });
    }
  },
  register: async (req, res) => {
    try {
      const pool = await sql.connect(config);
      const { username, password, address, email, fullName } = req.body;
      const maTK = `TK${parseInt(Math.random() * 10000)}`;
      const maKH = `KH${parseInt(Math.random() * 10000)}`;
      const gioitinh = ["F", "M"][Math.floor(Math.random() * 2)];
      const checkUsername = await pool.request().query(`SELECT * FROM taikhoan WHERE taikhoan.username = '${username}'`)
      if (!isEmpty(checkUsername.recordset))
        return res
          .status(200)
          .json({
            message: "Tài khoản đã tồn tại, vui lòng nhập tài khoản mới",
          });
      const response = await pool
        .request()
        .query(
          `EXEC dangky '${maTK}', '${maKH}', '${username}', '${password}', '${email}', N'${fullName}', '${address}', '${gioitinh}','2000-07-08'`
        );
      return res.status(200).json(response);
    } catch (err) {
      return res.status(200).json(err);
    }
  },
};
module.exports = authController;
