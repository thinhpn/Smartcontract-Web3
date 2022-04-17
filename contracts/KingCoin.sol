// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract KingCoin {

    mapping(address => uint) public balances;
    mapping(address => mapping(address => uint)) public allowance;

    uint public totalSupply =  100000*10**18;// 100k coin 
    string public name = 'KingCoin';
    string public symbol = 'KGN';
    uint public decimals =  18;

    event Transfer(address indexed from, address indexed to, uint value);
    event Approval(address indexed owner, address indexed spender, uint value);

    constructor () {
        balances[msg.sender] =  totalSupply;
    }

    function balanceOf(address owner) public view returns (uint) {
        return balances[owner];
    }

    function transfer(address to, uint value) public returns (bool) {

        bool isSuccess = false;
        require(balanceOf(msg.sender) >= value, 'Tai khoan khong du so du de chuyen');
        balances[msg.sender] -= value;
        balances[to] += value;        
        isSuccess = true;
        emit Transfer(msg.sender, to, value);
        
        return isSuccess;
    }

    function transferFrom(address from, address to, uint value) public returns(bool) {
        bool isSuccess = false;
        require(balanceOf(from) >= value, 'Tai khoan chuyen khong du so du');
        require(allowance[from][msg.sender] >= value, 'Tai khoan chuyen khong du so du');
        balances[from] -= value;
        balances[to] += value;
        isSuccess = true;
        emit Transfer(from, to, value);

        return isSuccess;
    }

    function aprroval(address spender, uint value) public returns(bool) {
        bool isSuccess = false;
        allowance[msg.sender][spender] = value;
        isSuccess = true;
        emit Approval(msg.sender, spender, value);

        return isSuccess;
    }


}
