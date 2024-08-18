// 3. Greeting Contract
// Question: How can a smart contract allow a user to set and get a personalized greeting message?

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// A contract that allows users to set and get a personalized greeting.
contract Greeting {
    string private greetingMessage;

    // Function to set a personalized greeting message.
    function setGreeting(string memory _greeting) public {
        greetingMessage = _greeting;
    }

    // Function to get the stored greeting message.
    function getGreeting() public view returns (string memory) {
        return greetingMessage;
    }
}
