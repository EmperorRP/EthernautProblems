# Challenge 5 - Token 

## Understanding the code

Let's look straight into the Token contract.

```solidity
mapping(address => uint) balances;
uint public totalSupply;
```

As is common practice, we declare the data structure mapping for storing balances of the users. We also make a public variable storing the totalSupply.

```solidity
constructor(uint _initialSupply) public {
    balances[msg.sender] = totalSupply = _initialSupply;
  }
```

Constructor declared which equals the total token supply with the initial supply.

```solidity
function transfer(address _to, uint _value) public returns (bool) {
    require(balances[msg.sender] - _value >= 0);
    balances[msg.sender] -= _value;
    balances[_to] += _value;
    return true;
  }
```

The function first checks if the balances of the users are above or equal to 0 and then decreases the balance according to the amount to be transferred.

This challenge wants us to understand the concept of overflow. Understand what that is and then just do the following.

## Solution
All you have to do is contract.transfer('0x random address', 20 + 1)
This will make the contract transfer 20-21=-1 and this would trigger an arithmetic underflow.
