pragma solidity ^0.4.17;


import './SafeMath.sol';
import './FinalizableCrowdsale.sol';
import './RefundVault.sol';


/**
 * @title RefundableCrowdsale
 * @dev Extension of Crowdsale contract that adds a funding goal, and
 * the possibility of users getting a refund if goal is not met.
 * Uses a RefundVault as the crowdsale's vault.
 */
contract RefundableCrowdsale is FinalizableCrowdsale {event __CoverageRefundableCrowdsale(string fileName, uint256 lineNumber);
event __FunctionCoverageRefundableCrowdsale(string fileName, uint256 fnId);
event __StatementCoverageRefundableCrowdsale(string fileName, uint256 statementId);
event __BranchCoverageRefundableCrowdsale(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageRefundableCrowdsale(string fileName, uint256 branchId);
event __AssertPostCoverageRefundableCrowdsale(string fileName, uint256 branchId);

  using SafeMath for uint256;

  // minimum amount of funds to be raised in weis
  uint256 public goal;

  // refund vault used to hold funds while crowdsale is running
  RefundVault public vault;

  function RefundableCrowdsale(uint256 _goal) {__FunctionCoverageRefundableCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/RefundableCrowdsale.sol',1);

__CoverageRefundableCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/RefundableCrowdsale.sol',25);
    __AssertPreCoverageRefundableCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/RefundableCrowdsale.sol',1);
 __StatementCoverageRefundableCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/RefundableCrowdsale.sol',1);
require(_goal > 0);__AssertPostCoverageRefundableCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/RefundableCrowdsale.sol',1);

__CoverageRefundableCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/RefundableCrowdsale.sol',26);
     __StatementCoverageRefundableCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/RefundableCrowdsale.sol',2);
vault = new RefundVault(wallet);
__CoverageRefundableCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/RefundableCrowdsale.sol',27);
     __StatementCoverageRefundableCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/RefundableCrowdsale.sol',3);
goal = _goal;
  }

  // We're overriding the fund forwarding from Crowdsale.
  // If the goal is reached forward the fund to the wallet, 
  // otherwise in addition to sending the funds, we want to
  // call the RefundVault deposit function
  function forwardFunds(uint256 weiAmount) internal {__FunctionCoverageRefundableCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/RefundableCrowdsale.sol',2);

__CoverageRefundableCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/RefundableCrowdsale.sol',35);
     __StatementCoverageRefundableCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/RefundableCrowdsale.sol',4);
if (goalReached())
      {__BranchCoverageRefundableCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/RefundableCrowdsale.sol',2,0);__CoverageRefundableCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/RefundableCrowdsale.sol',36);
wallet.transfer(weiAmount);}
    else
      {__BranchCoverageRefundableCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/RefundableCrowdsale.sol',2,1);__CoverageRefundableCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/RefundableCrowdsale.sol',38);
vault.deposit.value(weiAmount)(msg.sender);}
  }

  // if crowdsale is unsuccessful, investors can claim refunds here
  function claimRefund() public {__FunctionCoverageRefundableCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/RefundableCrowdsale.sol',3);

__CoverageRefundableCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/RefundableCrowdsale.sol',43);
    __AssertPreCoverageRefundableCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/RefundableCrowdsale.sol',3);
 __StatementCoverageRefundableCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/RefundableCrowdsale.sol',5);
require(isFinalized);__AssertPostCoverageRefundableCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/RefundableCrowdsale.sol',3);

__CoverageRefundableCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/RefundableCrowdsale.sol',44);
    __AssertPreCoverageRefundableCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/RefundableCrowdsale.sol',4);
 __StatementCoverageRefundableCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/RefundableCrowdsale.sol',6);
require(!goalReached());__AssertPostCoverageRefundableCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/RefundableCrowdsale.sol',4);


__CoverageRefundableCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/RefundableCrowdsale.sol',46);
    vault.refund(msg.sender);
  }

  // vault finalization task, called when owner calls finalize()
  function finalization() internal {__FunctionCoverageRefundableCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/RefundableCrowdsale.sol',4);

__CoverageRefundableCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/RefundableCrowdsale.sol',51);
     __StatementCoverageRefundableCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/RefundableCrowdsale.sol',7);
if (goalReached()) {__BranchCoverageRefundableCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/RefundableCrowdsale.sol',5,0);
__CoverageRefundableCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/RefundableCrowdsale.sol',52);
      vault.close();
    } else {__BranchCoverageRefundableCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/RefundableCrowdsale.sol',5,1);
__CoverageRefundableCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/RefundableCrowdsale.sol',54);
      vault.enableRefunds();
    }

__CoverageRefundableCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/RefundableCrowdsale.sol',57);
    super.finalization();
  }

  function goalReached() public  returns (bool) {__FunctionCoverageRefundableCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/RefundableCrowdsale.sol',5);

__CoverageRefundableCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/RefundableCrowdsale.sol',61);
     __StatementCoverageRefundableCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/RefundableCrowdsale.sol',8);
return weiRaised >= goal;
  }

}