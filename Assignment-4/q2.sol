// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HashChecker {
    // Function to check if the input string starts with 'devadnani26'
    function startsWithDevadnani26(string memory input) public pure returns (bool) {
        bytes memory inputBytes = bytes(input);
        bytes memory prefixBytes = bytes("devadnani26");

        // Check if the input string is at least as long as the prefix
        if (inputBytes.length < prefixBytes.length) {
            return false;
        }

        // Compare the beginning of the input string with 'devadnani26'
        for (uint i = 0; i < prefixBytes.length; i++) {
            if (inputBytes[i] != prefixBytes[i]) {
                return false;
            }
        }

        return true;
    }

    // Function to check if the SHA-256 hash of the input starts with '00000'
    function hashStartsWith00000(string memory input) public pure returns (bool) {
        bytes32 hash = sha256(abi.encodePacked(input));
        return uint256(hash) < 0x0000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
    }

    // Combined function to check both conditions
    function checkConditions(string memory input) public pure returns (bool) {
        return startsWithDevadnani26(input) && hashStartsWith00000(input);
    }
}
