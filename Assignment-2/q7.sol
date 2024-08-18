// 7. Owner Access
// Question: How can a smart contract restrict certain functions to only the contract owner?

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// A contract that restricts certain functions to only the contract owner.
contract OwnerAccess {
    address private owner;

    // Modifier to restrict access to the owner only.
    modifier onlyOwner() {
        require(msg.sender == owner, "Not the contract owner");
        _;
    }

    // Constructor to set the deployer as the owner.
    constructor() {
        owner = msg.sender;
    }

    // Function that can only be called by the owner.
    function restrictedFunction() public onlyOwner {
        // Restricted code goes here.
    }
}
