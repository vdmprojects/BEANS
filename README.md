Beancoin is a toy project with the following goals:

To create an ERC20 token that represents (unpicked) coffee berries on the farm at Vista Del Mar
To experiment with economic dynamics vis a vis UBI and token supply, as well as asset tokenization
To provide an environment for the Aletheia core team to:

  test their toolchain and library choices
  
  cut their teeth on smart contract architecture as well as DAPP dev in general
  
  perform a basic security analysis
  
  experiement with favored architectural paradigms that are expected to be used in future designs
  
  
FEATURE LIST ---------------------------- 
As presently envisioned, Beancoin will incorporate the following features:

  Total max supply of 1,000,000
  
  Addresses must be whitelisted?

  UBI of (15k?) beans ("monthly") to each authorized address, up to 15k per address total 

  Addresses may hold more than 15k, but UBI service  will not be performed on adresses that hold 15k+

  A tapering UBI distribution to always reach max distribution in "5 years"
  
  
Initial architecture choices include:

  A ledger controlled by an authorized address to whitelist addresses for inclusion (UBI, recieve)

  An address directory service contract controlled by an authorized address to enable contract versioning and retirement
  
  
  
  
  

