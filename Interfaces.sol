pragma solidity ^0.5.2;

import "./UBI.sol";
import "./Ownable.sol";

contract BeansInterface {
  function transfer(address _to, uint256 _value) public returns (bool success);
}

contract BeanXInterface{
  function ownerOf(uint256 tokenId) public view returns (address owner);
}

contract Interfaces is distribute_beans { // is UBI


//BEANS (ERC20)
  BeansInterface beansContract;

  function setBeansAddress (address contractAddress) public {  //order of modifiers? // onlyOwner
    require(contractAddress != 0, "Invalid contract address");
    beansContract = contractAddress;  
  }

  function transfer(address _to, uint256 _value) internal returns (bool) {  //internal makes this safe???
    bool success;
    success = beansContract.transfer(_to,_value);
    return (success);
  }

//BEANX (ERC721)
   BeanXInterface beanXContract;

  function setBeanxAddress (address contractAddress) public  { // onlyOwner
    require(contractAddress != 0, "Invalid contract address");
    beanXContract = contractAddress;  
  }

  function ownerOf(uint256 tokenId) public view returns (address owner){  //public because why not
    owner = beanXContract.ownerOf(tokenId);
    return (owner);
  }
  

  function whichAdresses() public view returns(address,address){
    return (beanXContract, beansContract);
  }
}
