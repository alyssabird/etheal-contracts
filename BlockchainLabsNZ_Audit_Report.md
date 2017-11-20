# Etheal Audit Report

## Preamble
This audit report was undertaken by BlockchainLabs.nz for the purpose of providing feedback to Etheal. It has subsequently been shared publicly without any express or implied warranty.

Solidity contracts were sourced from the public Github repo [thesved/etheal-sale](https://github.com/thesved/etheal-sale) prior to commit [908389dd18cf892aaff28c19536459dcc434571b](https://github.com/thesved/etheal-sale/tree/908389dd18cf892aaff28c19536459dcc434571b) - we would encourage all community members and token holders to make their own assessment of the contracts.

## Scope
All Solidity code contained in [/contracts](https://github.com/thesved/etheal-sale/tree/master/contracts) was considered in scope along with the tests contained in [/test](https://github.com/thesved/etheal-sale/tree/master/test) as a basis for static and dynamic analysis.

## Focus Areas
The audit report is focused on the following key areas - though this is not an exhaustive list.
### Correctness
- No correctness defects uncovered during static analysis?
- No implemented contract violations uncovered during execution?
- No other generic incorrect behaviour detected during execution?
- Adherence to adopted standards such as ERC20?
### Testability
- Test coverage across all functions and events?
- Test cases for both expected behaviour and failure modes?
- Settings for easy testing of a range of parameters?
- No reliance on nested callback functions or console logs?
- Avoidance of test scenarios calling other test scenarios?
### Security
- No presence of known security weaknesses?
- No funds at risk of malicious attempts to withdraw/transfer?
- No funds at risk of control fraud?
- Prevention of Integer Overflow or Underflow?
### Best Practice
- Explicit labeling for the visibility of functions and state variables?
- Proper management of gas limits and nested execution?
- Latest version of the Solidity compiler?

## Classification
### Defect Severity
- Minor - A defect that does not have a material impact on the contract execution and is likely to be subjective.
- Moderate - A defect that could impact the desired outcome of the contract execution in a specific scenario.
- Major - A defect that impacts the desired outcome of the contract execution or introduces a weakness that may be exploited.
- Critical - A defect that presents a significant security vulnerability or failure of the contract across a range of scenarios.

## Findings
### Minor
- **The constant keyword is being used in functions, this will be deprecated at the next breaking release** - `Best practice` `constant` should not be used for functions, it is going to be invalid at the next breaking release of solidity. Refer to [solidity/issues/192](https://github.com/ethereum/solidity/issues/992). Some functions have already been changed to `view` or `pure` but this is not consistent. [View on GitHub](https://github.com/BlockchainLabsNZ/etheal-contracts/issues/7)
  - [ ] Not Fixed
- **Keep formatting of if statements consistent** - `Best practice` We would recommend avoiding single line `if` statements without using braces, this pattern is prone for introducing bugs. Eg. `EthealPreSale.sol` [Line 420](https://github.com/BlockchainLabsNZ/etheal-contracts/blob/master/contracts/EthealPreSale.sol#L420) [Line 142](https://github.com/BlockchainLabsNZ/etheal-contracts/blob/master/contracts/EthealPreSale.sol#L142) [Line 177](https://github.com/BlockchainLabsNZ/etheal-contracts/blob/master/contracts/EthealPreSale.sol#L177) [Line 420](https://github.com/BlockchainLabsNZ/etheal-contracts/blob/master/contracts/EthealPreSale.sol#L420) ... [View on GitHub](https://github.com/BlockchainLabsNZ/etheal-contracts/issues/5)
  - [ ] Not Fixed
- **Expected ' { ' after for statement** - `Correctness`  [View on GitHub](https://github.com/BlockchainLabsNZ/etheal-contracts/issues/3)
![claimtoken](https://user-images.githubusercontent.com/17868193/32927640-9c4a9ef4-cbb2-11e7-81ad-268e311d3c99.png)
  - [x] Fixed [908389dd](https://github.com/thesved/etheal-sale/commit/908389dd18cf892aaff28c19536459dcc434571b)
- **'_balance' is declared but never used** - `Correctness` Line 181 declares '_balance' but it is an unused variable  This line can be removed as ` function getHealBalance()` achieves the same logic  [View on GitHub](https://github.com/BlockchainLabsNZ/etheal-contracts/issues/2)
  - [x] Fixed [66f0f65a](https://github.com/thesved/etheal-sale/commit/66f0f65a89a074700fb9f1e9287038f458ecb622)
- **Throw is deprecated, in favour of revert, require and assert** - `Best practice` [View on GitHub](https://github.com/BlockchainLabsNZ/etheal-contracts/issues/2)
  - [x] Fixed [cd00135b](https://github.com/thesved/etheal-sale/commit/cd00135b87c8f06983c9c58c0c2df0af6956ae99#diff-4aa8ec5bc761860576c21e98f6caf876)


### Moderate
- None found
### Major

### Critical
- None found

We have reviewed this document to ensure that there are no ommisions and that the developers' comments are a fair summary of each function.

## Test Results

[![Build Status](https://travis-ci.org/BlockchainLabsNZ/etheal-contracts.svg?branch=master)](https://travis-ci.org/BlockchainLabsNZ/etheal-contracts)

### Test Coverage

[![Coverage Status](https://coveralls.io/repos/github/BlockchainLabsNZ/etheal-contracts/badge.svg?branch=master)](https://coveralls.io/github/BlockchainLabsNZ/etheal-contracts?branch=master)

*The following contracts have 100% coverage:*
- TokenVesting.sol
- TokenController.sol
- EthealToken.sol
- ERC20MiniMe.sol
- ERC20.sol

*The following contracts are above 80% coverage:*
- Crowdsale.sol
  The `transferToken` function is missing a test but the overriden version is tested in `ethealNormalSale` and `ethealPreSale` contracts
- SafeMath.sol
  This contract is identical to the OpenZeppelin library so it is generally considered well tested
- Ownable.sol
  There is no test to make sure ownership cannot be transferred if the new owners address is 0x0
- EthealNormalSale.sol
  There is no test for `getContributors`, and there are some fail cases that are not tested
- EthealController.sol
  Some of the fail cases are not tested
- RefundVault.sol
  The fail cases are not tested

*The following contracts are above 60% coverage:*
- HasNoTokens.sol
  Extracting ether is not tested, only token retrieval
- Pausable.sol
  `unpause` is tested, but `pause` and it's associated modifiers are not tested
- Controlled.sol
  The `onlyController` modifier is not tested
- Hodler.sol
  Some fail cases are not tested, `setHodlerStake` function is not tested
- RefundableCrowdsale.sol
  The overriden version is tested in `ethealPreSale`, so this contract is fully tested
- EthealPreSale.sol
  Some fail cases are not tested, `getContributors` is not tested
- FinalizableCrowdsale.sol
  The fail case for `finalize` is not tested

*The remaining contracts have less than 60% coverage:*
- CappedCrowdsale.sol
  The `BuyTokens` function is tested in the overriden version in `ethealNormalSale.sol` and `ethealPreSale.sol`
- MiniMeToken.sol
  This is a copy of [giveth minime](https://github.com/Giveth/minime), so it can be considered tested
- Wallet.sol
  This is a copy of [consensys multisig](https://github.com/ConsenSys/MultiSigWallet/blob/master/MultiSigWalletWithDailyLimit.sol), so it can be considered tested

### Gas Consumption
Upon finalization of the contracts to be used by Etheal, the contracts were assessed on the gas usage of each function to ensure there aren't any unforeseen issues with exceeding the block size GasLimit. A detailed report can be found in [Gas_Consumption.md](https://github.com/BlockchainLabsNZ/etheal-contracts/blob/master/Gas_Consumption.md).

## Conclusion
Overall we have been fully satisfied with the resulting contracts following the audit feedback period. We took part in carefully reviewing all source code provided, including both static and dynamic testing methodology.

The developers have followed common best practices and demonstrated an awareness for attention to detail. We were pleased to see contracts in a modular format to avoid confusion and improve operability for all parties.
