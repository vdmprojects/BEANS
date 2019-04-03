Beancoin is a toy project based on openzepplin token examples (https://github.com/OpenZeppelin/openzeppelin-solidity) with the following goals:

To create an ERC20 token that represents (unpicked) coffee berries on the farm at Vista Del Mar
To experiment with economic dynamics vis a vis UBI and token supply, as well as asset tokenization

To our testers:

On the Ropstien network:

BNS: 0xc0dd9a9cbee1ff9228b0d1977c4e21f345a3d0aa  (18 decimals)

BNSX: 0x7fe7c260afdcb10a794844da206c624cc056805c

NUBI: 0x235220535e2445ba415642a92d27b5f874709b91

Get a beansx token sent to your address (centrally issued)

call UBI_distribute with your BEANSX tokenID

Your bean distribution time will now be initialized (check the transaction logs, as text)

Come back in a day and call UBI_distribute again....this time you'll get some beans.

Call UBI_withdraw, and if you have withdrawable beans they will be sent the calling address (must be the same address that called UBI_distribute)

Unfortunately, you'll have to interact directly with the contract using something like MEW or another tool. Ill post the NUBI If anyone has good suggestions on generating a quick WEB3 interface, we're all ears!

Here is the NUBI ABI:

[
	{
		"constant": false,
		"inputs": [
			{
				"name": "contractAddress",
				"type": "address"
			}
		],
		"name": "setBeanxAddress",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": true,
		"inputs": [],
		"name": "whichAdresses",
		"outputs": [
			{
				"name": "",
				"type": "address"
			},
			{
				"name": "",
				"type": "address"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [
			{
				"name": "tokenId",
				"type": "uint256"
			}
		],
		"name": "UBI_distribute",
		"outputs": [
			{
				"name": "",
				"type": "uint256"
			},
			{
				"name": "",
				"type": "uint256"
			}
		],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [],
		"name": "UBI_withdraw",
		"outputs": [
			{
				"name": "",
				"type": "uint256"
			}
		],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [],
		"name": "renounceOwnership",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": true,
		"inputs": [],
		"name": "owner",
		"outputs": [
			{
				"name": "",
				"type": "address"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	},
	{
		"constant": true,
		"inputs": [],
		"name": "isOwner",
		"outputs": [
			{
				"name": "",
				"type": "bool"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [
			{
				"name": "contractAddress",
				"type": "address"
			}
		],
		"name": "setBeansAddress",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": true,
		"inputs": [],
		"name": "beans_in_contract",
		"outputs": [
			{
				"name": "",
				"type": "uint256"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [
			{
				"name": "newOwner",
				"type": "address"
			}
		],
		"name": "transferOwnership",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"anonymous": false,
		"inputs": [
			{
				"indexed": false,
				"name": "message",
				"type": "string"
			},
			{
				"indexed": false,
				"name": "errorAddress",
				"type": "address"
			}
		],
		"name": "message",
		"type": "event"
	},
	{
		"anonymous": false,
		"inputs": [
			{
				"indexed": true,
				"name": "previousOwner",
				"type": "address"
			},
			{
				"indexed": true,
				"name": "newOwner",
				"type": "address"
			}
		],
		"name": "OwnershipTransferred",
		"type": "event"
	}
]

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
    
  
  
  
  
  
  

