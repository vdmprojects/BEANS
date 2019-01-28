pragma solidity ^0.5.2;

import "./UBI.sol";
import "./Ownable.sol";

interface BeansInterface {
  function transfer(address, uint256) public returns (bool) {}
}

interface BeanXInterface{
  function ownerOf(uint256) public view returns (address) {}
}



contract Interfaces is distribute_beans {


//BEANS (ERC20)
  BeansInterface beansContract;

  function setBeansAddress (address contractAddress) public {  //order of modifiers? // onlyOwner
    require(contractAddress != 0, "Invalid contract address");
    beansContract = BeansInterface(contractAddress);  
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
    beanXContract = BeanXInterface(contractAddress);  
  }

  function ownerOf(uint256 tokenId) public view returns (address owner){  //public because why not
    owner = beanXContract.ownerOf(tokenId);
    return (owner);
  }
  

  function whichAdresses() public view returns(address,address){
    return (beanXContract, beansContract);
  }
}
