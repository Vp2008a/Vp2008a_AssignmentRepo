// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Donation {
    address public owner;
    mapping(address => uint256) public donations;

    event DonationReceived(address indexed donor, uint256 amount);
    event Withdrawn(uint256 amount);

    constructor() {
        owner = msg.sender;
    }

    // Function for anyone to donate
    function donate() public payable {
        require(msg.value > 0, "Donation must be greater than 0");
        donations[msg.sender] += msg.value;
        emit DonationReceived(msg.sender, msg.value);
    }

    // Function for the owner to withdraw funds
    function withdraw(uint256 amount) public {
        require(msg.sender == owner, "Only the owner can withdraw");
        require(address(this).balance >= amount, "Not enough funds in contract");
        payable(owner).transfer(amount);
        emit Withdrawn(amount);
    }

    // Get the contract balance
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
