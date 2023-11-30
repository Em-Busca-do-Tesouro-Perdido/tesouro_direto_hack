pragma solidity ^0.8.0;

import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract TransferOrder {

    struct SpecialTransferRequest {
        string receiver;
        string parlamentRequest;
        string eligibleDocument;
        uint256 value;
        string effectedTransaction;
    }

    IERC20 token;

    uint256 balance;
    address treasuryPublicKey;
    SpecialTransferRequest[] specialTransferRequests;

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

    function addSpecialTransferRequest(string memory _receiver, string memory _parlamentRequest, string memory _eligibleDocument, uint256 _value) public {
        specialTransferRequests.push(
            SpecialTransferRequest({
                eligibleDocument: _eligibleDocument,
                receiver: _receiver,
                parlamentRequest: _parlamentRequest,
                value: _value,
                effectedTransaction: ""
            })
        );
    }

    function updateEffectedTransaction(uint256 _index, string memory _effectedTransaction) public {
        specialTransferRequests[_index].effectedTransaction = _effectedTransaction;
    }
}