// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyToken is ERC1155, Ownable {
    mapping(uint256 => string) public tokenURIs;

    constructor() ERC1155("") {}

    // function setURI(string memory newuri) public onlyOwner {
    //     _setURI(newuri);
    // }

    function mint(
        address account,
        uint256 id,
        uint256 amount,
        bytes memory data
    ) public onlyOwner {
        _mint(account, id, amount, data);
    }

    function mintBatch(
        address to,
        uint256[] memory ids,
        uint256[] memory amounts,
        bytes memory data
    ) public onlyOwner {
        _mintBatch(to, ids, amounts, data);
    }

    function setTokenURI(uint256 id, string memory _tokenURI) public onlyOwner {
        tokenURIs[id] = _tokenURI;
    }

    function uri(uint256 id) public view override returns (string memory) {
        return tokenURIs[id];
    }

    function getValues(
        uint256 start,
        uint256 end
    ) public view returns (string[1000] memory) {
        string[1000] memory _tokenURIs;
        for (uint256 i = start; i < end; i++) {
            _tokenURIs[i] = tokenURIs[i];
        }
        return _tokenURIs;
    }
}
