const express = require('express');
const productController = require('../controllers/product');
const router = express.Router();

router.post('/all', productController.getAll)
router.post("/detail", productController.getDetail);

module.exports = router;