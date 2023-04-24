import { Text } from "@nextui-org/react";
import React, {useState, useEffect} from "react";
import "./UserProfile.scss";
import AdjustOutlinedIcon from "@mui/icons-material/AdjustOutlined";
import {useHistory} from 'react-router-dom'
function UserProfile(props) {
  const {setLogin} = props
  const history = useHistory()
  const [username, setUsername] = useState("");
  const [email, setEmail] = useState("");
  const [address, setAddress] = useState("");
  useEffect(() => {
    const getUser = JSON.parse(localStorage.getItem('userInfo'))
    setUsername(getUser.name)
    setEmail(getUser.email);
    setAddress(getUser.address);
  }, [])
  const logOut = async () => {
    setLogin(false)
    localStorage.setItem('userInfo',JSON.stringify({}))
    history.push('/')
  }
  return (
    <div className="user-profile">
      <div className="title">
        <Text weigth="bold" size={50}>
          Tài khoản của bạn
        </Text>
        <div className="drawer"></div>
      </div>
      <div className="account">
        <div className="account_left">
          <div className="account_left_title">
            <Text weight="bold">TÀI KHOẢN</Text>
          </div>
          <div className="account_left_list">
            <div className="account_left_item">
              <AdjustOutlinedIcon />
              <Text>Thông tin tài khoản</Text>
            </div>
            <div className="account_left_item" onClick={logOut}>
              <AdjustOutlinedIcon />
              <Text>Đăng xuất</Text>
            </div>
          </div>
        </div>
        <div className="account_right">
          <div className="account_right_title">
            <Text weight="bold">THÔNG TIN TÀI KHOẢN</Text>
          </div>
          <div className="account_right_info">
            <Text>{username}</Text>
            <Text>{email}</Text>
            <Text>{address}</Text>
          </div>
        </div>
      </div>
    </div>
  );
}

export default UserProfile;
