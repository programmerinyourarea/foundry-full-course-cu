# Smart Contract Introduction
Solidity Programming Language is used for Ehereum Virtual Machine(EVM)-based smart contract development.
## Basics
### License
It's a good practice (even not mandatory) to start your smart contract with an SPDX License Identifier. It helps in making licensing and sharing code easier from a legal perspective.
```solidity
// SPDX-License-Identifier: MIT 
```
### Solidity Versioning
Keyword pragma specifies the version of the Solidity compiler that should be used.
You can specify the compiler version(s) in two ways:
``` solidity
pragma solidity 0.x.x; // use exactly one version where x.x is version.
```
or
```solidity
//use versions between 0.8.19 and 0.9.0 (excluded)
pragma solidity ^0.8.19;
pragma solidity >=0.8.19 <0.9.0;
```
### Contract Name
Start writing your smart contract using keyword ***contract*** followed by name e.g. ***SimpleContract***. All the code inside the curly brackets would be considered a part of this contract.
```solidity
contract SimpleContract{
    //contract code goes here
}
```
### Compiling
Compiling **converts Solidity code** into **bytecode** and **ABI** that can be understood and executed by Ethereum Virtual Machine(EVM).

## Solidity Types
Solidity supports various **elementary** types that can be combined to create more **complex** ones. You can read more about them in the [Solidity Documentation](https://docs.soliditylang.org/en/v0.8.29/types.html) 

For now, let's focus on the most commonly used
* Boolean (bool): true or false
* Unsigned Integer (uint): unsigned whole number (positive)
* Integer (int): signed whole number (positive and negative)
* Address (address): 20 bytes value. An example of an address can be found within your MetaMask account.
* Bytes (bytes): low-level raw byte data
### Variables definition
Variables are just placeholders for **values**. A value can be one **data type** described in the list above. For instance, we could create a Boolean variable named `hasFavoriteNumber`, which would represent whether someone has a favourite number or not (constant `true` or `false`).
```solidity
bool hasFavoriteNumber = true; // The variable `hasFavoriteNumber` represents the value `true`
```
It's possible to specify the number of **bits** used for `uint` and `int`. For example, uint256 specifies that the variable has 256 bits. uint is a shorthand for uint256.
> 🗒️ **NOTE**:
> It's always advisable to be **explicit** when specifying the length of the data type.

The _semicolon_ at the end of each line signifies that a statement is completed.
```solidity
// SPDX-License-Identifier: MIT
pragma solidity 0.8.29;
contract SimpleStorage{
    //basic types
    bool hasFavoriteNumber = true;
    uint256 FavoriteNumber = 1337;
    string FavoriteNumberInString = "thirteen thirty-seven";
    int256 FavoriteInt = -80085;
    address MyAddress = 0x5321ee1edb738fd219021cb68e274fad75c803e5;
    bytes32 FavoriteBytes32 = "cat";
}
```

#### Bytes and Strings
Bytes are a _collection of characters_ written in **hexadecimal representation**.
```solidity
bytes1 minBytes = "I am a fixed size byte array of 1 byte";
bytes32 maxBytes = "I am a fixed size byte array of 32 bytes";
bytes dynamicBytes = "I am a dynamic array, so you can manipulate my size";
```
Bytes can be allocated in size (up to `bytes32`). However, bytes and bytes32 represent distinct data types.

**Strings** are internally represented as **dynamic byte arrays** (`bytes` type) and designed specifically for working with text. For this reason, a string can easily be converted into bytes.

### The Contract Logic
📋 Let's explore a scenario where there is a task involving the storage of a favourite number. For this purpose, we can start storing the variable `favoriteNumber` of type `uint`:
```solidity
uint256 favoriteNumber;
```
> 👀❗**IMPORTANT**:
> Every variable in Solidity comes with a _default value_. Uninitialized uint256 for example, defaults to `0` (zero) and an uninitialized boolean defaults to `false`.
