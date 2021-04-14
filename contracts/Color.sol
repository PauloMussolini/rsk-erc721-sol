// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import '@openzeppelin/contracts/token/ERC721/ERC721.sol';

contract Color is ERC721 {

  bytes3[] public colors;
  mapping(bytes3 => bool) private _colorExists;

  constructor() ERC721("Color", "COLOR")  {
  }

  // E.G. color = "#FFFFFF"
  function mint(bytes3 _color) public {
    require(!_colorExists[_color], "color exists");
    colors.push(_color);
    uint _id = colors.length -1;
    _mint(msg.sender, _id);
    _colorExists[_color] = true;
  }
}