// SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.21;

import {Test} from "forge-std/Test.sol";
import {DeployRCT} from "../script/DeployRC.s.sol";
import {RCToken} from "../src/ERC20_RC.sol";

contract RCTokenTest is Test {
    RCToken public rcToken;
    DeployRCT public deployer;

    address _u1 = makeAddr("u1");

    uint256 public constant STARTING_BALANCE = 25 ether;

    function setUp() public {
        deployer = new DeployRCT();
        rcToken = deployer.run();

        vm.prank(address(msg.sender));
        rcToken.transfer(_u1, STARTING_BALANCE);
    }

    function testBalanceOfU1() public {
        assertEq(rcToken.balanceOf(_u1), STARTING_BALANCE);
    }
}