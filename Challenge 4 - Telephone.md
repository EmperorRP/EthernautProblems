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

The function changeOwner which takes in _owner of type address as a parameter basically declares that if the original transaction sender and the sender of the "msg" or the ETH is the same then the _owner address now becomes the new owner.

- ```tx.origin``` refers to the sender of the transaction and it is of type address.
- ```msg.sender``` is the address of the person who sent the ETH.
