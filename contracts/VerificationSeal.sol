// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract VerificationSeal is ERC721, Ownable {
    mapping (address=>bool) authorizedTcAddresses;
    
    constructor(address _initialOwner) ERC721("VerificationSeal", "VRS") Ownable() {
        authorizedTcAddresses[_initialOwner] = true;
    }
    

    modifier onlyTcAddressess {
        require(authorizedTcAddresses[msg.sender] == true);
        _;
    }

    function addTcAllowedAddress(address _tcAddress) public onlyOwner {
        authorizedTcAddresses[_tcAddress] = true;
    }

    function safeMint(address to, uint256 tokenId) public onlyTcAddressess() {
        _safeMint(to, tokenId);
    }
}
