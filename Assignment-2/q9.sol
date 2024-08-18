// 9. Simple Ledger
// Question: How can a smart contract maintain a ledger of transactions with basic entries?

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// A contract that maintains a simple ledger of transactions.
contract SimpleLedger {
    struct Transaction {
        address from;
        address to;
        uint256 amount;
    }

    Transaction[] private transactions;

    // Function to add a transaction to the ledger.
    function addTransaction(address to, uint256 amount) public {
        transactions.push(Transaction(msg.sender, to, amount));
    }

    // Function to retrieve all transactions.
    function getTransactions() public view returns (Transaction[] memory) {
        return transactions;
    }
}

