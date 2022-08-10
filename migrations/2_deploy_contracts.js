const likemToken = artifacts.require("likemToken");

module.exports = function(deployer) {
  deployer.deploy(likemToken, 1000000);
};