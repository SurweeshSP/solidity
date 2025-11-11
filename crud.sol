// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ToDoList {
    struct Task {
        uint id;
        string content;
        bool completed;
    }

    uint public taskCount = 0;
    mapping(uint => Task) public tasks;

    function createTask(string memory _content) public {
        taskCount++;
        tasks[taskCount] = Task(taskCount, _content, false);
    }

    function toggleCompleted(uint _id) public {
        Task storage task = tasks[_id];
        task.completed = !task.completed;
    }
}
