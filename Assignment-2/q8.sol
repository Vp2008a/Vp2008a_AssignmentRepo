// 8. Event Logging
// Question: How can a smart contract log events when certain actions are performed?

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// A contract that logs events when specific actions are performed.
contract EventLogger {
    // Define an event to log actions.
    event ActionPerformed(address indexed performer, string action);

    // Function to log an action.
    function logAction(string memory action) public {
        emit ActionPerformed(msg.sender, action);
    }
}