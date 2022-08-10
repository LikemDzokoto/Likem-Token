// SPDX-License-Identifier: MIT
pragma solidity  >=0.4.22 <0.9.0;

/**
 * Token Interface
 */
interface  likemTokenInterface {
    function totalSupply() external view returns(uint256);

    function balanceOf(address account) external view returns (uint256);

    function transfer(address to, uint256 value) external returns(bool);
    
    function allowance(address owner, address spender) external view returns(uint256);
    
    function approve(address spender, uint256 value) external returns(bool);


    function transferFrom(address from,address to,uint256 value) external  returns (bool);


    event Transfer(address indexed from , address indexed to , uint256 value);


    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );










}