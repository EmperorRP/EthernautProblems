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
    
```solidity
modifier onlyOwner {
        require(
            msg.sender == owner,
            "caller is not the owner"
        );
        _;
    }
```

We are using a modifier called onlyOwner which will check if the message caller, i.e, the player in our case which is you are the owner or not.
These modifiers are usable before and after calling other functions. Modifiers can be used to satisfy securty checks, restricting access and guarding against reentrancy hacks.

```solidity
function contribute() public payable {
    require(msg.value < 0.001 ether);
    contributions[msg.sender] += msg.value;
    if(contributions[msg.sender] > contributions[owner]) {
      owner = msg.sender;
    }
  }
```
The contribute() function adds values of the caller into the contributions mapping that we declared early on. In this we can see that if the contributions of the sender - that is you as the player - are greater than the current owner's contributions then you can become the owner of the contract.


```solidity
  function getContribution() public view returns (uint) {
    return contributions[msg.sender];
  }
```
The getContribution() function shows all the contributions of the user calling the function

```solidity
  function withdraw() public onlyOwner {
    owner.transfer(address(this).balance);
  }
```
This function calls back the ether from the contract to the owner of the contract and as you can see the onlyOwner modifer is used here to restrict access of this contract to the owner only.

>  _ Note: transfer() is no longer the recommended way to transfer ether, instead we use ```solidity 
>  (bool sent, bytes memory data) = _to.call{value: msg.value}(""); 
>  require(sent, "Failed to send Ether"); ```
>  
>  If you want an example, you can check it out at https://solidity-by-example.org/sending-ether/ _

```solidity
 receive() external payable {
    require(msg.value > 0 && contributions[msg.sender] > 0);
    owner = msg.sender;
  }
```
You can understand the receive function from [here](https://docs.soliditylang.org/en/v0.8.17/contracts.html)
