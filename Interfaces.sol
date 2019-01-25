pragma solidity ^0.4.24;

import "./UBI.sol";

contract BeansInterface {
transfer(address _to, uint256 _value) returns (bool success);
}

contract BeanXInterface{
  function ownerOf(uint256 tokenId) public view returns (address owner);
}

contract Interfaces is UBI {

  BeansInterface beansContract;

  function setBeansContractAddress(address _address) external onlyOwner {
    beansContract = BeansInterface(_address);
  }

  function transfer(address _to, uint256 _value) internal returns (bool) {
    bool success;
    success = beansContract.transfer(_to,_value);
    return success
  }



    function setBeanXContractAddress(address _address) external onlyOwner {
    beanXContract = BeanXInterface(_address);
  }

  function ownerOf(uint256 tokenId) public view returns (address);
    bool owner;
    owner = beanXContract.ownerOf(tokenId);
    return owner
  }
}
