import { ethers } from "hardhat";
import dotenv from "dotenv";

dotenv.config();

const { TRANSFER_ORDER_CONTRACT_ADDRESS, ERC20_CONTRACT_ADDRESS, SPECIAL_TRANSFER_INDEX, EXAMPLE1_RECEIVER_ADDRESS } = process.env;

async function main() {
    const transferOrderContract = await ethers.getContractAt("TransferOrder", TRANSFER_ORDER_CONTRACT_ADDRESS ?? "");
    const erc20Contract = await ethers.getContractAt("HackToken", ERC20_CONTRACT_ADDRESS ?? "");

    const response = await transferOrderContract.specialTransfer(SPECIAL_TRANSFER_INDEX ?? 0);
    await response.wait();

    console.log(`Transaction hash: ${(await response.getTransaction())?.hash}`);

    const balanceReceiver = await erc20Contract.balanceOf(EXAMPLE1_RECEIVER_ADDRESS ?? "");
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