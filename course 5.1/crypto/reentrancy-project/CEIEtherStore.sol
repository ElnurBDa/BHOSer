// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

// Safe
contract CEIEtherStore {
    mapping(address => uint256) public balances;

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw() public {
        uint256 bal = balances[msg.sender];
        require(bal > 0);
	
	// This Line is Moved, so it updates, and only then it sends
        balances[msg.sender] = 0;

        (bool sent,) = msg.sender.call{value: bal}("");
        require(sent, "Failed to send Ether");

    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
