//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract MyToken {
    string public name = "newZ";
    string public symbol = "ZzZ";
    uint8 public decimals = 18;
    uint256 public totalSupply = 1000 * 10 ** decimals;
    mapping(address => uint256) public balanceOf;
    event Transfer(address indexed from, address indexed to, uint256 value);

    constructor() {
        balanceOf[msg.sender] = totalSupply;
    }

    function transfer(address to, uint256 value) public returns (bool success) {
        require(balanceOf[msg.sender] >= value, "Insufficient balance");
        balanceOf[msg.sender] -= value;
        balanceOf[to] += value;
        emit Transfer(msg.sender, to, value);
        return true;
    }
}

// import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

// contract NewZ is ERC20 {
//     constructor() ERC20("newZ", "ZzZ") {
//         _mint(msg.sender, 1000 * 10 ** decimals());
//     }
// }
