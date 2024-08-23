# Lottery Smart Contract

This Solidity smart contract implements a basic lottery system where users can enter the lottery by sending ETH, and a winner is selected randomly to receive the total prize.

## Features

- **Enter Lottery:** Users can enter the lottery by sending more than 0.05 ETH.
- **Pick Winner:** The contract manager can pick a random winner who receives the entire contract balance.
- **Reset for New Round:** After picking a winner, the contract resets for the next lottery round.
- **Get Players:** Anyone can view the list of players currently entered in the lottery.

## Contract Details

### State Variables

- `manager`: The address of the contract manager (creator).
- `players`: An array of addresses representing the players who have entered the lottery.

### Constructor

- **`constructor()`**: Initializes the manager to the address that deploys the contract.

### Functions

- **`enter()`**: Allows users to enter the lottery by sending ETH. Requires a minimum of 0.05 ETH.
  

