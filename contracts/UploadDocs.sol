// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UploadDocs {
    constructor() {
        
    }

    struct Documentation {
        uint256 amount;
        string cnae;
        string docUrl;
    }

    Documentation[] documentations;

    function addDocumentation(uint256 _amount, string memory _cnae, string memory _docUrl) public {
        Documentation memory documentation = Documentation({
            amount: _amount,
            cnae: _cnae,
            docUrl: _docUrl
        });

        documentations.push(documentation);
    }
}