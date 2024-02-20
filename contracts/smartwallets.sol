// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Wallet {

    // The owner of the smart wallet contract
    address public owner;

    // Constructor function to set the owner of the smart wallet contract
    constructor(address _owner) {
        owner = _owner;
    }

    // Function to mimic a call to another contract
    function mimicCall(address _to, uint256 _value, bytes calldata _data) external payable {
        // Check if the sender is the owner of the smart wallet contract
        require(msg.sender == owner, "Only the owner can mimic calls");

        // Mimic a call to the specified contract
        (bool success, ) = _to.call{value: _value}(_data);

        // Check if the call was successful
        require(success, "Mimic call failed");
    }

    // Function to destroy the smart wallet contract
    function destroy() external {
        // Check if the sender is the owner of the smart wallet contract
        require(msg.sender == owner, "Only the owner can destroy the contract");

        // Destroy the smart wallet contract
        payable(owner).transfer(address(this).balance);
    }
}