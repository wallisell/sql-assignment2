import React from "react";
import { Button, Input, Link, Loading } from "@nextui-org/react";
import "../sass/components/_signuppage.scss";
import { useHistory } from "react-router-dom";
import { ToastContainer, toast } from "react-toastify";
import axios from "axios";
function Signup() {
  const [loading, setLoading] = React.useState(false);
  const [fullName, setFullName] = React.useState("");
  const [email, setEmail] = React.useState("");
  const [address, setAddress] = React.useState("");
  const [username, setUsername] = React.useState("");
  const [password, setPassword] = React.useState("");
  const notify = () =>
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
  const notifyError = (messageError) =>
    toast.error(messageError, {
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
  const submitSignup = async () => {
    const { data } = await axios.post("http://localhost:3001/auth/register", {
      fullName,
      email,
      address,
      username,
      password,
    });
    console.log(data);
    setLoading(true);
    if (data?.code || data?.message) {
      if (data?.code) {
        setTimeout(() => {
          notifyError("Lỗi: Mật khẩu chứa ít nhất 1 kí tự đặc biệt: @/$/&/!/#");
        }, 1000);
      } else {
        setTimeout(() => {
          notifyError("Tài khoản đã tồn tại, vui lòng nhập tài khoản mới");
        }, 1000);
      }

      setTimeout(() => {
        setLoading(false);
      }, 3000);
    } else {
      setTimeout(() => {
        notify();
      }, 1000);
      setTimeout(() => {
        setLoading(false);
        history.push("/login");
      }, 3000);
    }
  };
  return (
    <div className="signup-page">
      <div className="wrapper">
        <div className="title">SIGN UP</div>
        <div className="info">
          <div className="left">
            <div className="input">
              <Input
                underlined
                placeholder="Full name"
                color="primary"
                width="100%"
                onChange={(e) => setFullName(e.target.value)}
              />
            </div>
            <div className="input">
              <Input
                underlined
                placeholder="Email"
                color="primary"
                width="100%"
                onChange={(e) => setEmail(e.target.value)}
              />
            </div>
            <div className="input">
              <Input
                underlined
                placeholder="Address"
                color="primary"
                width="100%"
                onChange={(e) => setAddress(e.target.value)}
              />
            </div>
          </div>
          <div className="right">
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
            <div className="input">
              <Input
                underlined
                placeholder="Confirm Password"
                type="password"
                color="primary"
                width="100%"
              />
            </div>
          </div>
        </div>

        <div className="btn-login">
          <Button shadow color="gradient" width="100%" onClick={submitSignup}>
            Register
          </Button>
        </div>
        <div className="link-sigup">
          <Link href="/login">LOGIN</Link>
        </div>
      </div>
      {loading && (
        <div className="loading">
          <Loading color="primary"></Loading>
        </div>
      )}
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

export default Signup;
