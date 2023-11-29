// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import {DoacoesOrcamentarias} from "./DoacoesOrcamentarias.sol";

contract TransferenciasEspeciais is Ownable {
    // using SafeMath for uint256;
    

    address[] public doacoesOrcamentariasContracts; 

    event DotacaoOrcamentariaCriada(address indexed owner, address indexed contrato);

    function criarDotacaoOrcamentaria(string memory name, string memory symbol) public onlyOwner {
        DoacoesOrcamentarias dotacaoOrcamentaria = new DoacoesOrcamentarias(name, symbol);
        doacoesOrcamentariasContracts.push(address(dotacaoOrcamentaria));
        emit DotacaoOrcamentariaCriada(msg.sender, address(dotacaoOrcamentaria));
    }

    function getQuantidadeContratosDoacoesOrcamentarias() public view returns (uint256) {
        return doacoesOrcamentariasContracts.length;
    }
}