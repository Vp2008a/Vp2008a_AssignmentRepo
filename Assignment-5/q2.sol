// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VotingSystem {
    struct Proposal {
        string name;  // Proposal name
        uint voteCount;  // Number of votes the proposal has received
    }

    mapping(uint => Proposal) public proposals;  // Store proposals by id
    mapping(address => mapping(uint => bool)) public votes;  // Track whether an address has voted for a proposal
    uint public proposalCount;  // Count of all proposals

    // Event to notify new proposal
    event NewProposal(string name);

    // Function to add a new proposal
    function addProposal(string memory _name) public {
        proposalCount++;
        proposals[proposalCount] = Proposal({
            name: _name,
            voteCount: 0
        });

        emit NewProposal(_name);
    }

    // Function to cast a vote for a proposal
    function vote(uint _proposalId) public {
        require(_proposalId > 0 && _proposalId <= proposalCount, "Invalid proposal ID");
        require(!votes[msg.sender][_proposalId], "You have already voted for this proposal");

        proposals[_proposalId].voteCount += 1;
        votes[msg.sender][_proposalId] = true;  // Mark that the sender has voted for this proposal
    }

    // Function to get the leading proposal
    function getWinningProposal() public view returns (string memory winningProposal, uint winningVoteCount) {
        uint winningId;
        for (uint i = 1; i <= proposalCount; i++) {
            if (proposals[i].voteCount > winningVoteCount) {
                winningVoteCount = proposals[i].voteCount;
                winningId = i;
            }
        }

        winningProposal = proposals[winningId].name;
    }
}
