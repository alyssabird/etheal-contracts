pragma solidity ^0.4.17;

import './SafeMath.sol';
import './Ownable.sol';
import './Crowdsale.sol';

/**
 * @title FinalizableCrowdsale
 * @dev Extension of Crowdsale where an owner can do extra work
 * after finishing.
 */
contract FinalizableCrowdsale is Crowdsale, Ownable {event __CoverageFinalizableCrowdsale(string fileName, uint256 lineNumber);
event __FunctionCoverageFinalizableCrowdsale(string fileName, uint256 fnId);
event __StatementCoverageFinalizableCrowdsale(string fileName, uint256 statementId);
event __BranchCoverageFinalizableCrowdsale(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageFinalizableCrowdsale(string fileName, uint256 branchId);
event __AssertPostCoverageFinalizableCrowdsale(string fileName, uint256 branchId);

  using SafeMath for uint256;

  bool public isFinalized = false;

  event Finalized();

  /**
   * @dev Must be called after crowdsale ends, to do some extra finalization
   * work. Calls the contract's finalization function.
   */
  function finalize() onlyOwner public {__FunctionCoverageFinalizableCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/FinalizableCrowdsale.sol',1);

__CoverageFinalizableCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/FinalizableCrowdsale.sol',24);
    __AssertPreCoverageFinalizableCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/FinalizableCrowdsale.sol',1);
 __StatementCoverageFinalizableCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/FinalizableCrowdsale.sol',1);
require(!isFinalized);__AssertPostCoverageFinalizableCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/FinalizableCrowdsale.sol',1);

__CoverageFinalizableCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/FinalizableCrowdsale.sol',25);
    __AssertPreCoverageFinalizableCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/FinalizableCrowdsale.sol',2);
 __StatementCoverageFinalizableCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/FinalizableCrowdsale.sol',2);
require(hasEnded());__AssertPostCoverageFinalizableCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/FinalizableCrowdsale.sol',2);


__CoverageFinalizableCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/FinalizableCrowdsale.sol',27);
     __StatementCoverageFinalizableCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/FinalizableCrowdsale.sol',3);
finalization();
__CoverageFinalizableCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/FinalizableCrowdsale.sol',28);
     __StatementCoverageFinalizableCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/FinalizableCrowdsale.sol',4);
Finalized();

__CoverageFinalizableCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/FinalizableCrowdsale.sol',30);
     __StatementCoverageFinalizableCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/FinalizableCrowdsale.sol',5);
isFinalized = true;
  }

  /**
   * @dev Can be overridden to add finalization logic. The overriding function
   * should call super.finalization() to ensure the chain of finalization is
   * executed entirely.
   */
  function finalization() internal {__FunctionCoverageFinalizableCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/FinalizableCrowdsale.sol',2);

  }
}