// 5. Name Storage
// Question: How can a smart contract store and retrieve a user's name?

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// A contract that allows storing and retrieving a user's name.
contract NameStorage {
    string private userName;

    // Function to set a user's name.
    function setName(string memory _name) public {
        userName = _name;
    }

    // Function to retrieve the stored name.
    function getName() public view returns (string memory) {
        return userName;
    }
}

