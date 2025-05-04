// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title TodoList
 * @dev A simple Todo List smart contract that demonstrates Solidity data structures
 */
contract TodoList {
    
    // 1. Todo Status Enum
    enum Status { Pending, InProgress, Completed }
    
    // 2. Todo Struct
    struct Todo {
        uint id;
        string content;
        Status status;
    }
    
    // 3. Mapping and Array
    mapping(uint => Todo) private todos;
    uint[] public todoIds;
    
    // Counter for assigning unique IDs
    uint private nextId = 1;
    
    // 5. Event
    event TodoAdded(uint id, string content);
    event TodoStatusUpdated(uint id, Status status);
    
    /**
     * @dev Add a new todo item
     * @param _content Content of the todo item
     */
    function addTodo(string memory _content) public {
        // Create new todo with Pending status by default
        todos[nextId] = Todo({
            id: nextId,
            content: _content,
            status: Status.Pending
        });
        
        // Add the ID to our array
        todoIds.push(nextId);
        
        // Emit event
        emit TodoAdded(nextId, _content);
        
        // Increment ID for next todo
        nextId++;
    }
    
    /**
     * @dev Update the status of a todo item
     * @param _id ID of the todo item
     * @param _status New status for the todo item
     */
    function updateStatus(uint _id, Status _status) public {
        // Ensure the todo exists
        require(todoExists(_id), "Todo does not exist");
        
        // Update the status
        todos[_id].status = _status;
        
        // Emit status update event
        emit TodoStatusUpdated(_id, _status);
    }
    
    /**
     * @dev Get a specific todo item
     * @param _id ID of the todo item
     * @return id ID of the todo
     * @return content Content of the todo
     * @return status Status of the todo
     */
    function getTodo(uint _id) public view returns (uint id, string memory content, Status status) {
        // Ensure the todo exists
        require(todoExists(_id), "Todo does not exist");
        
        // Get the todo from mapping
        Todo storage todo = todos[_id];
        
        // Return the todo information
        return (todo.id, todo.content, todo.status);
    }
    
    /**
     * @dev Get the total number of todos
     * @return Number of todos
     */
    function getTodoCount() public view returns (uint) {
        return todoIds.length;
    }
    
    /**
     * @dev Check if a todo exists
     * @param _id ID of the todo item
     * @return Whether the todo exists
     */
    function todoExists(uint _id) internal view returns (bool) {
        // A todo exists if its ID is in the valid range and content is not empty
        if (_id < 1 || _id >= nextId) {
            return false;
        }
        
        // Check if the content is not empty (simple existence check)
        bytes memory contentBytes = bytes(todos[_id].content);
        return contentBytes.length > 0;
    }
}