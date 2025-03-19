1. In solidity functions and variables can have one of four visibility parameters:
    a. *public*: accessible from inside of the  current contract and from external contracts
    b. *private*: accessible only within the current contract. Can be read, but cannot be accessed by external contract
    c. *external*: used only for functions. accessible only from *outside* of the contract
    d. *internal*: accessible by the current contract and any contracts derived from it 
    >Think of internal as creating a protected family space. The parent contract and all its child contracts can see and modify these variables, but nobody outside the family can.

2. View can read from contract's storage(state) but cannot modify, pure cannot read from state and cannot modify it
    >Pure functions work exclusively with their parameters and local memory variables. They're completely isolated from the contract's state

3. >While calling `view` or `pure` functions doesn’t typically require gas, they do require it when called by another function that modifies the state or storage through a transaction (e.g. calling the function `retrieve` inside the function `storage`). This cost is called **execution cost** and it will add up to the transaction cost.

4. Scope of Variable refers to the context in which variable is defined and accessible. In order to access the same variable across different function it should be declared inside the scope of main contract
```solidity
function store(uint256 _favoriteNumber) public {
    favoriteNumber = _favoriteNumber;
    uint256 testVar = 5;
}

function something() public {
   testVar = 6; // will raise a compilation error
   favoriteNumber = 7; // this can be accessed because it's in the main contract scope
}
```

5. Difference is in data field. 
    > The process of sending a transaction is the **same** for deploying a contract and for sending Ethers. The only difference is that the machine-readable code of the deployed contract is placed inside the _data_ field of the deployment transaction.

6.
```solidity
// SPDX-License-Identifier: MIT
pragma solidity 0.8.29; //latest solidity version

contract Answer {
    uint16 private favoriteNumber = 88; // Should be private as per the function requirement
    uint16 internal childrensFavoriteNumber = 1337;

    // Private view function, accessible only inside this contract
    function _getFavoriteNumber() private view returns (uint16) {
        return favoriteNumber;
    }

    // External pure function, not accessible within the contract
    function exFavoriteNumber() external pure returns (uint8) {
        return 77;
    }

    // Internal view function, accessible in child contracts
    function getChildrensNumber() internal view returns (uint16) {
        return childrensFavoriteNumber;
    }
}