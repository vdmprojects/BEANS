pragma solidity ^0.4.24;

import "./UBI.sol";

contract BeansInterface {
/*  function getKitty(uint256 _id) external view returns (
    bool isGestating,
    bool isReady,
    uint256 cooldownIndex,
    uint256 nextActionAt,
    uint256 siringWithId,
    uint256 birthTime,
    uint256 matronId,
    uint256 sireId,
    uint256 generation,
    uint256 genes
  );
  */
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
