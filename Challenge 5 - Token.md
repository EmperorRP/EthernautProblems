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

