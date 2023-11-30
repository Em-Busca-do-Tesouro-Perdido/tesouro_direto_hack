// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Accountabilities {
    constructor() {}

    struct Accountability {
        string receiver;
        string parlamentRequest;
        string eligibleDocument;
        uint256 value;
        string effectedTransaction;
        string approvalNftUrl;
    }

    Accountability[] accountabilities;

    function addAccountability(string memory _receiver, string memory _parlamentRequest, 
        string memory _eligibleDocument, uint256 _value, string memory _approvalNftUrl) public {
        accountabilities.push(
            Accountability({
                eligibleDocument: _eligibleDocument,
                receiver: _receiver,
                parlamentRequest: _parlamentRequest,
                value: _value,
                effectedTransaction: "IN PROGRESS",
                approvalNftUrl: _approvalNftUrl
            })
        );
    }

    function readAllAccountabilities() public view returns (Accountability[] memory) {
        return accountabilities;
    }

    function readAccountability(uint256 _index) public view returns (Accountability memory) {
        return accountabilities[_index];
    }
}