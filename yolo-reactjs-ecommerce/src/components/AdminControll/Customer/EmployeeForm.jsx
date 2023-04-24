import { Grid } from "@material-ui/core";
import React, { useEffect } from "react";
import Controls from "../../Customer/controls/Controls";
import { Form, useForm } from "../../Customer/useForm";

const genderItems = [
  { id: "male", title: "Male" },
  { id: "female", title: "Female" },
  { id: "other", title: "Other" },
];

const initialFValues = {
  id: 0,
  name: "",
  price: "",
  itemCode: "",
  material: "",
  supplierId: "male",
  description: "",
  hireDate: new Date(),
};

export default function EmployeeForm(props) {
  
  const { addOrEdit, recordForEdit } = props;

  const validate = (fieldValues = values) => {
    let temp = { ...errors };
    if ("fullName" in fieldValues)
      temp.fullName = fieldValues.fullName ? "" : "This field is required.";
    if ("email" in fieldValues)
      temp.email = /$^|.+@.+..+/.test(fieldValues.email)
        ? ""
        : "Email is not valid.";
    if ("mobile" in fieldValues)
      temp.mobile =
        fieldValues.mobile.length > 9 ? "" : "Minimum 10 numbers required.";
    if ("departmentId" in fieldValues)
      temp.departmentId =
        fieldValues.departmentId.length != 0 ? "" : "This field is required.";
    setErrors({
      ...temp,
    });

    if (fieldValues == values) return Object.values(temp).every((x) => x == "");
  };

  const { values, setValues, errors, setErrors, handleInputChange, resetForm } =
    useForm(initialFValues, true, validate);

  const handleSubmit = (e) => {
    e.preventDefault();
    if (validate()) {
      addOrEdit(values, resetForm);
    }
  };

  useEffect(() => {
    if (recordForEdit != null)
      setValues({
        ...recordForEdit,
      });
      
  }, [recordForEdit]);

  return (
    <>
      <Form onSubmit={handleSubmit}>
        <Grid container>
          <Grid item xs={6}>
            <Controls.Input
              name="name"
              label="Tên sản phẩm"
              value={values.name}
              onChange={handleInputChange}
              error={errors.name}
            />
            <Controls.Input
              label="Giá"
              name="price"
              value={values.price}
              onChange={handleInputChange}
              error={errors.email}
            />
            <Controls.Input
              label="Chất liệu"
              name="material"
              value={values.material}
              onChange={handleInputChange}
              error={errors.material}
            />
            <Controls.Input
              label="Mô tả"
              name="description"
              value={values.description}
              onChange={handleInputChange}
            />
          </Grid>
          <Grid item xs={6}>
            <Controls.Input
              label="Mã sản phẩm"
              name="id"
              value={values.id}
              onChange={handleInputChange}
              disabled
            />
            <Controls.Input
              label="Mã NCC"
              name="supplierId"
              value={values.supplierId}
              onChange={handleInputChange}
              disabled
            />
            <Controls.Input
              label="Mã mặt hàng"
              name="itemCode"
              value={values.itemCode}
              onChange={handleInputChange}
              disabled
            />
            <div>
              <Controls.Button  type="submit" text="Submit" />
              <Controls.Button
                text="Reset"
                color="default"
                onClick={resetForm}
              />
            </div>
          </Grid>
        </Grid>
      </Form>
    </>
  );
}
