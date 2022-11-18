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


blockhash - every block in a blockchain has a unique fingerprint and thats what the blockhash stands for
block.number gives us the current block > if we subtract 1, we are going to the previous block
FACTOR is just an integer that helps in easing the randomization

