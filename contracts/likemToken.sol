// SPDX-License-Identifier: MIT
pragma solidity  >=0.4.22 <0.9.0;


/**
*@title Token - smart contract for likemToken(erc20 token standard)
*/


//import interface and ownable contract to be inherited into token contract
import "./likemTokenInterface.sol";
import "./ownable.sol";

contract likemToken  is likemTokenInterface,Ownable{
  string public name = "Likem Token";
  string public symbol = "$LTK";
  uint256 public totalSupply;

  mapping (address => uint256) public balanceOf;
  mapping (address => uint256) public allowance;



  //constructor 
  constructor(uint256 _initialSupply) public{
    balanceOf[msg.sender] = _initialSupply;
    totalSupply  = _initialSupply; 
  }

  //transfer function 
  function transfer(address _to , uint256 _value) public virtual override  returns  (bool success){
    require(balanceOf[msg.sender] >= _value,"insufficient funds");
    balanceOf[msg.sender] -= _value;
    balanceOf(_to) +=_value;

  }








  
  
  
  
  
  constructor() public {
  }
}
