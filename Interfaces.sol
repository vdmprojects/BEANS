pragma solidity ^0.5.2;

import "./UBI.sol";

contract BeansInterface {
  function transfer(address _to, uint256 _value) returns (bool success);
}

contract BeanXInterface{
  function ownerOf(uint256 tokenId) public view returns (address owner);
}

contract Interfaces is UBI {

  address beansContract =0xc014aba62a72a6564ddf0223a2520914efffb405;
  address beanXContract = 0;

//BEANS (ERC20)
  BeansInterface beansContract;

  function setBeansAddress (address contractAddress) onlyOwner public {  //order of modifiers?
    require(contractAddress != 0, "Invalid contract address");
    beansContract = contractAddress;  
  }

  function transfer(address _to, uint256 _value) internal returns (bool) {  //internal makes this safe???
    bool success;
    success = beansContract.transfer(_to,_value);
    return (success)
  }

//BEANX (ERC721)
   BeanXInterface beanXContract;

  function setBeanxAddress (address contractAddress) onlyOwner public  {
    require(contractAddress != 0, "Invalid contract address");
    beanXContract = contractAddress;  
  }

  function ownerOf(uint256 tokenId) public view returns (address);  //public because why not
    address owner;
    owner = beanXContract.ownerOf(tokenId);
    return (owner)
  }

  function whichAdresses() public view returns(address,address){
    return (beanXContract, beansContract)
  }
}
