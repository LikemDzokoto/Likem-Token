// SPDX-License-Identifier: GPL-3.0

pragma solidity  >=0.4.22 <0.9.0;

abstract contract Ownable {
  address public owner;

  constructor (){
      owner = msg.sender;
  }
  modifier onlyOwner(){
      require(msg.sender == owner);
      _;

  }
}