# Sales

There are 4 contracts related to the sale process:

- EthealDeposit.sol
- EthealNormalSale.sol
- EthealPromoTokens.sol (and its base class AbstactVirtualToken.sol)

The PreSale period is over and now customers can buy HEAL tokens during Sale period only. 
There is a hard cap normal sales token distribution: $10M or 14300 HEAL tokens. cr

To buy tokens, there are few options:

- call `deposit()` function of deposit contract
- send Ethers to deposit contract itself (through payable fallback function)
- call `buyTokens()` function of the normal sales contract.

The last one could be done only by whitelisted customers OR within whitelist treshold limit, otherwise it will be reverted. Therefore it is worth to consider bying HEAL tokens through deposit contract interface. 
	

## Whitelist

Contract: [EthealWhitelist.sol](https://github.com/BlockchainLabsNZ/etheal-contracts/blob/master/contracts/EthealWhitelist.sol)

## Normal sales
Contract: [EthealNormalSales.sol](https://github.com/BlockchainLabsNZ/etheal-contracts/blob/master/contracts/EthealNormalSale.sol)

The contract regulate the Sale period and allow user to buy tokens.
There is limitation: customers can buy tokens only if the amount of ETH to contribute doesn't exceed the allowed treshold, otherwise the transaction will fail. 

It is not a bad idea to check how far you are from the cap with Etheal website before buying token – to avoid gas spending in case if hard cap will be reached.


## Depositing

Contract: [EthealDeposit.sol](https://github.com/BlockchainLabsNZ/etheal-contracts/blob/master/contracts/EthealDeposit.sol)

Pre requisites:

- address of sale contract
- address of whitelist contract


## Bonuses
Contracts: [EthealPromoTokens.sol](https://github.com/BlockchainLabsNZ/etheal-contracts/blob/master/contracts/EthealPromoToken.sol), [AbstractVirtualToken.sol](https://github.com/BlockchainLabsNZ/etheal-contracts/blob/master/contracts/AbstractVirtualToken.sol)

One can get bonuses by:

- early involvement
- holding tokens
- high contribution amount
- finding the easter egg 


