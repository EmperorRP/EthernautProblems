# Challenge 4 - Telephone

## Understanding the code

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Telephone {

  address public owner;

  constructor() {
    owner = msg.sender;
  }

  function changeOwner(address _owner) public {
    if (tx.origin != msg.sender) {
      owner = _owner;
    }
  }
}

```

This is a simple contract but let's understand what the function is doing here.

The function changeOwner which takes in _owner of type address as a parameter basically declares that if the original transaction sendedr and the sender of the "msg" or the ETH is
