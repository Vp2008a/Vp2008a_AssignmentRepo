// 4. Simple Counter
// Question: How can a smart contract keep track of a count and allow it to be incremented?

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// A contract that tracks a count and allows it to be incremented.
contract Counter {
    uint256 private count;

    // Function to increment the count by 1.
    function increment() public {
        count += 1;
    }

    // Function to get the current count.
    function getCount() public view returns (uint256) {
        return count;
    }
}
