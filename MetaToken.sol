// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MetaToken {
    string public name;
    string public symbol;
    uint256 public totalSupply;
    
    mapping(address => uint256) public balanceOf;
    
    event Transfer(address indexed from, address indexed to, uint256 value);
    
    constructor(string memory _name, string memory _symbol, uint256 _initialSupply) {
        name = _name;
        symbol = _symbol;
        totalSupply = _initialSupply;
        balanceOf[msg.sender] = _initialSupply;
    }
    
    function transfer(address _from, address _to, uint256 _value) public returns (bool success) {
        require(_from != address(0), "Invalid sender address");
        require(_to != address(0), "Invalid recipient address");
        require(_value <= balanceOf[_from], "Insufficient balance");
        
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        
        emit Transfer(_from, _to, _value);
        
        return true;
    }
    
    function mint(address _to, uint256 _value) public returns (bool success) {
        totalSupply += _value;
        balanceOf[_to] += _value;
        
        emit Transfer(address(0), _to, _value);
        
        return true;
    }
    
    function burn(address _from, uint256 _value) public returns (bool success) {
        require(_from != address(0), "Invalid sender address");
        require(balanceOf[_from] >= _value, "Insufficient balance");
        
        balanceOf[_from] -= _value;
        totalSupply -= _value;
        
        emit Transfer(_from, address(0), _value);
        
        return true;
    }
}
