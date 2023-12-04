import { ethers } from "hardhat";
import dotenv from "dotenv";

dotenv.config();

const { TREASURY_PUBLIC_ADDRESS, ERC20_CONTRACT_ADDRESS, ERC20_INITIAL_SUPPLY} = process.env;

async function main() {
    const erc20Contract = await ethers.getContractAt("HackToken", ERC20_CONTRACT_ADDRESS ?? "");

    const response = await erc20Contract.mint(TREASURY_PUBLIC_ADDRESS ?? "", ERC20_INITIAL_SUPPLY ?? 100000000000000000000);
    
    await response.wait();
    console.log(`Transaction hash: ${(await response.getTransaction())?.hash}`);
    
    const balance = await erc20Contract.balanceOf(TREASURY_PUBLIC_ADDRESS ?? "");

    console.log(`Balance of treasury account ${TREASURY_PUBLIC_ADDRESS} after mint operation: ${balance}`);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});