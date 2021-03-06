pragma solidity ^0.5.2;
//Logic for UBI contract

//ERC20 Beans
//ERC721 BeanX





//!!!! see https://solidity.readthedocs.io/en/v0.4.24/common-patterns.html for details on send vs withdraw ... we will have to implement the withdraw pattern instead of send. 
 
 
 //-----------------------Almost Decent pseudocode follows
 
import "./Ownable.sol";
import "./SafeMath.sol";
import "./Interfaces.sol";

contract distribute_beans is Ownable {


    event message(string message, address errorAddress);

    using SafeMath for uint256;
 //   using SafeMath32 for uint32;
 //   using SafeMath16 for uint16;

    mapping (uint256 => uint) ubiDate ; //key is the ERC721 tokenID, value is a date  
    mapping (address => uint) pendingWithdrawals;

    address beansContract; // = address
    address beanXContract; // = address

    function UBI_distribute (uint256 tokenId) public {  
    
          address tokenOwner = ownerOf(tokenId); // DeclarationError: Undeclared identifier. Did you mean "owner"?
          if (tokenOwner == msg.sender) {   //TEST!!!!!!!!!!
          
            if (ubiDate[tokenId] != 0){
                uint256 ubiamount = 50;  //Super TEST!!!!!!!!!!
                // uint256 ubiamount = balanceOf(this_contract).div (1800);  //TEST!!!!!!!!!!
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
        msg.sender.transfer(amount);    //TEST!!!!!!!!!!
                                                //This contract must hold the beans to distribute?
    }  
    
}
