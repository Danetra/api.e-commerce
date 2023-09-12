const {
  ListServices,
  DetailServices
} = require("../../Services/Products/ProductsServices");

const listProducts = async (req, res) => {
  const response = await ListServices(req);
  console.log(response);
  res.status(response.status).json(response);
};

const detailProduct = async (req, res) => {
  const response = await DetailServices(req);
  console.log(response);
  let product = {
    id: response.id,
    produk: {
      namaProduk: response.namaProduk,
      deskripsi: response.deskripsi,
      harga: response.harga,
      stok: response.stok,
      rating: response.ratingProduk,
      jenisProduk: response.jenisProduk,
      gambarProduk: response.gambarProduk
    },
    penjual: {
      namaToko: response.namaToko,
      namaPenjual: `${response.namaDepan} ${
        response.namaBelakang ? response.namaBelakang : ""
      }`
    }
  };
  return res.status(200).json({
    status: 200,
    data: product
  });
};

module.exports = { listProducts, detailProduct };
