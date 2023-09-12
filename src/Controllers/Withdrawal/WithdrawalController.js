const {
  WithdrawalServices,
  WithdrawalExecute
} = require("../../Services/Withdrawal/WithdrawalServices");

const withdrawal = async (req, res) => {
  try {
    let url = "http://localhost:2023/api/v1/withdrawal";
    let wd = await WithdrawalServices(req, url);
    res.status(200).json(wd);
  } catch (error) {
    res.status(500).json({ error: "Failed to perform withdrawl" });
  }
};

const withdrawalResponse = async (req, res) => {
  let response = await WithdrawalExecute(req);
  // console.log(response);
  res.status(200).json(response);
};

module.exports = { withdrawal, withdrawalResponse };
