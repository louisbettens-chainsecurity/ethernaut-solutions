// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

//import 'openzeppelin-contracts-06/math/SafeMath.sol';
//import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v3.4.1/contracts/math/SafeMath.sol';
//import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v3.4.1/contracts/math/SafeMath.sol';

contract Reentrance {
  
  //using SafeMath for uint256;
  mapping(address => uint) public balances;

  function donate(address _to) public payable {
    balances[_to] += msg.value;
  }

  function balanceOf(address _who) public view returns (uint balance) {
    return balances[_who];
  }

  function withdraw(uint _amount) public {
    if(balances[msg.sender] >= _amount) {
      (bool result,) = msg.sender.call{value:_amount}("");
      if(result) {
        _amount;
      }
      unchecked { // optimizooooor: precondition in the if
      balances[msg.sender] -= _amount;
      }
    }
  }

  receive() external payable {}
}
 
