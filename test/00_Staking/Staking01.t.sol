// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

import "forge-std/Test.sol";
import "../../src/00_Staking/Staking01.sol";
import "./mocks/ERC20Contract.sol";


contract Staking01Test is Test {

    Staking01 public staking;
    MockERC20 public mockERC20;

    function setUp() public {
        staking = new Staking01();
        mockERC20 = new MockERC20();
    }

    function testStakingCoins() public {
        uint256 amount = 10e18;
        mockERC20.approve(address(staking), amount);
        bool StakePassed = staking.StakingCoins(address(mockERC20), amount);
        assertTrue(StakePassed);
    }

}