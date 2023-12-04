import { ethers } from "hardhat";
import dotenv from "dotenv";

dotenv.config();

async function main() {
    const transferOrderContract = await ethers.getContractAt("Accountabilities", process.env.ACCOUNTABILITIES_CONTRACT_ADDRESS ?? "");

    const response = await transferOrderContract.addAccountability(
        "Guará",
        "273 - Arnaldo Jardim",
        "12345678901",
        3500,
        "0xabcdef"
    );
    
    await response.wait();

    console.log(`Transaction hash: ${(await response.getTransaction())?.hash}`);
    
    const orders = await transferOrderContract.readAllAccountabilities();
    console.log(`Orders list: ${orders}`);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});