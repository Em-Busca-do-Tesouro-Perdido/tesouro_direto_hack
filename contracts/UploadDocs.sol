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

    function readAllDocumentations() public view returns (Documentation[] memory) {
        return documentations;
    }

    function readDocumentation(uint256 _index) public view returns (Documentation memory) {
        return documentations[_index];
    }

    // function readDocumentationsPaginated(uint256 _start, uint256 _offset) public view returns (Documentation[] memory) {
    //     return documentations[_start: _start + _offset];
    // }
}