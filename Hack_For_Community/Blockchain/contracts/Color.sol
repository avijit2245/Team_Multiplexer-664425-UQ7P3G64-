// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;


import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract color is ERC721{
    string[] public colors ;
    mapping(string=>bool) colorExists;

    constructor() ERC721("color","Color") {
        
    }
    function mint(string memory _color)private {
        //color-add it
        require(!colorExists[_color]);
        colors.push(_color);
        _mint(msg.sender,1);
        colorExists[_color]=true;
        //color-tract it

    }
}