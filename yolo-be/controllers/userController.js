const config = require("../config/config");
const sql = require("mssql");
const userController = {
  getCart: async (req, res) => {
    try {
      const { makh } = req.body;
      const pool = await sql.connect(config);
      const { recordset } = await pool
        .request()
        .query(`EXEC laythongtingiohang '${makh}'`);
      return res.status(200).json(recordset);
    } catch (err) {
      return res.status(200).json(err);
    }
  },
  addToCart: async (req, res) => {
    try {
      let { masp, size, quantity, makh } = req.body;
      const pool = await sql.connect(config);
      const orderStatus = await pool
        .request()
        .query(`select trangthai, madh from donhang where maKH = '${makh}'`);

      const check = orderStatus.recordset.filter(
        (item) => item.trangthai == "Chưa giao hàng"
      );
      let madh = check[0]?.madh;
      if (check.length != 0) {
        await pool
          .request()
          .query(
            `EXEC chonsanpham '${madh}','${masp}','${size}','${quantity}','${makh}'`
          );
      } else {
        madh = `DH${parseInt(Math.random() * 10000)}`;
        await pool
          .request()
          .query(
            `EXEC insertdonhang '${madh}', N'Chưa giao hàng', '2022-12-09', 'Online', '${makh}'`
          );
        await pool
          .request()
          .query(
            `EXEC chonsanpham '${madh}','${masp}','${size}','${quantity}','${makh}'`
          );
      }

      return res.status(200).json({ madh });
    } catch (err) {
      return res.status(200).json(err);
    }
  },
  getSize: async (req, res) => {
    try {
      let { idSize } = req.body;
      const pool = await sql.connect(config);
      const { recordset } = await pool
        .request()
        .query(`select loaisize from size where id = '${idSize}'`);
      return res.status(200).json(recordset[0]);
    } catch (err) {
      return res.status(200).json(err);
    }
  },
  removeProduct: async (req, res) => {
    try {
      let { masp, madh, idSize } = req.body;
      const pool = await sql.connect(config);
      const { recordset } = await pool
        .request()
        .query(`exec xoasanpham '${madh}', '${masp}', '${idSize}'`);
      return res.status(200).json({ message: "thành công" });
    } catch (err) {
      return res.status(200).json(err);
    }
  },
  getMoney: async (req, res) => {
    try {
      let { madh } = req.body;
      const pool = await sql.connect(config);
      const { recordset } = await pool
        .request()
        .query(
          `EXEC Tinhtongtien '${madh}'; SELECT dbo.Tinhtongtien('${madh}') AS Tongtien`
        );
      return res.status(200).json(recordset[0]);
    } catch (err) {
      return res.status(200).json(err);
    }
  },
  tinhgiamgia: async (req, res) => {
    try {
      const pool = await sql.connect(config);
      let { madh, makm } = req.body;
      const { recordset } = await pool
        .request()
        .query(
          `EXEC Tinhgiagiam '${madh}', '${makm}'; SELECT dbo.Tinhgiagiam('${madh}','${makm}') AS Giagiam`
        );
      return res.status(200).json(recordset[0]);
    } catch (err) {
      return res.status(200).json(err);
    }
  },
  filterProduct: async (req, res) => {
    try {
      const { type, price } = req.body;
      const pool = await sql.connect(config);
      const { recordset } = await pool
        .request()
        .query(`EXEC laysanphamtheoloaivagia '${price}', N'${type}'`);
      return res.status(200).json(recordset);
    } catch (err) {
      return res.status(200).json(err);
    }
  },
  updateQuantity: async (req, res) => {
    try {
      const { madh, masp, soluong } = req.body;
      const pool = await sql.connect(config);
      await pool
        .request()
        .query(
          `EXEC capnhatsoluong '${madh}', '${masp}', ${soluong}; EXEC Tinhtongtien '${madh}'; SELECT dbo.Tinhtongtien('${madh}') AS Tongtien`
        );
      return res.status(200).json({ message: "thành công" });
    } catch (err) {
      return res.status(200).json(err);
    }
  },
  xuathoadon: async (req, res) => {
    try {
      let { madh, makm, tongtien } = req.body;
      const pool = await sql.connect(config);
      if (!!makm) makm = `'${makm}'`
      const mahd =  `HD${parseInt(Math.random() * 10000)}`;
      // console.log(`EXEC xuathoadon '${mahd}', '${madh}', ${null}, ${makm}`);
      await pool
        .request()
        .query(
          `EXEC xuathoadon '${mahd}', '${madh}', ${null}, ${makm}, ${tongtien}`
        );
      return res.status(200).json({ message: "thành công" });
    } catch (err) {
      return res.status(200).json(err);
    }
  },
  layhoadon: async (req, res) => {
    try {
      const pool = await sql.connect(config);
      const {recordset} = await pool
        .request()
        .query(
          `select * from hoadon`
        );
      return res.status(200).json(recordset);
    } catch (err) {
      return res.status(200).json(err);
    }
  },
};
module.exports = userController;
