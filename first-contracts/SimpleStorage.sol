// SPDX-License-Identifier: MIT
pragma solidity 0.8.29; //latest solidity version

contract SimpleStorage{
    bytes favoriteByte = "cat";// storage 
    uint256 favoriteNumber; //this part of contract is using storage
    function store(uint256 _memoryNumber)public {
        favoriteNumber = _memoryNumber; //stores input (  _memoryNumber in favoriteNumber
        // '_' in front to indicate that the memory variable is a different one from storage variable
        // memory, exists only when function was called
    }
    function retrieve()public view returns(uint256){
        return favoriteNumber;
    }

}