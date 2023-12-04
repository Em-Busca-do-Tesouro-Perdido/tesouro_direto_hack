import { ethers } from "hardhat";
import dotenv from "dotenv";

dotenv.config();

async function main() {
  const currentTimestampInSeconds = Math.round(Date.now() / 1000);
  const unlockTime = currentTimestampInSeconds + 60;

  const erc20 = await ethers.deployContract("HackToken", [process.env.ERC20_DEPLOYER_PUBLIC_ADDRESS]);

  await erc20.waitForDeployment();

  console.log(
    `ERC20 token with unlock timestamp ${unlockTime} deployed in address ${await erc20.getAddress()}`
  );
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
