import { ethers } from "hardhat";
import dotenv from "dotenv";

dotenv.config();

async function main() {
    const treasuryAddress: string = process.env.TREASURY_PUBLIC_ADDRESS ?? "";
    const erc20Contract = await ethers.getContractAt("HackToken", process.env.ERC20_CONTRACT_ADDRESS ?? "");

    const response = await erc20Contract.mint(treasuryAddress ?? "", 10000000000000);
    
    await response.wait();
    console.log(`Transaction hash: ${(await response.getTransaction())?.hash}`);
    
    const balance = await erc20Contract.balanceOf(treasuryAddress ?? "");

    console.log(`Balance of treasury account ${treasuryAddress} after mint operation: ${balance}`)
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});