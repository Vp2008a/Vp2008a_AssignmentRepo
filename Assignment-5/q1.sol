// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Crowdfunding {
    struct Campaign {
        address payable creator;  // Address of campaign creator
        uint goal;                // Funding goal of the campaign
        uint deadline;            // Timestamp of the deadline
        uint totalFunds;          // Total funds raised
        bool finalized;           // To check if the campaign is finalized
    }

    mapping(uint => Campaign) public campaigns;  // Store campaigns by id
    mapping(uint => mapping(address => uint)) public contributions;  // Store contributions per user per campaign
    uint public campaignCount;  // Count of all campaigns

    // Event to notify contribution
    event ContributionReceived(address contributor, uint amount);

    // Function to create a new crowdfunding campaign
    function createCampaign(uint _goal, uint _durationInDays) public {
        campaignCount++;
        campaigns[campaignCount] = Campaign({
            creator: payable(msg.sender),
            goal: _goal,
            deadline: block.timestamp + (_durationInDays * 1 days),
            totalFunds: 0,
            finalized: false
        });
    }

    // Function for participants to contribute to a campaign
    function contribute(uint _campaignId) public payable {
        Campaign storage campaign = campaigns[_campaignId];
        require(block.timestamp < campaign.deadline, "Campaign has ended");
        require(!campaign.finalized, "Campaign is already finalized");

        campaign.totalFunds += msg.value;
        contributions[_campaignId][msg.sender] += msg.value;

        emit ContributionReceived(msg.sender, msg.value);
    }

    // Finalize the campaign: if goal met, release funds; if not, allow refunds
    function finalizeCampaign(uint _campaignId) public {
        Campaign storage campaign = campaigns[_campaignId];
        require(block.timestamp >= campaign.deadline, "Campaign deadline not reached");
        require(!campaign.finalized, "Campaign already finalized");

        if (campaign.totalFunds >= campaign.goal) {
            // Goal reached, transfer funds to the campaign creator
            campaign.creator.transfer(campaign.totalFunds);
        } else {
            // Goal not met, contributors can withdraw their funds
            for (uint i = 0; i < campaignCount; i++) {
                uint contributedAmount = contributions[_campaignId][msg.sender];
                if (contributedAmount > 0) {
                    payable(msg.sender).transfer(contributedAmount);
                    contributions[_campaignId][msg.sender] = 0;
                }
            }
        }
        campaign.finalized = true;
    }

    // Allow contributors to withdraw if campaign failed
    function withdrawContribution(uint _campaignId) public {
        Campaign storage campaign = campaigns[_campaignId];
        require(block.timestamp >= campaign.deadline, "Campaign deadline not reached");
        require(campaign.totalFunds < campaign.goal, "Goal was met");

        uint amount = contributions[_campaignId][msg.sender];
        require(amount > 0, "No contribution found");

        contributions[_campaignId][msg.sender] = 0;
        payable(msg.sender).transfer(amount);
    }
}
