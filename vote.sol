// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleWallet {
    address public owner;

    // Store each user's deposit amount
    mapping(address => uint) public balances;

    constructor() {
        owner = msg.sender;  // whoever deploys the contract becomes the owner
    }

    // STEP 1: Deposit Ether
    function deposit() public payable {
        require(msg.value > 0, "Send some Ether to deposit");
        balances[msg.sender] += msg.value;  // add deposit to user's balance
    }

    // View your own balance
    function getMyBalance() public view returns (uint) {
        return balances[msg.sender];
    }

    // View total contract balance (all users combined)
    function getContractBalance() public view returns (uint) {
        return address(this).balance;
    }

    // STEP 2: Withdraw Ether (only if you already deposited)
    function withdraw(uint _amount) public {
        require(balances[msg.sender] >= _amount, "Insufficient balance");
        balances[msg.sender] -= _amount;  // deduct withdrawal from user's balance
        payable(msg.sender).transfer(_amount);  // send ETH to user
    }

    // Owner-only withdrawal (optional admin function)
    function withdrawAll() public {
        require(msg.sender == owner, "Not authorized");
        payable(owner).transfer(address(this).balance);
    }
}
