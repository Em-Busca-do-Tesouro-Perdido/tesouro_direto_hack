// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract TransferOrder {

    struct SpecialTransferRequest {
        string receiver;
        address receiverAddress;
        string parlamentRequest;
        string eligibleDocument;
        uint256 priority;
        uint256 value;
        string effectedTransaction;
    }

    modifier onlyTreasury {
        require(msg.sender == treasuryPublicKey);
        _;
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
 
    function getBalance() public view onlyTreasury returns (uint256)  {
        return balance;
    }

    function getTreasuryPublicKey() public view onlyTreasury returns (address) {
        return treasuryPublicKey;
    }

    function setBalance(uint256 _balance) public onlyTreasury {
        balance = _balance;
    }

    function specialTransfer( uint256 _requestIndex) public onlyTreasury {

        uint256 _amount = specialTransferRequests[_requestIndex].value;

        require(_amount <= balance, "Error: treasury does not have enough funds.");
        require(specialTransferRequests[_requestIndex].priority == 1, "Error: transfer has not highest priority.");
        require(
            keccak256(abi.encodePacked(specialTransferRequests[_requestIndex].effectedTransaction)) 
            == keccak256(abi.encodePacked("PENDING")), 
                "Error: transfer is already in process");

        bool isDone = IERC20(token).transferFrom(
            treasuryPublicKey, 
            specialTransferRequests[_requestIndex].receiverAddress, 
            _amount
        );
        require(isDone, "transfer failed");

        balance -= _amount;

        for (uint256 i = 0; i < specialTransferRequests.length; i++) {
            specialTransferRequests[i].priority -= 1;
        }
    }

    function removeRequest(uint _index) private {
        require(_index < specialTransferRequests.length, "index out of bound");

        for (uint i = _index; i < specialTransferRequests.length - 1; i++) {
            specialTransferRequests[i] = specialTransferRequests[i + 1];
        }
        specialTransferRequests.pop();
    }

    function addSpecialTransferRequest(string memory _receiver, string memory _parlamentRequest, 
        string memory _eligibleDocument, uint256 _value, uint256 _priority, address _receiverAddress) public {
        specialTransferRequests.push(
            SpecialTransferRequest({
                eligibleDocument: _eligibleDocument,
                receiver: _receiver,
                parlamentRequest: _parlamentRequest,
                value: _value,
                priority: _priority,
                effectedTransaction: "PENDING",
                receiverAddress: _receiverAddress
            })
        );
    }

    function updateEffectedTransaction(uint256 _index, string memory _effectedTransaction) public {
        specialTransferRequests[_index].effectedTransaction = _effectedTransaction;
    }

    function readAllRequests() public view returns (SpecialTransferRequest[] memory) {
        return specialTransferRequests;
    }

    function readRequest(uint256 _index) public view returns (SpecialTransferRequest memory) {
        return specialTransferRequests[_index];
    }
}