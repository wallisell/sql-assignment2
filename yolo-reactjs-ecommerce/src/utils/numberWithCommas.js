const numberWithCommas = (num) =>
  num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
const translatePrice = (agr) => {
  return agr?.toLocaleString("it-IT", {
    style: "currency",
    currency: "VND",
  });
};
export { translatePrice, numberWithCommas };
