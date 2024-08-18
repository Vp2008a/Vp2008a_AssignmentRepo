// 10. Message Storage
// Question: How can a smart contract allow a user to store and retrieve a message string?

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// A contract that allows users to store and retrieve a message.
contract MessageStorage {
    string private message;

    // Function to set a message.
    function setMessage(string memory _message) public {
        message = _message;
    }

    // Function to retrieve the stored message.
    function getMessage() public view returns (string memory) {
        return message;
    }
}

