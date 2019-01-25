pragma solidity ^0.4.24;

import "./UBI.sol";

contract BeansInterface {
transfer(address _to, uint256 _value) returns (bool success);
}

contract BeanXInterface{
  function ownerOf(uint256 tokenId) public view returns (address owner);
}

contract Interfaces is UBI {

//BEANS (ERC20)
  BeansInterface beansContract;

  function setBeansContractAddress(address _address) external onlyOwner {
    beansContract = BeansInterface(_address);
  }

  function transfer(address _to, uint256 _value) internal returns (bool) {  //internal makes this safe???
    bool success;
    success = beansContract.transfer(_to,_value);
    return success
  }

//BEANX (ERC721)
   BeanXInterface beanXContract;

    function setBeanXContractAddress(address _address) external onlyOwner {
    beanXContract = BeanXInterface(_address);
  }

  function ownerOf(uint256 tokenId) public view returns (address);  //public because why not
    bool owner;
    owner = beanXContract.ownerOf(tokenId);
    return owner
  }
}
