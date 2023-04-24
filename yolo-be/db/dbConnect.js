var sql = require("mssql");
const config = require("../config/config");
const dbConnect = () => {
  sql.connect(config, function (err) {
    try {
      console.log("DB connected...");
      // create Request object
      var request = new sql.Request();

      // query to the database and get the records
      // request.query("select * from sanpham", function (err, recordset) {
      //   if (err) console.log(err);
      //   console.log(recordset)
      //   // send records as a response
      // });
    } catch (err) {
      console.log(err);
    }
  });
};
module.exports = dbConnect;
