// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {ReentrancyGuard} from "@openzeppelin/contracts/security/ReentrancyGuard.sol";

contract UnstoppableVault is ReentrancyGuard {
    IERC20 public damnVulnerableToken;

    error TokenAddressCannotBeZero();

    constructor (address _tokenAddress) {
        if (_tokenAddress == address(0)) revert TokenAddressCannotBeZero();
        damnVulnerableToken = IERC20(_tokenAddress);
    }




}

