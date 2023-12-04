import { ethers } from "hardhat";
import dotenv from "dotenv";

dotenv.config();

async function main() {
    const erc721contract = await ethers.getContractAt("VerificationSeal", process.env.ERC721_CONTRACT_ADDRESS ?? "");

    const response = await erc721contract.safeMint(process.env.EXAMPLE_ERC721_SEAL_RECEIVER_ADDRESS ?? "");
    
    await response.wait();
    
    console.log(`Transaction hash: ${(await response.getTransaction())?.hash}`);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});