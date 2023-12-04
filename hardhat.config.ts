import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
import dotenv from "dotenv";
dotenv.config();

const config: HardhatUserConfig = {
  solidity: "0.8.20",
  defaultNetwork: "sepolia",
  networks: {
    sepolia: {
      url: process.env.NETWORK_RPC_ENDPOINT,
      accounts: [ process.env.PRIVATE_KEY ?? ""]
    }
  }
};

export default config;
