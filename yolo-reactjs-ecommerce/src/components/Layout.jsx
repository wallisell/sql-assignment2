import React from "react";

import { BrowserRouter, Route, Switch } from "react-router-dom";

import Header from "./Header";
import Footer from "./Footer";
import ProductViewModal from "./ProductViewModal";
import Routes from "../routes/Routes";
import AdminPage from "../pages/Admin";
import Checkout from "../pages/Checkout";
import Login from "../pages/Login";
import Signup from "../pages/Signup";
const Layout = () => {
  const [login, setLogin] = React.useState(false);
  return (
    <BrowserRouter>
      <Route
        render={(props) => (
          <div>
            <Switch>
              <Route path="/admin" render={() => <AdminPage />} />
              <Route path="/checkout/:id" component={Checkout} />
              <Route
                path="/login"
                render={() => <Login setLogin={setLogin} />}
              />
              <Route path="/signup" component={Signup} />
              <Route path="/">
                <Header {...props} login={login} />
                <div className="container">
                  <div className="main">
                    <Routes setLogin={setLogin} />
                  </div>
                  <Footer />
                </div>
              </Route>
            </Switch>
            <ProductViewModal />
          </div>
        )}
      />
    </BrowserRouter>
  );
};

export default Layout;
