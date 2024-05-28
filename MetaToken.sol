// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

contract MetaToken {
    string public name;
    string public symbol;
    uint8 public decimals = 18;  // Most tokens follow the 18 decimals standard
    uint256 public totalSupply;

    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    constructor(string memory _name, string memory _symbol, uint256 _initialSupply) {
        name = _name;
        symbol = _symbol;
        totalSupply = _initialSupply * (10 ** uint256(decimals));  // Adjust for decimals
        balanceOf[msg.sender] = totalSupply;
    }

    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(_to != address(0), "Invalid recipient address");
        require(_value <= balanceOf[msg.sender], "Insufficient balance");

        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;

        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    function approve(address _spender, uint256 _value) public returns (bool success) {
        allowance[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(_from != address(0), "Invalid sender address");
        require(_to != address(0), "Invalid recipient address");
        require(_value <= balanceOf[_from], "Insufficient balance");
        require(_value <= allowance[_from][msg.sender], "Allowance exceeded");

        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        allowance[_from][msg.sender] -= _value;

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
