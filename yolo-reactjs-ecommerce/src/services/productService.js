import db from '../db/products.json'
import axios from 'axios'
const KEYS = {
  employees: "employees",
  employeeId: "employeeId",
};
export const getDepartmentCollection = () => [
  { id: "1", title: "Development" },
  { id: "2", title: "Marketing" },
  { id: "3", title: "Accounting" },
  { id: "4", title: "HR" },
];

export function insertEmployee(data) {
  let employees = getAllProducts();
  data["id"] = generateEmployeeId();
  employees.push(data);
  localStorage.setItem(KEYS.employees, JSON.stringify(employees));
}

export function deleteEmoloyee(data) {
  let employees = getAllProducts();
  employees = employees.filter((employee) => employee.id !== data.id);
  localStorage.setItem(KEYS.employees, JSON.stringify(employees));
  return getAllProducts();
}

export function updateEmployee(data) {
  let employees = getAllProducts();
  let recordIndex = employees.findIndex((x) => x.id == data.id);
  employees[recordIndex] = { ...data };
  localStorage.setItem(KEYS.employees, JSON.stringify(employees));
}

export function generateEmployeeId() {
  if (localStorage.getItem(KEYS.employeeId) == null)
    localStorage.setItem(KEYS.employeeId, "0");
  var id = parseInt(localStorage.getItem(KEYS.employeeId));
  localStorage.setItem(KEYS.employeeId, (++id).toString());
  return id;
}

export async function getAllProducts() {
  const { data } = await axios.post("http://localhost:3001/product/all");
  console.log(data);
  return data;
}
