import React, { useEffect, useRef, useState } from "react";

import Helmet from "../components/Helmet";

import { Checkbox } from "@nextui-org/react";
import productData from "../assets/fake-data/products";
import Button from "../components/Button";
import InfinityList from "../components/InfinityList";
import { translatePrice } from "../utils/numberWithCommas";
import axios from "axios";
const Catalog = () => {
  const [products, setProducts] = useState([]);
  const [selectType, setSelecType] = useState("Tất cả");
  const [selectPriceValue, setSelectPriceValue] = useState(100000);
  useEffect(() => {
    async function fetchAllProduct() {
      setProducts(await productData.getAllProducts());
    }
    if (selectType == "Tất cả") fetchAllProduct();
    else {
      const searchFilter = async () => {
        const { data } = await axios.post("http://localhost:3001/filter", {
          type: selectType,
          price: selectPriceValue,
        });
        setProducts(data);
      };
      searchFilter();
    }
  }, [selectType, selectPriceValue]);
  const filterPrice = [100000, 300000, 500000];
  const filterCollection = ["Tất cả", "Áo", "Quần", "Giày"];
  const [selectPrice, setSelectPrice] = useState(0);
  const [selectCollection, setSelectCollection] = useState(0);

  const filterRef = useRef(null);
  const showHideFilter = () => filterRef.current.classList.toggle("active");

  return (
    <Helmet title="Sản phẩm">
      <div className="catalog">
        <div className="catalog__filter" ref={filterRef}>
          <div
            className="catalog__filter__close"
            onClick={() => showHideFilter()}
          >
            <i className="bx bx-left-arrow-alt"></i>
          </div>
          <div className="catalog__filter__widget">
            <div className="catalog__filter__widget__title">
              danh mục sản phẩm
            </div>
            <div className="catalog__filter__widget__content">
              {filterCollection.map((collection, index) => (
                <Checkbox
                  color="primary"
                  labelColor="primary"
                  defaultSelected={index == 0 ? true : false}
                  onChange={() => {
                    setSelectCollection(index);
                    setSelecType(collection);
                  }}
                  isSelected={selectCollection == index ? true : false}
                >
                  {collection}
                </Checkbox>
              ))}
            </div>
          </div>

          <div className="catalog__filter__widget">
            <div className="catalog__filter__widget__title">giá</div>
            <div className="catalog__filter__widget__content">
              {filterPrice.map((price, index) => (
                <Checkbox
                  color="warning"
                  labelColor="warning"
                  defaultSelected={index == 0 ? true : false}
                  onChange={() => {
                    setSelectPrice(index);
                    setSelectPriceValue(price);
                  }}
                  isSelected={selectPrice == index ? true : false}
                >
                  {"> "}
                  {translatePrice(price)}
                </Checkbox>
              ))}
            </div>
          </div>
        </div>
        <div className="catalog__filter__toggle">
          <Button size="sm" onClick={() => showHideFilter()}>
            bộ lọc
          </Button>
        </div>
        <div className="catalog__content">
          <InfinityList data={products} />
        </div>
      </div>
    </Helmet>
  );
};

export default Catalog;
