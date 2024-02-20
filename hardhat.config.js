require("@nomicfoundation/hardhat-toolbox");
const ALCHEMY_API_KEY = "jYJSZ4tg3WwLYchD5nL4gcE8TKFYazEy";
const SEPOLIA_PRIVATE_KEY = "3f90138780b8bff91ea67ca72a2a08505b85478e5d3b6737fa8c8461c94a68a4";

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: {
    version: "0.8.0",
    settings: {
      optimizer: {
        enabled: true,
        runs: 200
      }
    }
  },
  networks: {
    sepolia: {
      url: `https://eth-sepolia.g.alchemy.com/v2/${ALCHEMY_API_KEY}`,
      accounts: [SEPOLIA_PRIVATE_KEY]
    }
  }
};
