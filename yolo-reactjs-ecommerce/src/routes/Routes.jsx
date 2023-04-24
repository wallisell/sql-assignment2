import React from "react";
import { Route } from "react-router-dom";
import Home from "../pages/Home";
import Catalog from "../pages/Catalog";
import Cart from "../pages/Cart";
import Product from "../pages/Product";
import UserProfile from "../pages/UserProfile";
const Routes = ({ setLogin }) => {
  return (
    <>
      <Route path="/" exact component={Home} />
      <Route exact path="/catalog" component={Catalog} />
      <Route path="/catalog/:slug" component={Product} />
      <Route path="/cart" component={Cart} />
      <Route path="/account" render={() => <UserProfile setLogin={setLogin} />} />
    </>
  );
};

export default Routes ;
