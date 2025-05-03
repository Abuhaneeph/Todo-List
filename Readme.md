# Solidity Todo List Smart Contract

A decentralized Todo List application built on the Ethereum blockchain. This smart contract leverages Solidity's data structures to create a simple yet functional task management system.

## Overview

This Todo List smart contract allows users to:
- Create new todo items
- Update the status of existing todos
- View details of specific todos
- Track all todo IDs

The contract demonstrates key Solidity concepts including enums, structs, mappings, arrays, and events.

## Contract Structure

### Todo Status

Each todo item has one of three possible statuses:
- `Pending` - Task hasn't been started yet
- `InProgress` - Task is currently being worked on
- `Completed` - Task has been finished

### Todo Structure

Each todo item contains:
- `id` - Unique identifier for the todo
- `content` - Description of the task
- `status` - Current state of the todo (using the Status enum)

## Features

### Core Functionality

| Function | Description |
|----------|-------------|
| `addTodo` | Creates a new todo item with "Pending" status |
| `updateStatus` | Changes the status of an existing todo |
| `getTodo` | Retrieves all details about a specific todo |
| `getTodoCount` | Returns the total number of todos |

### Events

The contract emits events to allow external applications to react to changes:

| Event | Description |
|-------|-------------|
| `TodoAdded` | Triggered when a new todo is created |
| `TodoStatusUpdated` | Triggered when a todo's status changes |

## Technical Implementation

### Data Structures

The contract uses:
- An `enum` to represent the three possible todo statuses
- A `struct` to define the Todo data structure
- A `mapping` to efficiently store and retrieve todos by ID
- An `array` to keep track of all todo IDs

### Storage Strategy

- Todo items are stored in a private mapping for data integrity
- Todo IDs are tracked in a public array for enumeration
- A counter ensures each todo receives a unique, sequential ID

## Usage Examples

### Creating a Todo

```javascript
// Using web3.js
await todoList.methods.addTodo("Complete Lisk Africa assignment").send({ from: myAddress });
```

### Updating a Todo's Status

```javascript
// Using web3.js
const Status = {
  Pending: 0,
  InProgress: 1,
  Completed: 2
};

// Mark todo #1 as in progress
await todoList.methods.updateStatus(1, Status.InProgress).send({ from: myAddress });

// Later, mark it as completed
await todoList.methods.updateStatus(1, Status.Completed).send({ from: myAddress });
```

### Getting Todo Details

```javascript
// Using web3.js
const [id, content, status] = await todoList.methods.getTodo(1).call();
console.log(`Todo #${id}: ${content} (Status: ${status})`);
```

### Getting Todo Count

```javascript
// Using web3.js
const count = await todoList.methods.getTodoCount().call();
console.log(`You have ${count} todos.`);
```

## Example DApp Integration

This smart contract can serve as the backend for a decentralized Todo application:

1. **Frontend**: React/Vue/Angular application
2. **Interaction**: Web3.js or Ethers.js
3. **Authentication**: MetaMask or WalletConnect

The frontend would:
- Display all todos by iterating through the todoIds array
- Provide a form to add new todos
- Include buttons to update todo statuses
- Listen for events to update the UI in real-time

## Development and Testing

### Requirements

- Solidity ^0.8.0
- Truffle, Hardhat, or Remix IDE

### Testing Scenarios

1. **Basic functionality**:
   - Add several todos
   - Verify they have correct IDs and "Pending" status
   - Update statuses and verify changes

2. **Edge cases**:
   - Try to get a non-existent todo
   - Update status of a non-existent todo

## Security Considerations

- The contract includes checks to ensure todos exist before operations
- All functions validate inputs to prevent unexpected behavior
- Consider adding access control if todos should be user-specific

## License

This project is licensed under the MIT License.

---

*Created for Lisk Africa Developer's Bootcamp - Week 3: Data Structures*