// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract MyToken {
    // public variables here
    string constant public name = "Test token";
    string constant public token = "TST";
    uint constant public initial_supply = 1000000;
    uint public total_supply = initial_supply;

    // mapping variable here
    mapping(address => uint) private balances;

    // mint function
    function mint(uint amount) external {
        if(total_supply >= amount) {
            total_supply -= amount;
            balances[msg.sender] += amount;
        }
    }

    // burn function
    function burn(uint amount) external {
        if(balances[msg.sender] >= amount) {
            balances[msg.sender] -= amount;
            total_supply += amount;
        }
    }

    function balance() external view returns(uint) {
        return balances[msg.sender];
    }

}
