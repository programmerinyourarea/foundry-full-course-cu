# Functions in Solidity
In Solidity, functions - or methods, are portions of code designed to execute specific tasks within the overall codebase

Functions are identified by the keyword `function`, followed by a custom **name** (e.g. "store") and any additional **parameters** enclosed in rounded parentheses `()`.
These parameters represent the values sent to our function.

```solidity
contract SimpleStorage {

    uint256 favoriteNumber; // storage variable: it's stored in a section of the blockchain called "Storage"

    function store(uint256 _favoriteNumber) public {
        // the variable favorite number is updated with the value that is contained into the parameter `_favoriteNumber`
        favoriteNumber = _favoriteNumber;
    }
}
```

The content of the function is placed within the curly brackets `{}`.
The prefix `_` before `_favoriteNumber` is used to emphasize that the _**local**_ variable `_favoriteNumber` is a **different** variable from the _**state**_ variable `favoriteNumber`. This helps prevent potential confusion when dealing with different variables with similar names in complex codebases.

> Appending the `public` keyword next to a variable will automatically change its visibility and it will generate a **getter function** (a function that gets the variable's value when called).
## Visibility
In Solidity, functions and variables can have one of these four visibility specifiers:

* 🌎 **`public`**: accessible from both inside the contract and from external contracts
* 🏠 **`private`**: accessible only within the _current contract_. It does not hide a value but only restricts its access.
* 🌲 **`external`**: used only for _functions_. Visible only from _outside_ the contract.
* 🏠🏠 **`internal`**: accessible by the current contract and any contracts _derived_ from it.

If a visibility specifier is not given, it defaults to `internal`.

## Pure and View keywords

The terms `view` and `pure` are used when a function reads values from the blockchain without altering its state. Such functions will not initiate transactions but rather make calls, represented as blue buttons in the Remix interface. A `pure` function will prohibit any reading from the state or storage.

```solidity
function retrieve() public view returns(uint256) {
    return favoriteNumber;
}
```
```solidity
function retrieve() public pure returns(uint256) {
    return 7;
}
```
The keyword `returns` specifies the type(s) of value a function will return.

> 🚧 **WARNING**:br
> While calling `view` or `pure` functions doesn’t typically require gas, they do require it when called by another function that modifies the state or storage through a transaction (e.g. calling the function `retrieve` inside the function `storage`). This cost is called **execution cost** and it will add up to the transaction cost.

## The scope of a variable
The scope of a variable refers to the **context** within which it is defined and accessible. This context is usually determined by the block of code, typically enclosed in curly braces `{}`, where the variable is declared. To access the same variable across different functions, it should be declared inside the scope of the main contract.
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

### 🧑‍💻 Test yourself
1. 📕 Describe the four visibility keywords and their impact on the code.
2. 📕 What's the difference between `view` and `pure`?
3. 📕 In which circumstances a `pure` function will incur gas costs?
4. 📕 Explain what a _scope_ is and provide an example of an incorrect scope.
5. 📕 What's the difference between a transaction that deploys a contract and a transaction that transfers ETH?
6. 🧑‍💻 Write a contract that features 3 functions:
   * a view function that can be accessed only by the current contract
   * a pure function that's not accessible within the current contract
   * a view function that can be accessed from children's contracts
