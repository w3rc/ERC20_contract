// SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.21;

import {Script} from "forge-std/Script.sol";
import {RCToken} from "../src/ERC20_RC.sol";

contract DeployRCT is Script {
    uint256 public constant INITIAL_SUPPLY = 1000 ether;

    function run() external returns (RCToken) {
        vm.startBroadcast();
        RCToken rcToken = new RCToken(INITIAL_SUPPLY);
        vm.stopBroadcast();

        return rcToken;
    }
}
