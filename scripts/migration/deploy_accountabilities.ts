import { ethers } from "hardhat";
import dotenv from "dotenv";

dotenv.config();

async function main() {
  const currentTimestampInSeconds = Math.round(Date.now() / 1000);
  const unlockTime = currentTimestampInSeconds + 60;

  const transferOrder = await ethers.deployContract("Accountabilities");

  await transferOrder.waitForDeployment();

  console.log(
    `TransferOrder token with unlock timestamp ${unlockTime} deployed in address ${await transferOrder.getAddress()}`
  );
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
