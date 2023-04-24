import React, { useState } from "react";
import { DataGrid, GridToolbar } from "@mui/x-data-grid";
import productJSON from "../../db/products.json";
import DeleteIcon from "@mui/icons-material/Delete";
import EditIcon from "@mui/icons-material/Edit";
import { Box, IconButton } from "@mui/material";
import Button from "../Customer/controls/Button";
function Pants() {
  const [rows, setRows] = useState(productJSON);

  const columns = [
    {
      field: "id",
      headerName: "Mã MH",
      headerAlign: "center",
      width: 120,
    },
    {
      field: "name",
      headerName: "Tên",
      headerAlign: "center",
      width: 200,
    },
    {
      field: "price",
      headerName: "Giá niêm yết",
      headerAlign: "center",
      width: 120,
    },
    {
      field: "material",
      headerName: "Chất liệu",
      headerAlign: "center",
      width: 120,
    },
    {
      field: "supplierId",
      headerName: "Mã NCC",
      headerAlign: "center",
      width: 120,
    },
    {
      field: "itemCode",
      headerName: "Mã MH",
      headerAlign: "center",
      width: 120,
    },
    {
      field: "amount",
      headerName: "Số lượng",
      headerAlign: "center",
      width: 120,
    },
    {
      field: "description",
      headerName: "Mô tả",
      headerAlign: "center",
      width: 200,
    },
    {
      field: "edit",
      headerName: "",
      headerAlign: "center",
      width: 50,
      align: "center",
      renderCell: (params) => {
        return (
          <IconButton onClick={() => {}} aria-label="edit" size="large">
            <EditIcon fontSize="inherit" />
          </IconButton>
        );
      },
    },
    {
      field: "delete",
      headerName: "",
      headerAlign: "center",
      width: 50,
      align: "center",
      renderCell: (params) => {
        return (
          <IconButton
            aria-label="delete"
            size="large"
            onClick={() => {
              setRows(() => rows.filter((row) => row.id != params.id));
            }}
          >
            <DeleteIcon fontSize="inherit" />
          </IconButton>
        );
      },
    },
  ];
  const configData = {
    columns,
    rows,
    initialState: {
      columns: {
        columnVisibilityModel: {
          id: true,
        },
      },
    },
  };
  return (
    <>
      <Box position="absolute" right={0} marginRight={2} zIndex={1}>
        <Button
          variant="contained"
          text="Create New"
          size="large"
          color="secondary"
        ></Button>
      </Box>
      <DataGrid
        {...configData}
        sx={{
          padding: "0 5px",
        }}
        components={{
          Toolbar: GridToolbar,
        }}
      />
    </>
  );
}

export default Pants;
