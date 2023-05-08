// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

abstract contract Cheats {
    // sets the block timestamp to x
    function wrap(uint256 x) public virtual;

    // sets the block number to x
    function roll(uint256 x) public virtual;

    // sets the slot loc of contract c to val
    // store a variable in certain spot at memory
    function store(address c, bytes32 loc, bytes32 val) public virtual;

    function ffi(string[] calldata) external virtual returns(bytes memory);

    // expect something to emit
    function expectEmit(bool, bool, bool, bool) external virtual;

    // expect something to revert
    function expextRevert(bytes calldata msg) external virtual;


}