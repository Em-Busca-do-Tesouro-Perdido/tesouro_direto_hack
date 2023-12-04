import { ethers } from "hardhat";
import dotenv from "dotenv";

dotenv.config();

async function main() {
    const transferOrderContract = await ethers.getContractAt("TransferOrder", process.env.TRANSFER_ORDER_CONTRACT_ADDRESS ?? "");
    const erc20Contract = await ethers.getContractAt("HackToken", process.env.TRANSFER_ORDER_CONTRACT_ADDRESS ?? "");

    const response = await transferOrderContract.specialTransfer(process.env.SPECIAL_TRANSFER_INDEX ?? 0);
    await response.wait();

    console.log(`Transaction hash: ${(await response.getTransaction())?.hash}`);

    const balanceReceiver = await erc20Contract.balanceOf(process.env.EXAMPLE1_RECEIVER_ADDRESS ?? "");
    console.log(`Receiver balance of HackToken: ${balanceReceiver}`);
    
    const orders = await transferOrderContract.readAllRequests();
    console.log(`Orders list: ${orders}`);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});