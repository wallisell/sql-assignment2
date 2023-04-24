import React from "react";
import {
  FormDateField,
  FormDialog,
  FormFileUploadField,
  FormPhoneField,
  FormSwitchField,
  FormTextField,
} from "mui-form-fields";
import { ToastContainer, toast } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";
// import "react-toastify/dist/ReactToastify.min.css";
function CreateProduct({ setCreate }) {
  const notify = () =>
    toast.success("🦄 Create Successfully", {
      position: "top-right",
      autoClose: 5000,
      hideProgressBar: false,
      closeOnClick: true,
      pauseOnHover: true,
      draggable: true,
      progress: undefined,
      theme: "colored",
    });
  return (
    <>
      <FormDialog
        size="sm"
        title="Create User"
        onSubmit={async (...args) => {
          return new Promise((resolve) => {
            setTimeout(() => {
              resolve(notify());
              // setOpen(false);
            }, 2000);
          });
        }}
        open={true}
        onClose={() => {
            setCreate(false)
        }}
        dividers
      >
        <FormTextField name="name" label="Full Name" />
        <FormTextField name="email" label="Email" />
        <FormPhoneField name="phone" label="Phone" />
        <FormDateField name="birthday" label="Birthday" />
        <FormSwitchField name="protected" label="Protected" />
        <FormSwitchField name="admin" label="Admin" />
        <FormTextField name="image" label="Image" />
      </FormDialog>
     
    </>
  );
}

export default CreateProduct;
