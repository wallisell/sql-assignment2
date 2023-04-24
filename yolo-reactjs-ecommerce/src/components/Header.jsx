import {
  Button,
  Checkbox,
  Image,
  Input,
  Link,
  Modal,
  Row,
  Text,
  User,
} from "@nextui-org/react";
import React, {useState, useEffect} from "react";
import AccountCircleIcon from "@mui/icons-material/AccountCircle";
import ArrowDropDownIcon from "@mui/icons-material/ArrowDropDown";
import ShoppingCartOutlinedIcon from "@mui/icons-material/ShoppingCartOutlined";

import { useHistory } from "react-router-dom";
function Header(props) {
  const history = useHistory();
  const [username, setUsername] = useState("")
  const [accountType, setAccountType] = useState("");
  useEffect(() => {
    const getUser = JSON.parse(localStorage.getItem("userInfo"));
    setUsername(getUser.name);
    setAccountType(getUser.accountType);
  }) 
  const {login} = props;
  return (
    <div className="header">
      <div className="header_logo">
        <Link href="/">
          <Image src="https://file.hstatic.net/200000312481/file/logoo_bf8b94d84c4242109555c773681d1a61.png" />
        </Link>
      </div>
      <div className="header_hotline">
        <div className="image">
          <Image src="https://theme.hstatic.net/200000312481/1000699457/14/policy_icon_1.png?v=162" />
        </div>
        <div className="text">
          <Text size={13} weight="bold">
            Hotline mua hàng
          </Text>
          <Text size={12} color="#5f5f5f" weight="bold">
            Gọi ngay: 086 2642568
          </Text>
        </div>
      </div>
      <div className="header_ship">
        <div className="image">
          <Image src="https://theme.hstatic.net/200000312481/1000699457/14/policy_icon_2.png?v=162" />
        </div>
        <div className="text">
          <Text size={13} weight="bold">
            Giao hàng tận nơi
          </Text>
          <Text size={12} color="#5f5f5f" weight="bold">
            Miễn phí từ 5 sản phẩm
          </Text>
        </div>
      </div>
      <div className="header_return">
        <div className="image">
          <Image src="https://theme.hstatic.net/200000312481/1000699457/14/policy_icon_3.png?v=162" />
        </div>
        <div className="text">
          <Text size={13} weight="bold">
            1 Đổi 1 nếu lỗi hàng
          </Text>
          <Text size={12} color="#5f5f5f" weight="bold">
            Trong vòng 7 ngày
          </Text>
        </div>
      </div>
      <div className="header_account">
        {!username && (
          <>
            <div className="logo">
              <AccountCircleIcon cursor="pointer" sx={{ fontSize: "35px" }} />
            </div>
            <div
              className="text"
              onClick={() => {
                history.push("/login");
              }}
            >
              <Text>Đăng nhập / Đăng ký</Text>
              <div className="dropdown">
                <Text weight="bold">Tài khoản của tôi</Text>
                <ArrowDropDownIcon />
              </div>
            </div>
          </>
        )}

        {username && (
          <div
            onClick={() => {
              history.push("/account");
            }}
          >
            <User
              src="https://i.pravatar.cc/150?u=a042581f4e29026704d"
              name={username}
              description={accountType}
            />
          </div>
        )}
      </div>
      <div
        className="header_cart"
        onClick={() => {
          history.push("/cart");
        }}
      >
        <div className="box">
          <div className="logo">
            <ShoppingCartOutlinedIcon />
          </div>
        </div>
        <div className="text">
          <Text>Giỏ hàng</Text>
        </div>
      </div>
    </div>
  );
}

export default Header;
