// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Lottery {
    // The address of the contract manager (creator)
    address public manager;
    
    // Array to store addresses of players who entered the lottery
    address[] public players;

    // Constructor to initialize the manager of the contract
    constructor() {
        manager = msg.sender; // Set the manager to the address that deploys the contract
    }

    // Function to allow users to enter the lottery by sending ETH
    function enter() public payable {
        // Ensure that the sent value is greater than 0.05 ETH
        require(msg.value > .05 ether, "Minimum 0.05 ETH required");

        // Add the sender's address to the players array
        players.push(msg.sender);
    }

    // Function to generate a pseudo-random number (not secure for real-world applications)
    function getRandomNumber() private view returns (uint) {
        // Create a pseudo-random number using block difficulty, timestamp, and players array
        return uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp, players)));
    }

    // Function to pick a winner from the players array
    function pickWinner() public restricted {
        // Generate a random index to select a player as the winner
        uint index = getRandomNumber() % players.length;
        address winner = players[index];

        // Transfer the entire balance of the contract to the winner
        payable(winner).transfer(address(this).balance);

        // Reset the players array for the next round by clearing it
        delete players;
    }

    // Modifier to restrict access to certain functions to only the manager
    modifier restricted() {
        // Check if the caller is the manager
        require(msg.sender == manager, "Only manager can call this");
        _;
    }

    // Function to retrieve the list of players
    function getPlayers() public view returns (address[] memory) {
        // Return the array of players
        return players;
    }
}
