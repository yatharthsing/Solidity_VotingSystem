// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VotingSystem {
     uint public candidate1Votes;
     uint public candidate2Votes;

    mapping(address => bool) public hasVoted;  //map to remember which user addresses haqve already voted.

    function vote(uint _candidateId) public {
        require(hasVoted[msg.sender] == false, "You already voted once!");
        require(_candidateId == 1 || _candidateId == 2, "Pick candidate 1 or 2.");

        if (_candidateId == 1) {
            candidate1Votes = candidate1Votes + 1;
        } else if (_candidateId == 2) {
            candidate2Votes = candidate2Votes + 1;
        }

        hasVoted[msg.sender] = true;
    }

    function getVotes() public view returns (uint, uint) {
        return (candidate1Votes, candidate2Votes);
    }
}