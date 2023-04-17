// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract OhDamnValuableToken is ERC20, Ownable {
    constructor() ERC20("Oh Damn Valuable Token", "oDVT") {
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }

}