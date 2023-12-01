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
        documentations.push(
            Documentation(
                {
                    amount: _amount,
                    cnae: _cnae,
                    docUrl: _docUrl
                }
            )
        );
    }

    function readAllDocumentations() public view returns (Documentation[] memory) {
        return documentations;
    }

    function readDocumentation(uint256 _index) public view returns (Documentation memory) {
        return documentations[_index];
    }
}