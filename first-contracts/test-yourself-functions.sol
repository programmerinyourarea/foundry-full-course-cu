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