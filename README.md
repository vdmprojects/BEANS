Central Concept:

Combining ERC20 and ERC721 tokens to create a new class of “registered” token with additional contract managable features

By combining ERC20 fungible tokens with ERC721 digital assets, we are able to create new functionality for “registered” tokens. Minor modifications to the boilerplate ERC20 and ERC721 contracts allow one or more ERC20 tokens to be “paired” with one or more ERC721 “license” tokens.

This enables added contractually controlled functionality, by requiring an ERC721 license token to enable certain contract features, or constraining the functionality of license tokens based on holdings of
ERC20 fungible tokens. 

This can be useful in many circumstances, with some examples following:

We first used this concept with Beancoin (BNS)  ( https://github.com/vdmprojects/BEANS ) to control the distribution of the Universal Basic Income. In this example, The BNX token confers a contractually provisioned capability on the bearer to receive the BNS Universal Basic Income (UBI) distribution.

To receive ERC20 BNS from the NUBI contract, a user must hold a BeansX ERC721 token (BNX), with a unique registration ID. 

The user calls the ‘UBI_distribute’ function, passing her unique BNX registration ID. 

If the contract sees that the calling address holds the referenced BNX token, it responds by either registering that BNX token ID for UBI distribution and starting the UBI timer for that ID, or if the ID has previously been registered, allocating BNS to the calling address (and BNX token-holder) in proportion to the time elapsed since the last distribution to that BNX ID. Allocated BNS may then be withdrawn by calling the ‘UBI_withdraw’ function from the address the BNS were allocated to.

This simple functionality eliminates the possibility of users allocating UBI to multiple addresses by requiring the unique BNX ‘license’ to enable the UBI distribution. In this way, the license to receive UBI can also be moved to other addresses, exchanged, or traded subsequent to the original minting of each BNX license.

From this example, we can go on to imagine a asset system, for example, that applies a “tax” on transactions based on the holdings of the payer. The obvious attack on this is to distribute fractional holdings across various addresses, thereby paying a lower tax than the actual total holdings might otherwise incur.

Such a system could be made resistant to such address spoofing using a similar 2 token system as in the beancoin example. In this case, we would disallow ERC20 fungible transfers to or from addresses that did not posses an ERC721 ‘license’ token, and also disallow the license token from being transferred to an address that already held the paired ERC20 asset.

With such systems combining two or more fungible (ERC20) and unique (ERC721) token types, robust contractual systems can be constructed which have their functionality defined by balances and keys, or combinations thereof. This can enable decentralized governance of asset disposition, and help to enforce contractual requirements without the use of external oracles or services.



Beancoin is a toy project based on openzepplin token examples (https://github.com/OpenZeppelin/openzeppelin-solidity) with the following goals:

To create an ERC20 token that represents (unpicked) coffee berries on the farm at Vista Del Mar
To experiment with economic dynamics vis a vis UBI and token supply, as well as asset tokenization

To our testers:

On the Ropsten network:

BNS:  0xc0dd9a9cbee1ff9228b0d1977c4e21f345a3d0aa (18 decimals)

BNSX: 0x7fe7c260afdcb10a794844da206c624cc056805c

NUBI:  0x235220535e2445ba415642a92d27b5f874709b91

STEP1: Get a beansx token sent to your address.

STEP2: Using the NUBI ABI, call UBI_distribute with your BEANSX tokenID

Your bean distribution time will now be initialized (check the transaction logs, as text)

STEP3: Come back in a day or so and call UBI_distribute again....this time you'll get some beans.

STEP4: Call UBI_withdraw, and if you have withdrawable beans they will be sent the calling address (must be the same address that called UBI_distribute)

If you come to Vista del mar, I'll honor your beans (even fake ropsten beans) as delicous locally grown coffee

Unfortunately, you'll have to interact directly with the contract using something like MEW or another tool. Ill post the NUBI If anyone has good suggestions on generating a quick WEB3 interface, we're all ears!

Here is the NUBI ABI:

[ { "constant": false, "inputs": [ { "name": "contractAddress", "type": "address" } ], "name": "setBeanxAddress", "outputs": [], "payable": false, "stateMutability": "nonpayable", "type": "function" }, { "constant": true, "inputs": [], "name": "whichAdresses", "outputs": [ { "name": "", "type": "address" }, { "name": "", "type": "address" } ], "payable": false, "stateMutability": "view", "type": "function" }, { "constant": false, "inputs": [ { "name": "tokenId", "type": "uint256" } ], "name": "UBI_distribute", "outputs": [ { "name": "", "type": "uint256" }, { "name": "", "type": "uint256" } ], "payable": false, "stateMutability": "nonpayable", "type": "function" }, { "constant": false, "inputs": [], "name": "UBI_withdraw", "outputs": [ { "name": "", "type": "uint256" } ], "payable": false, "stateMutability": "nonpayable", "type": "function" }, { "constant": false, "inputs": [], "name": "renounceOwnership", "outputs": [], "payable": false, "stateMutability": "nonpayable", "type": "function" }, { "constant": true, "inputs": [], "name": "owner", "outputs": [ { "name": "", "type": "address" } ], "payable": false, "stateMutability": "view", "type": "function" }, { "constant": true, "inputs": [], "name": "isOwner", "outputs": [ { "name": "", "type": "bool" } ], "payable": false, "stateMutability": "view", "type": "function" }, { "constant": false, "inputs": [ { "name": "contractAddress", "type": "address" } ], "name": "setBeansAddress", "outputs": [], "payable": false, "stateMutability": "nonpayable", "type": "function" }, { "constant": true, "inputs": [], "name": "beans_in_contract", "outputs": [ { "name": "", "type": "uint256" } ], "payable": false, "stateMutability": "view", "type": "function" }, { "constant": false, "inputs": [ { "name": "newOwner", "type": "address" } ], "name": "transferOwnership", "outputs": [], "payable": false, "stateMutability": "nonpayable", "type": "function" }, { "anonymous": false, "inputs": [ { "indexed": false, "name": "message", "type": "string" }, { "indexed": false, "name": "errorAddress", "type": "address" } ], "name": "message", "type": "event" }, { "anonymous": false, "inputs": [ { "indexed": true, "name": "previousOwner", "type": "address" }, { "indexed": true, "name": "newOwner", "type": "address" } ], "name": "OwnershipTransferred", "type": "event" } ]

Goals: To provide an environment for the Aletheia core team to:

test their toolchain and library choices
  
cut their teeth on smart contract architecture as well as DAPP dev in general
  
perform a basic security analysis
  
experiement with favored architectural paradigms that are expected to be used in future designs
  
https://github.com/vdmprojects/BEANS/blob/master/UBI/NUBI.sol
  
  
  
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
    
  
  
  
  
  
  

