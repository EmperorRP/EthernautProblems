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

- ```tx.origin``` is a global variable that refers to the original externally owned account of the transaction and it is of type address. Read the docs about tx.origin [here](https://docs.soliditylang.org/en/v0.8.17/units-and-global-variables.html?highlight=tx.origin)
- ```msg.sender``` is the address of the user that invokes the function. Read the docs about msg.sender [here](https://docs.soliditylang.org/en/v0.8.17/units-and-global-variables.html?highlight=msg.sender)

### What is an Externally Owned Account(EOA)?

EOA is a the user's wallet address. Example: your Metamask account's address is an EOA.
EOAs satisfy the following conditions:
- Only type of account that can initiate a transaction and
- Only type of account that owns a private key
