# Array
array is defined like in any other language
```solidity
uint256[] listOfNumbers;//creates dynamic array;
```

> 🗒️ **NOTE**:
> Arrays are zero-indexed: the first element is at position zero (has index 0), the second element is at position one (has index 1), and so on.

# Custom DataTypes(Struct) in Solidity
You can create new data type in solidity using *struct* keyword:
```solidity
struct structName{
    string variableOne;
    uint256 variableTwo;
    //...
}
```
# Array of Struct
You can also create a dynamic array of custom data type after you defined struct
```solidity
structName[] public structArrayName;
```

## Passing Struct in solidity
```solidity
// SPDX-License-Identifier: MIT
pragma solidity 0.8.29; //latest solidity version

contract Answer{

   struct Animal{
    string animalType;
    string name;
    uint age;
   }
   Animal[] public animalList;

   function addAnimal(Animal memory _newAnimal) public {
    animalList.push(_newAnimal);
   }
}
```
you need to pass array to a function e.g. ["dog", "Krypto", 77] credit to @pacelliv from discord

else:
gives error when trying to push e.g. ("dog", "Krypto", 77) and {"dog", "Krypto", 77} 

    >error: types/values length mismatch 

    >The error types/values length mismatch suggests that there is an issue with how the struct is being passed to the function. In Solidity, when interacting with the Ethereum Virtual Machine (EVM), you cannot directly pass structs as arguments in function calls, especially from off-chain code, such as via a terminal command or script.

    >When you try to call the addAnimal function from outside the contract (like through a web3 interface or a testing script), you need to pass the struct fields individually rather than as an entire struct. This is because, in the ABI (Application Binary Interface) of a contract, complex data types like structs are not directly supported for input or output parameters between off-chain and on-chain interactions.
