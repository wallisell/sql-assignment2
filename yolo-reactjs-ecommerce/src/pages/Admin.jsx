
import { Stack } from "@mui/system";
import React, { useState } from "react";
import TemporaryDrawer from "../components/Menu";
import Employees from "../components/AdminControll/Customer/Employees";
import Clothes from "../components/AdminControll/Clothes";
import Pants from "../components/AdminControll/Pants";
import Shoes from "../components/AdminControll/Shoes";
import ProductDataGrid from "../components/AdminControll/ProductDataGrid";
;

export default function TreeDataSimple() {
  const [menu, setMenu] = useState("Sản phẩm");
  return (
    <>
      <Stack
        direction="row"
        position="absolute"
        right={0}
        justifyContent="end"
        gap={2}
        marginRight={2}
      >
        <TemporaryDrawer setMenu={setMenu} />
      </Stack>
      <Stack direction="column" justifyContent="center" alignItems="center">
        <div style={{ fontWeight: "bold", fontSize: "2rem" }}>{menu}</div>
      </Stack>
      <div style={{ height: "90vh", width: "100%" }}>
        {menu == "Sản phẩm" ? (
          <ProductDataGrid />
        ) :
          <Employees />
        }
      </div>
    </>
  );
}
