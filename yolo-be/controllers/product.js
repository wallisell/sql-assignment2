const config = require("../config/config");
const sql = require("mssql");
const {fromPairs} = require('lodash')
const productController = {
  getAll: async (req, res) => {
    try {
      const pool = await sql.connect(config);
      const response = await pool.request().query(`EXEC laytatcasanpham`);
      return res.status(200).json(response.recordset);
    } catch (err) {
      return res.status(200).json(err);
    }
  },
  getDetail: async (req, res) => {
     try {
       const pool = await sql.connect(config);
       const {masp} = req.body
       const response = await pool
       .request()
       .query(`EXEC laythongtinchitietsanpham '${masp}'`)

      const responseData = {
        id: response.recordset[0].MaSP,
        name: response.recordset[0].TenSP,
        price: response.recordset[0].Gianiemyet,
        material: response.recordset[0].Chatlieu,
        image: response.recordset[0].Hinhanh,
        suplierId: response.recordset[0].MaNCC,
        itemCode: response.recordset[0].MaMH,
        description: response.recordset[0].Mota,
        size: fromPairs(
          response.recordset.map((item) => [
            item["Loaisize"],
            item["Soluongcon"],
          ])
        ),
      };
       return res.status(200).json(responseData);
     } catch (err) {
       return res.status(200).json(err);
     }
  }
};

module.exports = productController;
