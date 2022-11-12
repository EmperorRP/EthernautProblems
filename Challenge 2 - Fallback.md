# Ethernaut Challenge #2 - Fallback

Here we go! Let's start with the first line:
```solidity
 pragma solidity ^0.6.0;
```

This line specifies the version of solidity we will be using in this contract. In our case, we are using any version of solidity that is 0.6.0 or higher.

```solidity
import '@openzeppelin/contracts/math/SafeMath.sol';
```
We are importing the SafeMath library which is a useful library when doing some math operations. 


```solidity
contract Fallback
```
With this line, we are declaring a new contrawct named Fallback. Inside this contract is where we will code out the functions and variables of the contract.

```solidity
  using SafeMath for uint256;
  mapping(address => uint) public contributions;
  address payable public owner;
```
The first line here declares the fact that all the unsigned integers(uint256) that is in the following code is using SafeMath library for the math operations.
The next line declares a mapping which is a kind of a dictionary that attaches a key with a value. Our mapping, contributions which is a public mapping contains the wallet address to the uints associated with the addresses.
The third line helps in identifying an owner which is a ```payable``` address that is public. Later we will see why this line has a flaw in it.
    
