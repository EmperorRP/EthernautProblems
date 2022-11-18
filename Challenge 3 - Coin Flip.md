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

We check if the hash of the previous block is the same as the blockValue.

blockhash - every block in a blockchain has a unique fingerprint and thats what the blockhash stands for
block.number gives us the current block > if we subtract 1, we are going to the previous block
FACTOR is just an integer that helps in easing the randomization

