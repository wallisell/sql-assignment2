import React, { useEffect, useState } from "react";
import "../sass/components/_orderPaymentLayout.scss";
import { useSelector } from "react-redux";
import { Link } from "react-router-dom";

import Helmet from "../components/Helmet";
import CartItem from "../components/CartItem";
import Button from "../components/Button";
import Typography from "@material-ui/core/Typography";
import productData from "../assets/fake-data/products";
import { numberWithCommas } from "../utils/numberWithCommas";
import { Container, Row, Text } from "@nextui-org/react";
import { Drawer } from "@material-ui/core";
import ProductCartCard from "../components/ProductCartCard";
import OrderPayment from "../components/OrderPayment";
import axios from "axios";
const Cart = () => {
  const [products, setProducts] = useState([]);

  const cartItems = useSelector((state) => state.cartItems.value);

  const [totalProducts, setTotalProducts] = useState(0);

  const [totalPrice, setTotalPrice] = useState(0);

  useEffect(() => {
    async function fetchData(getUserId) {
      const { data } = await axios.post("http://localhost:3001/cart", {
        makh: getUserId,
      });
      const mapData = data.map((item) => {
        return {
          id: item?.MaSP[0],
          image: item?.Hinhanh,
          name: item?.TenSP,
          price: item?.Gianiemyet,
          idSize: item?.IDsize,
          quantity: item?.Soluong,
        };
      });
      setProducts(mapData);
      setTotalProducts(mapData.length);
    }

    const getUserId = JSON.parse(localStorage.getItem("userInfo"))?.id;
    fetchData(getUserId);
    async function getMoney() {
      const { data } = await axios.post("http://localhost:3001/get-money", {
        madh: JSON.parse(localStorage.getItem("madh")).madh,
      });
      // localStorage.setItem('tongtien',JSON.stringify(data?.Tongtien))
      setTotalPrice(data?.Tongtien);
    }
    getMoney();
  }, []);

  return (
    <>
      <Row justify="center">
        <Text weight="bold" size={30}>
          Giỏ hàng của bạn
        </Text>
      </Row>
      <Row justify="center">
        <Text size={15}>Có {totalProducts} sản phẩm trong giỏ hàng</Text>
      </Row>
      <div className="order-payment-layout">
        <div className="order-payment-layout_order">
          <Container>
            {products.map((product) => (
              <ProductCartCard
                {...product}
                setTotalPrice={setTotalPrice}
                totalPrice={totalPrice}
                setProducts={setProducts}
                products={products}
              />
            ))}
          </Container>
        </div>
        <div className="order-payment-layout_payment">
          <OrderPayment totalPrice={totalPrice} />
        </div>
      </div>
    </>
  );
};

export default Cart;
