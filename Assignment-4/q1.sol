// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HashChecker {
    // This function checks if the SHA-256 hash of the input starts with '00000'
    function checkHash(string memory input) public pure returns (bool) {
        // Compute the SHA-256 hash of the input
        bytes32 hash = sha256(abi.encodePacked(input));
        
        // Convert the hash to a string and check if it starts with '00000'
        // Check the first 5 hex digits (20 bits)
        return uint256(hash) < 0x0000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
    }
}
