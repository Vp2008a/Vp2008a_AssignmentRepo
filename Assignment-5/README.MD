# Solidity Smart Contracts: Crowdfunding & Voting System

This repository contains two basic Solidity smart contracts:
1. **Crowdfunding Contract**: A decentralized crowdfunding platform.
2. **Voting System Contract**: A decentralized voting system for proposals.

## Crowdfunding Contract

### Description
The Crowdfunding Contract allows users to create crowdfunding campaigns, participate by contributing funds, and finalize the campaign based on whether the funding goal is met by the deadline. If the campaign is successful, the funds are transferred to the creator. If unsuccessful, contributors can withdraw their funds.

### Features
- Create a crowdfunding campaign with a target amount and deadline.
- Users can contribute ETH to a campaign.
- Finalize the campaign after the deadline.
  - If the goal is reached, release funds to the creator.
  - If the goal is not reached, allow contributors to withdraw their contributions.

### Functions
- `createCampaign(uint _goal, uint _durationInDays)`: Creates a new campaign with a funding goal and duration.
- `contribute(uint _campaignId)`: Contribute ETH to a specified campaign.
- `finalizeCampaign(uint _campaignId)`: Finalizes the campaign. If the goal is met, releases funds to the creator. If not, contributors can withdraw their funds.
- `withdrawContribution(uint _campaignId)`: Allows contributors to withdraw funds if the campaign failed to reach the goal.

### Example Usage
1. **Deploy the contract** on a blockchain (e.g., using Remix, Hardhat, etc.).
2. **Create a new campaign** using the `createCampaign` function with a goal and deadline.
3. **Contribute funds** to the campaign using the `contribute` function.
4. **Finalize the campaign** using `finalizeCampaign` after the deadline.
5. If the goal was not met, contributors can call `withdrawContribution` to get their funds back.

---

## Voting System Contract

### Description
The Voting System Contract allows users to propose new options for voting, cast votes on those options, and view the current winner based on the highest number of votes. Each user (address) can only vote once per proposal.

### Features
- Users can propose new voting options.
- Users can vote on proposals.
- Each user can only vote once per proposal.
- The contract tracks the proposal with the highest votes.

### Functions
- `addProposal(string memory _name)`: Allows users to propose new voting options.
- `vote(uint _proposalId)`: Users can cast their vote for a specific proposal.
- `getWinningProposal()`: Returns the current winning proposal based on the highest number of votes.

### Example Usage
1. **Deploy the contract** on a blockchain.
2. **Add a proposal** using the `addProposal` function.
3. **Cast votes** using the `vote` function.
4. **Check the winning proposal** by calling `getWinningProposal`.

---

## Setup and Deployment

### Prerequisites
- [Remix](https://remix.ethereum.org/), [Hardhat](https://hardhat.org/), or any Ethereum-compatible development environment.
- Solidity version `^0.8.0`.

### Steps
1. Clone this repository.
2. Deploy the contracts using Remix or your preferred development environment.
3. Interact with the contracts by calling the respective functions.

### Example Deployment in Remix
1. Open [Remix IDE](https://remix.ethereum.org/).
2. Copy and paste the Solidity contract code.
3. Compile the contract with a Solidity version of `^0.8.0`.
4. Deploy the contract on a local blockchain (e.g., Ganache) or testnet.
5. Interact with the contract functions using the Remix interface.

---
