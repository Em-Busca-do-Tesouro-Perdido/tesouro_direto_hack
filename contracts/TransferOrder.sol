pragma solidity ^0.8.0;

import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract TransferOrder {

    uint256 balance;
    address treasuryPublicKey;
    IERC20 token;    
    constructor(uint256 _balance, address _token, address _treasuryPublicKey) {
        balance = _balance;
        token = IERC20(_token);
        treasuryPublicKey = _treasuryPublicKey;
    }

 
    function getBalance() public view returns (uint256) {
        return balance;
    }

    function setBalance(uint256 _balance) public {
        balance = _balance;
    }

    function specialTransfer(uint256 _amount, address _receiver) public {
        require(_amount <= balance);
        token.transferFrom(treasuryPublicKey, _receiver, _amount);
    }
}