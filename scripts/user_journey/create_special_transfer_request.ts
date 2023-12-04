import { ethers } from "hardhat";
import dotenv from "dotenv";

dotenv.config();

async function main() {
    const transferOrderContract = await ethers.getContractAt("TransferOrder", process.env.TRANSFER_ORDER_CONTRACT_ADDRESS ?? "");

    const response = await transferOrderContract.addSpecialTransferRequest(
        "Guará",
        "273 - Arnaldo Jardim",
        "12345678901",
        3500,
        3,
        process.env.EXAMPLE1_RECEIVER_ADDRESS ?? ""
    );
    
    await response.wait();

    console.log(`Transaction hash: ${(await response.getTransaction())?.hash}`);
    
    const orders = await transferOrderContract.readAllRequests();
    console.log(`Orders list: ${orders}`);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});