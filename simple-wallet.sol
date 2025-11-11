// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleWallet {
    address public owner;

    constructor() {
        owner = msg.sender; // deployer is owner
    }

    // Deposit ETH into contract
    function deposit() public payable {}

    // Get contract balance
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    // Withdraw funds (only owner)
    function withdraw(uint _amount) public {
        require(msg.sender == owner, "Not authorized");
        payable(owner).transfer(_amount);
    }
}
