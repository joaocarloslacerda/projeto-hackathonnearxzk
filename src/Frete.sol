// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Frete {

    struct Carga {
        string origem;
        string destino;
        string tipoCarga;
        uint256 peso;
        uint256 dtColeta;
        uint256 prazoEntrega;
        uint256 valorEstimado;
        string descricaoAdicional;
        address carteiraUsuario;
        uint dataRegistro;
    }

    mapping(uint => Carga) public cargas;

    uint[] public idsCargas;

    uint public contador;

    function registrarCarga(string memory origem, string memory destino, string memory tipoCarga, uint256 peso, uint256 dtColeta, uint256 prazoEntrega, uint256 valorEstimado, string memory descricaoAdicional, address carteiraUsuario) public {
        contador++;
        cargas[contador] = Carga(origem, destino, tipoCarga, peso, dtColeta, prazoEntrega, valorEstimado, descricaoAdicional, carteiraUsuario, block.timestamp);
        idsCargas.push(contador);
    }

    function buscarCargaPorId(uint _id) public view returns (string memory, string memory, string memory, uint256, uint256, uint256, uint256, string memory, address, uint) {
        Carga memory c = cargas[_id];
        return (c.origem, c.destino, c.tipoCarga, c.peso, c.dtColeta, c.prazoEntrega, c.valorEstimado, c.descricaoAdicional, c.carteiraUsuario, c.dataRegistro);
    }

    function totalCargas() public view returns (uint) {
        return idsCargas.length;
    }

    function listarTodasCargas() public view returns (Carga[] memory) {
        uint qtd = idsCargas.length;
        Carga[] memory lista = new Carga[](qtd);

        for (uint i = 0; i < qtd; i++) {
            uint id = idsCargas[i];
            lista[i] = cargas[id];
        }

        return lista;
    }
}
