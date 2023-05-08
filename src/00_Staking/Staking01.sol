// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

import { IERC20 }    from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

error TransferFailed();

contract Staking01 {

    mapping (address => uint256) StakeBalances;

    function StakingCoins(address token, uint amount) external returns(bool){
        require (IERC20(token).balanceOf(msg.sender) >= amount, "Not enough tokens");


        StakeBalances[msg.sender] = StakeBalances[msg.sender] + amount;

        bool success = IERC20(token).transferFrom(msg.sender, address(this), amount);
        if (!success) revert TransferFailed();
        return success;

    }
}