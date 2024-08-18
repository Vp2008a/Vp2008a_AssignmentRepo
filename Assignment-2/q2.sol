// 2. Simple Storage
// Question: How can a smart contract store and retrieve a single integer value?

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// A contract that allows storing and retrieving a single integer value.
contract SimpleStorage {
    uint256 private storedValue;

    // Function to store a value.
    function set(uint256 value) public {
        storedValue = value;
    }

    // Function to retrieve the stored value.
    function get() public view returns (uint256) {
        return storedValue;
    }
}
