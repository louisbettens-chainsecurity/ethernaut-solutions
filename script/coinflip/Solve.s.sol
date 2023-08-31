// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "src/coinflip/CheatHelper.sol";
import "forge-std/Script.sol";

contract Solve is Script {
	  CoinFlip coinflip = CoinFlip(0x4A4e0BFfF17dB9903771913F53D980c41856af6a);

  function run() public {
	  vm.startBroadcast();
	  CheatHelper helper = new CheatHelper(coinflip);
	  console.log(address(helper));
	  helper.win();
	  assert(coinflip.consecutiveWins() == 1);
  }

  function check() public {
	  console.log(coinflip.consecutiveWins());
  }
}
