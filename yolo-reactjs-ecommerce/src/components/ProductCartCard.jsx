import { Container, Grid, Image, Input, Row, Text } from "@nextui-org/react";
import React from "react";
import CloseIcon from "@mui/icons-material/Close";
import AddIcon from "@mui/icons-material/Add";
import RemoveIcon from "@mui/icons-material/Remove";
import "../sass/components/_productCartCard.scss";
import { translatePrice } from "../utils/numberWithCommas";
import axios from "axios";
function ProductCartCard(props) {
  const [size, setSize] = React.useState("");
  const [madh, setMadh] = React.useState("");
  const {
    id,
    image,
    name,
    price,
    idSize,
    setTotalPrice,
    totalPrice,
    setProducts,
    products,
    quantity,
  } = props;
  const [amount, setAmount] = React.useState(quantity);
  React.useEffect(() => {
    const fetchSize = async () => {
      const { data } = await axios.post("http://localhost:3001/get-size", {
        idSize,
      });
      setSize(Object.values(data));
    };
    fetchSize();
    setMadh(() => JSON.parse(localStorage.getItem("madh")).madh);
  }, []);
  const removeProduct = async () => {
    await axios.post("http://localhost:3001/remove-product", {
      masp: id,
      madh,
      idSize,
    });
  };
  return (
    <div className="product-cart-card-container">
      <Grid.Container gap={2}>
        <Grid xs={2}>
          <Image
            width={320}
            height={180}
            src={image}
            alt="Default Image"
            objectFit="contain"
          />
        </Grid>
        <Grid xs={10}>
          <Grid xs={10}>
            <div className="product-cart-card_info">
              <Text weight="bold">{name}</Text>
              <Text>{translatePrice(price)}</Text>
              <Text>{size || "XL"}</Text>
              <div className="amount">
                <button
                  className="increase"
                  onClick={async () => {
                    await axios.post("http://localhost:3001/update-quantity", {
                      madh: JSON.parse(localStorage.getItem("madh"))?.madh,
                      masp: id,
                      soluong: amount + 1,
                    });
                    setAmount(amount + 1);
                    setTotalPrice(totalPrice + price);
                  }}
                >
                  <AddIcon fontSize="8px" />
                </button>
                <div className="amount_value">{amount}</div>
                <button
                  className="decrease"
                  onClick={async () => {
                    if (amount > 1) {
                      await axios.post(
                        "http://localhost:3001/update-quantity",
                        {
                          madh: JSON.parse(localStorage.getItem("madh"))?.madh,
                          masp: id,
                          soluong: amount - 1,
                        }
                      );
                      setAmount(amount - 1);
                      setTotalPrice(totalPrice - price);
                    }
                  }}
                >
                  <RemoveIcon fontSize="8px" />
                </button>
              </div>
            </div>
          </Grid>
          <Grid xs={10}>
            <div className="action-wrapper">
              <div
                className="remove"
                onClick={() => {
                  setProducts(() => {
                    setTotalPrice(totalPrice - price * amount);
                    return products.filter((product) => product.id != id);
                  });
                  removeProduct();
                }}
              >
                <CloseIcon />
              </div>
              <Text weight="bold">{translatePrice(price * amount)}</Text>
            </div>
          </Grid>
        </Grid>
      </Grid.Container>
    </div>
  );
}

export default ProductCartCard;
