const express = require("express");
const userController = require("../controllers/userController");
const router = express.Router();

router.post("/cart", userController.getCart);
router.post("/add-to-cart", userController.addToCart);
router.post("/get-size", userController.getSize);
router.post("/remove-product", userController.removeProduct)
router.post("/get-money", userController.getMoney);
router.post("/giamgia", userController.tinhgiamgia);
router.post('/filter', userController.filterProduct)
router.post("/update-quantity", userController.updateQuantity);
router.post('/xuathoadon', userController.xuathoadon)
router.post("/layhoadon", userController.layhoadon);


module.exports = router;
