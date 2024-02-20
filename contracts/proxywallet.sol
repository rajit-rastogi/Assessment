// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./smartwallets.sol";

contract WalletProxy {

    // Mapping to store the address of each user's smart wallet contract
    mapping(address => address) public wallets;

    // Event to emit when a new smart wallet contract is created
    event WalletCreated(address indexed user, address indexed wallet);

    // Event to emit when a smart wallet contract is destroyed
    event WalletDestroyed(address indexed user, address indexed wallet);

    // Function to create a new smart wallet contract for a user
    function createWallet() external {
        // Check if the user already has a smart wallet contract
        require(wallets[msg.sender] == address(0), "User already has a smart wallet contract");

        // Create a new smart wallet contract for the user
        Wallet wallet = new Wallet(msg.sender);

        // Store the address of the new smart wallet contract in the mapping
        wallets[msg.sender] = address(wallet);

        // Emit a WalletCreated event
        emit WalletCreated(msg.sender, address(wallet));
    }

    // Function to destroy a user's smart wallet contract
    function destroyWallet() external {
        // Check if the user has a smart wallet contract
        require(wallets[msg.sender] != address(0), "User does not have a smart wallet contract");

        // Destroy the user's smart wallet contract
        Wallet(wallets[msg.sender]).destroy();

        // Delete the address of the user's smart wallet contract from the mapping
        delete wallets[msg.sender];

        // Emit a WalletDestroyed event
        emit WalletDestroyed(msg.sender, wallets[msg.sender]);
    }
    // Function to destroy a user's smart wallet contract
function destroyWallet(address _user) external {
    // Check if the user has a smart wallet contract
    require(wallets[_user] != address(0), "User does not have a smart wallet contract");

    // Destroy the user's smart wallet contract
    Wallet(wallets[_user]).destroy();

    // Delete the address of the user's smart wallet contract from the mapping
    delete wallets[_user];

    // Emit a WalletDestroyed event
    emit WalletDestroyed(_user, wallets[_user]);
}

// Function to allow a user to redeploy their smart wallet contract
function redeployWallet(address _user) external {
    // Check if the user has a smart wallet contract
    require(wallets[_user] == address(0), "User already has a smart wallet contract");

    // Create a new smart wallet contract for the user
    Wallet wallet = new Wallet(_user);

    // Store the address of the new smart wallet contract in the mapping
    wallets[_user] = address(wallet);

    // Emit a WalletCreated event
    emit WalletCreated(_user, address(wallet));
    }   
}
