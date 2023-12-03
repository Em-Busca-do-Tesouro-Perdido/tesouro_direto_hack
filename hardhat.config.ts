import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
import dotenv from "dotenv";
dotenv.config();

const config: HardhatUserConfig = {
  solidity: {
    "compilers": [
      {
        "version": "0.8.19"
      }
    ]
  },
  defaultNetwork: "sepolia",
  networks: {
    sepolia: {
      url: process.env.SEPOLIA_RPC_ENDPOINT,
      accounts: [ process.env.PRIVATE_KEY ?? ""]
    }
  }
};

export default config;
