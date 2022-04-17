const KingCoin = artifacts.require("KingCoin");

module.exports = function (deployer) {
  deployer.deploy(KingCoin);
};
