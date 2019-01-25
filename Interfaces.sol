pragma solidity ^0.4.24;

import "./UBI.sol";

contract BeansInterface {
transfer(address _to, uint256 _value) returns (bool success);
}

contract Interfaces is UBI {

  BeansInterface beansContract;
/*
  modifier onlyOwnerOf(uint _zombieId) {
    require(msg.sender == zombieToOwner[_zombieId]);
    _;
  }
*/
  function setBeansContractAddress(address _address) external onlyOwner {
    beansContract = BeansInterface(_address);
  }


  function transfer(address _to, uint256 _value) returns (bool) {
    bool success;
    success = beansContract.transfer(_to,_value);
  }
}
