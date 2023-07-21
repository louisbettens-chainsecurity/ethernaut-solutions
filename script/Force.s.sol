// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;

import "forge-std/Script.sol";
import "src/force/ForceSend.sol";

contract ForceScript is Script {
    function yeet(address eoa, address payable target) public {
        vm.broadcast(eoa);
        new ForceSend{value:1}(target);
        assert(target.balance > 0);
    }
}
