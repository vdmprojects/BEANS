pragma solidity ^0.5.2;
//UBI code and contract interfaces
 //This contract must hold the beans to distribute

//!!!! see https://solidity.readthedocs.io/en/v0.4.24/common-patterns.html for details on send vs withdraw ... we will have to implement the withdraw pattern instead of send. 

import "./Ownable.sol";
import "./SafeMath.sol";
//import "./Interfaces.sol";

interface BeansInterface {
  function transfer(address, uint256) external returns (bool);
  function balanceOf(address) external view returns (uint256);
}

interface BeanXInterface{
  function ownerOf(uint256) external view returns (address);
}

contract distribute_beans is Ownable {

    event message(string message, address errorAddress);

    using SafeMath for uint256;
 //   using SafeMath32 for uint32;
 //   using SafeMath16 for uint16;

    mapping (uint256 => uint) ubiDate ; //key is the ERC721 tokenID, value is a date  
    mapping (address => uint) pendingWithdrawals;
    
    address BeansAddress;
    address BeanXAddress;
    
    BeansInterface beansContract;    //BEANS (ERC20)

    function setBeansAddress (address contractAddress) public onlyOwner {
        require(contractAddress != address(0), "Invalid contract address");
        BeansAddress = contractAddress;
        beansContract = BeansInterface(contractAddress);  
    }

   BeanXInterface beanXContract;   //BEANX (ERC721)

    function setBeanxAddress (address contractAddress) public onlyOwner  { 
        require(contractAddress != address(0), "Invalid contract address");
        BeanXAddress = contractAddress;
        beanXContract = BeanXInterface(contractAddress);  
    }

    function whichAdresses() public view returns(address,address){
        return (BeanXAddress,BeansAddress);
    }

    function UBI_distribute (uint256 tokenId) public {  
    
          if (beanXContract.ownerOf(tokenId) == msg.sender) {   //TEST!!!!!!!!!!
          
            if (ubiDate[tokenId] != 0){
                //uint256 ubiamount = 50;  //50 until we get the balance 
                uint256 ubiamount = beansContract.balanceOf(address(this)).div(1800);  //TEST!!!!!!!!!!
                if (ubiamount > 50) {
                    ubiamount = 50;
                }

                uint256 ubiBeans = ((now.div(1 days)).sub(ubiDate[tokenId])).mul(ubiamount);
                pendingWithdrawals[msg.sender].add(ubiBeans);   
                                                               
                emit message ("beancoin distribution success for ", msg.sender);
                
            } else {
                ubiDate[tokenId] = now.div(1 days);
                emit message ("beancoin UBI initialized for ", msg.sender);
            }

        } else {
            emit message ("BeanX token not found at address ", msg.sender);
        }

    }

    function UBI_withdraw() public {
    
        uint amount = pendingWithdrawals[msg.sender];
        // Remember to zero the pending refund before
        // sending to prevent re-entrancy attacks
        pendingWithdrawals[msg.sender] = 0;
        beansContract.transfer(msg.sender,amount);     //msg.sender.transfer(amount);   ?
       //This contract must hold the beans to distribute
    }  
    
}
