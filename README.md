Beancoin is a toy project based on openzepplin token examples (https://github.com/OpenZeppelin/openzeppelin-solidity) with the following goals:

To create an ERC20 token that represents (unpicked) coffee berries on the farm at Vista Del Mar
To experiment with economic dynamics vis a vis UBI and token supply, as well as asset tokenization
To provide an environment for the Aletheia core team to:

  test their toolchain and library choices
  
  cut their teeth on smart contract architecture as well as DAPP dev in general
  
  perform a basic security analysis
  
  experiement with favored architectural paradigms that are expected to be used in future designs
  
  
FEATURE LIST ---------------------------- 

ERC 20?

As presently envisioned, Beancoin will incorporate the following features:

  Total max supply of 1,000,000 (decimal 18)
  
  Addresses whitelisted for UBI (universal Bean Income) distribution via posessiton of a (centrally issued) ERC721 beansX token

  UBI of 1250? beans ("monthly") to each authorized address
  
  A tapering UBI distribution to always reach max distribution in "5 years"
  
-----------------------------  
Initial architecture choices include:

  A ledger controlled by an authorized address to whitelist addresses for inclusion (UBI, recieve) - BEANSX ERC721 token

  An address directory service contract controlled by an authorized address to enable contract versioning and retirement (not implemented)
  

    
    
NOTE: THIS IS AN EXPERIEMENTAL AND PROBABLY FLAWED TOY. DO NOT USE TO CREATE REAL THINGS.    
    
    
To deploy, deploy the contents of the folders BEANS, BEANSX, and NUBI.SOL in UBI. 
NUBI is the UBI engine, and enables beans distribution to BEANSX holders.

Works like this:

Get a beansx token sent to your address (centrally issued)

call UBI_distribute with your BEANSX tokenID

Your bean ditribution time will now be initialized (check the transaction logs, as text)

Come back in a day and call UBI_distribute again....this time youll get some beans.

Call UBI_withdraw, and if you have withdrawable beans they will be sent the calling address (must be the same address that called UBI_distribute)
    
  
  
  
  
  
  

