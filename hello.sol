// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HelloBlockchain {
    string public message;

    // Constructor runs only once when contract is deployed
    constructor(string memory _message) {
        message = _message;
    }

    // Function to update the message
    function updateMessage(string memory _newMessage) public {
        message = _newMessage;
    }
}
