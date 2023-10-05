// SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.21;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract RCToken is ERC20 {
    constructor(uint256 initialSupply) ERC20("RCToken", "RCT") {
        _mint(msg.sender, initialSupply);
    }
}
