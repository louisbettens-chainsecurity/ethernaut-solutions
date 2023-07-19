// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import "forge-std/Test.sol";
import "../src/Target.sol";
import "../src/Exploit.sol";

contract ReentranceTest is Test {
    Elevator public target;
    Exploit public exploit;

    function setUp() public {
        target = new Elevator();
    }

    function testExploit() public {
        exploit = new Exploit(target);
	exploit.yoink();
	assert(target.top());
    }
}
