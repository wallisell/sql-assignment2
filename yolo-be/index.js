require("dotenv").config();
const express = require("express");
const dbConnect = require("./db/dbConnect");
const app = express();
const PORT = process.env.PORT || 3001;
const cors = require("cors");
const productRoute = require("./routes/productRoute");
const authRoute = require("./routes/authRoute");
const userRoute = require("./routes/userRoute");


dbConnect();


app.use(express.json());
app.use(
  cors({
    exposedHeaders: ["Content-Range,X-Content-Range"],
    methods: ['POST', 'GET'],
    origin: "*"
  })
);
app.use("/product", productRoute);
app.use('/auth', authRoute)
app.use("/",userRoute);
//connect db

app.listen(PORT, () => {
  console.log("Server running on ", PORT);
});

