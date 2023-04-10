// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {ReentrancyGuard} from "@openzeppelin/contracts/security/ReentrancyGuard.sol";

contract UnstoppableVault is ReentrancyGuard {
    IERC20 public damnVulnerableToken;

    uint256 public poolBalance;

    constructor(address _tokenAddress) {
        damnVulnerableToken = IERC20(_tokenAddress);
    }

    //One Time function: SET THE POOL
    function setThisBalance() external {
        poolBalance = damnVulnerableToken.balanceOf(address(this));
    }

    //Transfer function:
    function transferMyTokens(
        address to,
        uint256 amount
    ) external nonReentrant {
        poolBalance = poolBalance - amount;
        damnVulnerableToken.transfer(to, amount);
    }

    //Get functions:
    function getPoolBalance() public view returns (uint) {
        return poolBalance;
    }

    function getOtherOwnersTokens(address _address) public view returns (uint) {
        return damnVulnerableToken.balanceOf(_address);
    }
}
