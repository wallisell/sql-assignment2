import React, { useState } from "react";
import { Button, Input, Link, Loading } from "@nextui-org/react";
import "../sass/components/_loginpage.scss";
import { useHistory } from "react-router-dom";
import axios from 'axios'
import { ToastContainer, toast } from "react-toastify";
function Login(props) {
  const [loading, setLoading] = React.useState(false);
  const [username, setUsername] = useState("")
  const [password, setPassword] = useState("");
  const { setLogin } = props;
  const notifySuccess = () =>
    toast.success("🦄 Tạo tài khoản thành công", {
      position: "top-right",
      autoClose: 1500,
      hideProgressBar: false,
      closeOnClick: true,
      pauseOnHover: true,
      draggable: true,
      progress: undefined,
      theme: "colored",
    });
    
  const history = useHistory();
  const submitLogin = async () => {
    const {data} = await axios.post('http://localhost:3001/auth/login', {
      username,
      password
    })
    const notifyError = () =>
      toast.error(data.message, {
        position: "top-right",
        autoClose: 3000,
        hideProgressBar: false,
        closeOnClick: true,
        pauseOnHover: true,
        draggable: true,
        progress: undefined,
        theme: "colored",
      });
    setLoading(true)    
    setTimeout(() => {
      setLoading(false);
      if (data.code == 200) {
        setLogin(true);
        notifySuccess()
        const accountType = (data.MaKH ? "Tài khoản khách": "Tài khoản nhân viên")
        localStorage.setItem(
          "userInfo",
          JSON.stringify({
            id: data.MaKH || data.MaNV,
            name: data.Hoten || data.Ten,
            email: data.Email,
            accountType,
            address: data.Diachi,
          })
        );
        if (accountType == "Tài khoản khách") history.push("/")
        else history.push('/admin')
      }
      else {
        notifyError()
      }
    }, 2000);
  };
  return (
    <div className="login-page">
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
      <div className="wrapper">
        <div className="title">LOGIN</div>
        <div className="input">
          <Input
            underlined
            placeholder="Username"
            color="primary"
            width="100%"
            onChange={(e) => setUsername(e.target.value)}
          />
        </div>
        <div className="input">
          <Input
            underlined
            placeholder="Password"
            type="password"
            color="primary"
            width="100%"
            onChange={(e) => setPassword(e.target.value)}
          />
        </div>
        <div className="btn-login">
          <Button shadow color="gradient" width="100%" onClick={submitLogin}>
            Login
          </Button>
        </div>
        <div className="link-sigup">
          <Link href="/signup">SIGN UP</Link>
        </div>
      </div>
      {loading && (
        <div className="loading">
          <Loading color="primary"></Loading>
        </div>
      )}
    </div>
  );
}

export default Login;
