import { Button, Image, Text } from "@nextui-org/react";
import React, { useState, useEffect } from "react";
import { translatePrice } from "../utils/numberWithCommas";
import AddIcon from "@mui/icons-material/Add";
import RemoveIcon from "@mui/icons-material/Remove";
import { ToastContainer, toast } from "react-toastify";
import productData from "../assets/fake-data/products";
import { useParams } from "react-router-dom";
import axios from "axios";
function Product() {
  const [amount, setAmount] = React.useState(1);
  const [product, setProduct] = React.useState({
    size: {},
    name: "",
    price: 0,
    description: "",
  });
  const [makh, setMakh] = useState();
  const [masp, setMasp] = useState();
  const [size, setSize] = useState();
  const { slug } = useParams();
  useEffect(() => {
    async function fetchData() {
      const responeData = await productData.getDetailProduct(slug);
      console.log(responeData);
      setProduct(responeData);
      setMasp(responeData.id);
    }
    fetchData();
  }, []);
  const [choose, setChoose] = React.useState(0);
  useEffect(() => {
    window.scrollTo(0, 0);
    const fetchData = JSON.parse(localStorage.getItem("userInfo"));
    setMakh(fetchData.id);
  }, []);
  const addToCart = async () => {
    notify();
    const {data} = await axios.post("http://localhost:3001/add-to-cart", {
      size: size?.trim(),
      masp,
      quantity: amount,
      makh,
    });
    localStorage.setItem("madh",JSON.stringify(data));
  };
  const notify = () => {
    toast.success("Thêm vào giỏ hàng thành công", {
      position: "top-right",
      autoClose: 5000,
      hideProgressBar: false,
      closeOnClick: true,
      pauseOnHover: true,
      draggable: true,
      progress: undefined,
      theme: "colored",
    });
  };

  return (
    <div className="product_detail">
      <div className="product_detail_image">
        <Image src={product.image} />
      </div>
      <div className="product_detail_info">
        <div className="product_detail_info_name">
          <Text weight="bold" size={24}>
            {product.name}
          </Text>
        </div>
        <div className="product_detail_info_price">
          <Text color="red" weight="bold" size={20}>
            {translatePrice(product.price)}
          </Text>
        </div>
        <div className="product_detail_info_size">
          {Object.keys(product.size).map((item, index) => (
            <Size
              size={item}
              index={index}
              choose={choose}
              setChoose={setChoose}
              setSize={setSize}
            />
          ))}
        </div>
        <div className="product_detail_info_quantity">
          <button
            className="increase"
            onClick={() => {
              setAmount(amount + 1);
            }}
          >
            <AddIcon fontSize="8px" />
          </button>
          <div className="product_detail_info_quantity_value">{amount}</div>
          <button
            className="decrease"
            onClick={() => {
              if (amount > 1) {
                setAmount(amount - 1);
              }
            }}
          >
            <RemoveIcon fontSize="8px" />
          </button>
        </div>
        <div className="product_detail_info_btn">
          <Button color="#ededed" onClick={addToCart}>
            THÊM VÀO GIỎ HÀNG
          </Button>
        </div>
        <div className="product_detail_info_desc">
          <div className="title">Mô tả</div>
          <div className="desc">{product.description}</div>
        </div>
      </div>
      <ToastContainer
        position="top-right"
        autoClose={5000}
        hideProgressBar={false}
        newestOnTop={false}
        closeOnClick
        rtl={false}
        pauseOnFocusLoss
        draggable
        pauseOnHover
        theme="colored"
      />
    </div>
  );
}

const Size = ({ size, index, choose, setChoose, setSize }) => {
  return (
    <div
      className={`size_wrapper_${choose == index ? "choose" : "notchoose"}`}
      onClick={() => {
        console.log("choose", size);
        setChoose(index);
        setSize(size) ;
      }}
    >
      {size}
    </div>
  );
};

export default Product;
