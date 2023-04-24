import { Button, Link, Row, Text } from "@nextui-org/react";
import React from "react";
import "../sass/components/_orderPayment.scss";
import ReplyAllIcon from "@mui/icons-material/ReplyAll";
import {useHistory} from 'react-router-dom'
function OrderPayment(props) {
  const { totalPrice } = props;
  const history = useHistory()
  const translateTotalPrice = totalPrice?.toLocaleString("it-IT", {
    style: "currency",
    currency: "VND",
  }) || 0;
  const thanhtoan = async () => {
    history.push('/checkout/1')
  }
  return (
    <div className="order-payment">
      <Text size={24} weigth="bold">
        Thông tin đơn hàng
      </Text>
      <div className="total-price">
        <Text color="#5c5c5c" weight="bold">
          Tổng tiền:
        </Text>
        <Text color="#e00707" weight="bold" size={30}>
          {translateTotalPrice}
        </Text>
      </div>
      <div className="fee-ship">
        <Text>
          Phí vận chuyển sẽ được tính ở trang thanh toán. Bạn cũng có thể nhập
          mã giảm giá ở trang thanh toán.
        </Text>
        <div className="pay-btn">
          <Button style={{ background: "#e00707", width: "100%" }} onClick={thanhtoan}>
            Thanh toán
          </Button>
        </div>
      </div>
      <div className="return-home" onClick={() => history.push('/catalog')}>
        <Row justify="center" align="center">
          <ReplyAllIcon />
          <Text color="#5d5d5d" css={{ cursor: "pointer"}}>
            Tiếp tục mua hàng
          </Text>
        </Row>
      </div>
    </div>
  );
}

export default OrderPayment;
