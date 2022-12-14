// SPDX-License-Identifier: MIT
pragma solidity  >=0.4.22 <0.9.0;


/**
*@title Token - smart contract for likemToken(erc20 token standard)
*/


//import interface and ownable contract to be inherited into token contract
import "./likemTokenInterface.sol";
import "./ownable.sol";

contract likemToken  is likemTokenInterface,Ownable {
  string public name = "Likem Token";
  string public symbol = "$LTK";
  uint256 public totalSupply;

  mapping (address => uint256) public balanceOf;
  mapping(address => mapping(address => uint256)) public  allowances;



  //constructor 
  constructor(uint256 _initialSupply) public{
    balanceOf[msg.sender] = _initialSupply;
    totalSupply  = _initialSupply; 
  }

  //transfer function 
  function transfer(address _to , uint256 _value) public virtual override  returns  (bool success){
    require(balanceOf[msg.sender] >= _value,"insufficient funds");
    balanceOf[msg.sender] -= _value;
    balanceOf[_to] +=_value;

    //call transfer event
    emit Transfer(msg.sender, _to, _value);
    return true;
  }
 


    
    //approval function
  function approve(address _spender, uint256 _value)
        public
        returns (bool success)
    {
        allowance[msg.sender][_spender] = _value;
        //call event
        emit Approval(msg.sender, _spender, _value);

        return true;
  }


     //transferfrom function
  function transferFrom(address _from, address _to, uint256 _value) public virtual override  returns (bool success){
      require(_value <= balanceOf[_from], "error");
      require(_value <=allowance[_from][msg.sender], "error");

      allowance[_from][msg.sender] -= _value;
      
      //update balance of sender and recipient
      balanceOf[_from] -=_value;
      balanceOf[_to] += _value;

     allowance[_from][msg.sender] -= _value;
    
    //call transfer event 
      emit Transfer(_from, _to,_value);
  }

    //allowance function 
  function allowance(address _owner, address _spender) 
      public 
      view  
      virtual  
      override 
      returns(uint256)
    {
      return balanceOf[account];
  }


    
   
  function mint(address account, uint256 _value) public virtual onlyOwner() {
        require(account != address(0), "Mint to the 1st adddress");

        totalSupply += _value;
        balanceOf[account] += _value;

        emit Transfer(address(0), account, _value);
    }
 
 
  
  
  
}
