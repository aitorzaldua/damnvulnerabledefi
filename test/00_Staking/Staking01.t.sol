// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

import "forge-std/Test.sol";
import "../../src/00_Staking/Staking01.sol";
import "./mocks/ERC20Contract.sol";
import "./utils/Cheats.sol";

contract Staking01Test is Test {
    Cheats internal constant cheats = Cheats(HEVM_ADDRESS);
    Staking01 public staking;
    MockERC20 public mockERC20;

    function setUp() public {
        staking = new Staking01();
        mockERC20 = new MockERC20();

    }

    function testStakingCoins(uint8 amount) public {
        mockERC20.approve(address(staking), amount);
        cheats.roll(55);
        bool stakePassed = staking.StakingCoins(address(mockERC20), amount);
        assertTrue(stakePassed);
    }
}
