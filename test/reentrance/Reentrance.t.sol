// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import "forge-std/Test.sol";
import "src/reentrance/Reentrance.sol";
import "src/reentrance/Exploit.sol";

contract ReentranceTest is Test {
    Reentrance public reentrance;
    Exploit public exploit;

    function setUp() public {
        reentrance = new Reentrance();
        payable(reentrance).transfer(0.01 ether);
    }

    function testExploit() public {
        exploit = new Exploit{value: 0.001 ether}(reentrance);
        exploit.yoink();
        assert(address(reentrance).balance == 0);
    }
}
