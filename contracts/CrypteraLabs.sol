// contracts/Project.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract Project {
string public projectName = "CrypteraLabs";
address public owner;
uint256 public totalFunds;


mapping(address => uint256) public contributions;


constructor() {
owner = msg.sender;
}


// Function to contribute funds to the project
function contribute() public payable {
require(msg.value > 0, "Must send some ether");
contributions[msg.sender] += msg.value;
totalFunds += msg.value;
}


// Function to withdraw funds (only owner)
function withdraw(uint256 amount) public {
require(msg.sender == owner, "Only owner can withdraw");
require(amount <= address(this).balance, "Insufficient balance");
payable(owner).transfer(amount);
}


// Function to get project summary
function getSummary() public view returns (string memory, address, uint256) {
return (projectName, owner, totalFunds);
}
}