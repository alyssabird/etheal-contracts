pragma solidity ^0.4.17;

import './SafeMath.sol';
import './Crowdsale.sol';

/**
 * @title CappedCrowdsale
 * @dev Extension of Crowdsale with a max amount of funds raised
 */
contract CappedCrowdsale is Crowdsale {event __CoverageCappedCrowdsale(string fileName, uint256 lineNumber);
event __FunctionCoverageCappedCrowdsale(string fileName, uint256 fnId);
event __StatementCoverageCappedCrowdsale(string fileName, uint256 statementId);
event __BranchCoverageCappedCrowdsale(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageCappedCrowdsale(string fileName, uint256 branchId);
event __AssertPostCoverageCappedCrowdsale(string fileName, uint256 branchId);

  using SafeMath for uint256;

  uint256 public cap;

  function CappedCrowdsale(uint256 _cap) {__FunctionCoverageCappedCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/CappedCrowdsale.sol',1);

__CoverageCappedCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/CappedCrowdsale.sol',16);
    __AssertPreCoverageCappedCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/CappedCrowdsale.sol',1);
 __StatementCoverageCappedCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/CappedCrowdsale.sol',1);
require(_cap > 0);__AssertPostCoverageCappedCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/CappedCrowdsale.sol',1);

__CoverageCappedCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/CappedCrowdsale.sol',17);
     __StatementCoverageCappedCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/CappedCrowdsale.sol',2);
cap = _cap;
  }

  // overriding Crowdsale#validPurchase to add extra cap logic
  // @return true if investors can buy at the moment
  function validPurchase(uint256 weiAmount) internal  returns (bool) {__FunctionCoverageCappedCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/CappedCrowdsale.sol',2);

__CoverageCappedCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/CappedCrowdsale.sol',23);
     __StatementCoverageCappedCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/CappedCrowdsale.sol',3);
return super.validPurchase(weiAmount) && !capReached();
  }

  // overriding Crowdsale#hasEnded to add cap logic
  // @return true if crowdsale event has ended
  function hasEnded() public  returns (bool) {__FunctionCoverageCappedCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/CappedCrowdsale.sol',3);

__CoverageCappedCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/CappedCrowdsale.sol',29);
     __StatementCoverageCappedCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/CappedCrowdsale.sol',4);
return super.hasEnded() || capReached();
  }

  // @return true if cap has been reached
  function capReached() internal  returns (bool) {__FunctionCoverageCappedCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/CappedCrowdsale.sol',4);

__CoverageCappedCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/CappedCrowdsale.sol',34);
    __StatementCoverageCappedCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/CappedCrowdsale.sol',5);
return weiRaised >= cap;
  }

  // overriding Crowdsale#buyTokens to add partial refund logic
  function buyTokens(address beneficiary) public payable {__FunctionCoverageCappedCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/CappedCrowdsale.sol',5);

__CoverageCappedCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/CappedCrowdsale.sol',39);
      __StatementCoverageCappedCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/CappedCrowdsale.sol',6);
uint256 weiToCap = cap.sub(weiRaised);
__CoverageCappedCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/CappedCrowdsale.sol',40);
      __StatementCoverageCappedCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/CappedCrowdsale.sol',7);
uint256 weiAmount; (,weiAmount) = weiToCap < msg.value ? (__BranchCoverageCappedCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/CappedCrowdsale.sol',2,0),weiToCap) : (__BranchCoverageCappedCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/CappedCrowdsale.sol',2,1),msg.value);

__CoverageCappedCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/CappedCrowdsale.sol',42);
      __StatementCoverageCappedCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/CappedCrowdsale.sol',8);
buyTokens(beneficiary, weiAmount);

__CoverageCappedCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/CappedCrowdsale.sol',44);
      __StatementCoverageCappedCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/CappedCrowdsale.sol',9);
uint256 refund = msg.value.sub(weiAmount);
__CoverageCappedCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/CappedCrowdsale.sol',45);
      __StatementCoverageCappedCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/CappedCrowdsale.sol',10);
if (refund > 0) {__BranchCoverageCappedCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/CappedCrowdsale.sol',3,0);
__CoverageCappedCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/CappedCrowdsale.sol',46);
       msg.sender.transfer(refund);
     }else { __BranchCoverageCappedCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/CappedCrowdsale.sol',3,1);}

   }
}