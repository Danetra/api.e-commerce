const { verifyToken } = require("../../Middlewares/verifyToken");
const productsController = require("../../Controllers/Products/ProductsController");

const productRoutes = [
  {
    method: "get",
    route: "product/:id",
    controller: productsController.detailProduct,
    middleware: verifyToken
  },
  {
    method: "get",
    route: "list-product",
    controller: productsController.listProducts,
    middleware: verifyToken
  }
];

module.exports = productRoutes;
