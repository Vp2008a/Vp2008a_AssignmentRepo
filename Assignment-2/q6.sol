// 6. Basic Voting
// Question: How can a smart contract allow users to vote for a candidate and keep track of votes?

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// A contract that allows users to vote for candidates and keeps track of votes.
contract Voting {
    mapping(string => uint256) private votes;

    // Function to cast a vote for a candidate.
    function vote(string memory candidate) public {
        votes[candidate] += 1;
    }

    // Function to get the vote count for a specific candidate.
    function getVotes(string memory candidate) public view returns (uint256) {
        return votes[candidate];
    }
}
