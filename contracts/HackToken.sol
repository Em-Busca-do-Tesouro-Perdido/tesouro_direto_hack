// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract HackToken is ERC20, Ownable, ERC20Burnable {
    constructor(address _initialOwner)
        ERC20("HackToken", "HAK")
        Ownable(_initialOwner)
    {}

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function transferFrom(address _from, address _to, uint256 _amount) public override returns (bool) {
        _transfer(_from, _to, _amount);

        return true;
    }
}
