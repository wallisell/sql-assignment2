import React, { useState, useEffect } from "react";
import ChevronRightOutlinedIcon from "@mui/icons-material/ChevronRightOutlined";
import "../sass/components/_checkout.scss";
import PersonOutlineOutlinedIcon from "@mui/icons-material/PersonOutlineOutlined";
import { Button, Image, Input, Loading } from "@nextui-org/react";
import TripOriginOutlinedIcon from "@mui/icons-material/TripOriginOutlined";
import { translatePrice } from "../utils/numberWithCommas";
import { useHistory } from "react-router-dom";
import axios from "axios";
import { ToastContainer, toast } from "react-toastify";
function Checkout() {
  const [loading, setLoading] = useState(false);
  const [hoantat, setHoantat] = useState(false);
  const [totalPrice, setTotalPrice] = useState(0);
  const [products, setProducts] = useState([]);
  const [giamgia, setGiamgia] = useState(0);
  const [makm, setMakm] = useState(null);
  const history = useHistory();
  const notifyError = () =>
    toast.error(
      "Mã khuyến mãi này hiện không tồn tại, xin vui lòng kiểm tra lại!",
      {
        position: "top-right",
        autoClose: 3000,
        hideProgressBar: false,
        closeOnClick: true,
        pauseOnHover: true,
        draggable: true,
        progress: undefined,
        theme: "colored",
      }
    );
  const notifySuccess = () =>
    toast.success("🦄 Sử dụng mã khuyến mãi thành công!", {
      position: "top-right",
      autoClose: 5000,
      hideProgressBar: false,
      closeOnClick: true,
      pauseOnHover: true,
      draggable: true,
      progress: undefined,
      theme: "colored",
    });
  const notifySuccessPayment = () =>
    toast.success("🦄 Thanh toán đơn hàng thành công!", {
      position: "top-right",
      autoClose: 5000,
      hideProgressBar: false,
      closeOnClick: true,
      pauseOnHover: true,
      draggable: true,
      progress: undefined,
      theme: "colored",
    });
  useEffect(() => {
    async function fetchData() {
      const { data } = await axios.post("http://localhost:3001/cart", {
        makh: JSON.parse(localStorage.getItem("userInfo")).id,
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
    }
    fetchData();
    async function getMoney() {
      const { data } = await axios.post("http://localhost:3001/get-money", {
        madh: JSON.parse(localStorage.getItem("madh")).madh,
      });
      // localStorage.setItem('tongtien',JSON.stringify(data?.Tongtien))
      setTotalPrice(data?.Tongtien);
    }
    getMoney();
  }, []);
  const sudungkm = async () => {
    const response = await axios.post("http://localhost:3001/giamgia", {
      madh: JSON.parse(localStorage.getItem("madh"))?.madh,
      makm,
    });
    if (response.data?.code) {
      notifyError();
    } else {
      notifySuccess();
      setGiamgia(parseInt(response.data?.Giagiam || 0));
    }
  };
  const xuathoadon = async () => {
    setHoantat(true);
    notifySuccessPayment()
    await axios.post("http://localhost:3001/xuathoadon", {
      madh: JSON.parse(localStorage.getItem("madh"))?.madh,
      makm,
      tongtien: totalPrice + 30000,
    });
    setTimeout(() => {
      setHoantat(false);
      history.push('/')
    }, 2000);
  };
  return (
    <div className="checkout">
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
      <div className="checkout_info">
        <div className="title">Outerity</div>
        <div className="navigation">
          <div className="link">Giỏ hàng</div>
          <ChevronRightOutlinedIcon />
          <div className="info-ship">Thông tin giao hàng</div>
        </div>
        <div className="section-title">Thông tin giao hàng</div>
        <div className="user-account">
          <div className="logo">
            <PersonOutlineOutlinedIcon />
          </div>
          <div className="info">
            <div className="name">Lâm Tường (2012392wildcash1@gmail.com)</div>
            <div className="link">Đăng xuất</div>
          </div>
        </div>
        <div className="input_name">
          <Input
            bordered
            color="primary"
            placeholder="Họ và tên"
            width="100%"
          />
        </div>
        <div className="input_phone">
          <Input
            bordered
            color="primary"
            placeholder="Số điện thoại"
            width="100%"
          />
        </div>
        <div className="input_address">
          <Input bordered color="primary" placeholder="Địa chỉ" width="100%" />
        </div>
        <div className="ship-method">
          <div className="section-title">Phương thức vận chuyển</div>
          <div className="ship-method_card">
            <div className="region">
              <div className="logo">
                <TripOriginOutlinedIcon />
              </div>
              <span>Tỉnh khác</span>
            </div>
            <div className="fee">30,000 VND</div>
          </div>
        </div>
        <div className="payment-method">
          <div className="section-title">Phương thức thanh toán</div>
          <div className="ship-method_card">
            <div className="region">
              <div className="logo">
                <TripOriginOutlinedIcon />
              </div>
              <span>Thanh toán khi giao hàng (COD)</span>
            </div>
          </div>
        </div>
        <div className="action">
          <div className="action_cart">
            <div
              className="link"
              onClick={() => {
                history.push("/cart");
              }}
            >
              Giỏ hàng
            </div>
          </div>

          <div className="action_compelete">
            <Button
              size="lg"
              css={{ background: "#338dbc" }}
              onClick={xuathoadon}
            >
              Hoàn tất đơn hàng
            </Button>
          </div>
        </div>
      </div>
      <div className="checkout_product">
        {products.map((product) => (
          <CheckoutProduct {...product} />
        ))}
        <div className="voucher">
          <div className="input">
            <Input
              bordered
              color="primary"
              placeholder="Mã giảm giá"
              width="100%"
              onChange={(e) => setMakm(e.target.value)}
            />
          </div>
          <div className="btn" onClick={sudungkm}>
            <Button
              size="sm"
              css={{ background: "#338dbc", height: "40px" }}
              onClick={() => {
                setLoading(true);
                setTimeout(() => {
                  sudungkm();
                  setLoading(false);
                }, 2000);
              }}
            >
              {loading ? (
                <Loading color="currentColor" size="sm" />
              ) : (
                <>Sử dụng</>
              )}
            </Button>
          </div>
        </div>
        <div className="temp-calc">
          <div className="item">
            <div className="left">Tạm tính</div>
            <div className="right">{translatePrice(totalPrice)}</div>
          </div>
          <div className="item">
            <div className="left">Phí vận chuyển</div>
            <div className="right">{translatePrice(30000)}</div>
          </div>
          <div className="item">
            <div className="left">Giá giảm</div>
            <div className="right">{translatePrice(giamgia)}</div>
          </div>
        </div>
        <div className="total">
          <div className="total_text">Tổng cộng</div>
          <div className="total_price">
            {translatePrice(totalPrice + 30000 - giamgia)}
          </div>
        </div>
      </div>
      {hoantat && (
        <div className="loading">
          <Loading />
        </div>
      )}
    </div>
  );
}

const CheckoutProduct = (props) => {
  const { image, name, size, price, quantity } = props;
  return (
    <div className="checkout_product_card">
      <div className="info">
        <div className="image">
          <div className="image-wrapper">
            <Image width={80} src={image} />
          </div>
          <div className="quantity">{quantity}</div>
        </div>
        <div className="name_size">
          <div className="name">{name}</div>
          <div className="size">{size}</div>
        </div>
      </div>
      <div className="price">{translatePrice(price)}</div>
    </div>
  );
};

export default Checkout;
