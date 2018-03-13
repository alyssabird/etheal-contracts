pragma solidity ^0.4.17;

import './SafeMath.sol';
import './Ownable.sol';
import './HasNoTokens.sol';

/**
 * @title RefundVault
 * @dev This contract is used for storing funds while a crowdsale
 * is in progress. Supports refunding the money if crowdsale fails,
 * and forwarding it if crowdsale is successful.
 */
contract RefundVault is Ownable, HasNoTokens {event __CoverageRefundVault(string fileName, uint256 lineNumber);
event __FunctionCoverageRefundVault(string fileName, uint256 fnId);
event __StatementCoverageRefundVault(string fileName, uint256 statementId);
event __BranchCoverageRefundVault(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageRefundVault(string fileName, uint256 branchId);
event __AssertPostCoverageRefundVault(string fileName, uint256 branchId);

  using SafeMath for uint256;

  enum State { Active, Refunding, Closed }

  mapping (address => uint256) public deposited;
  address public wallet;
  State public state;

  event Closed();
  event RefundsEnabled();
  event Refunded(address indexed beneficiary, uint256 weiAmount);

  function RefundVault(address _wallet) {__FunctionCoverageRefundVault('/Users/tikonoff/projects/etheal-contracts/contracts/RefundVault.sol',1);

__CoverageRefundVault('/Users/tikonoff/projects/etheal-contracts/contracts/RefundVault.sol',27);
    __AssertPreCoverageRefundVault('/Users/tikonoff/projects/etheal-contracts/contracts/RefundVault.sol',1);
 __StatementCoverageRefundVault('/Users/tikonoff/projects/etheal-contracts/contracts/RefundVault.sol',1);
require(_wallet != 0x0);__AssertPostCoverageRefundVault('/Users/tikonoff/projects/etheal-contracts/contracts/RefundVault.sol',1);

__CoverageRefundVault('/Users/tikonoff/projects/etheal-contracts/contracts/RefundVault.sol',28);
     __StatementCoverageRefundVault('/Users/tikonoff/projects/etheal-contracts/contracts/RefundVault.sol',2);
wallet = _wallet;
__CoverageRefundVault('/Users/tikonoff/projects/etheal-contracts/contracts/RefundVault.sol',29);
     __StatementCoverageRefundVault('/Users/tikonoff/projects/etheal-contracts/contracts/RefundVault.sol',3);
state = State.Active;
  }

  function deposit(address investor) onlyOwner public payable {__FunctionCoverageRefundVault('/Users/tikonoff/projects/etheal-contracts/contracts/RefundVault.sol',2);

__CoverageRefundVault('/Users/tikonoff/projects/etheal-contracts/contracts/RefundVault.sol',33);
    __AssertPreCoverageRefundVault('/Users/tikonoff/projects/etheal-contracts/contracts/RefundVault.sol',2);
 __StatementCoverageRefundVault('/Users/tikonoff/projects/etheal-contracts/contracts/RefundVault.sol',4);
require(state == State.Active);__AssertPostCoverageRefundVault('/Users/tikonoff/projects/etheal-contracts/contracts/RefundVault.sol',2);

__CoverageRefundVault('/Users/tikonoff/projects/etheal-contracts/contracts/RefundVault.sol',34);
     __StatementCoverageRefundVault('/Users/tikonoff/projects/etheal-contracts/contracts/RefundVault.sol',5);
deposited[investor] = deposited[investor].add(msg.value);
  }

  function close() onlyOwner public {__FunctionCoverageRefundVault('/Users/tikonoff/projects/etheal-contracts/contracts/RefundVault.sol',3);

__CoverageRefundVault('/Users/tikonoff/projects/etheal-contracts/contracts/RefundVault.sol',38);
    __AssertPreCoverageRefundVault('/Users/tikonoff/projects/etheal-contracts/contracts/RefundVault.sol',3);
 __StatementCoverageRefundVault('/Users/tikonoff/projects/etheal-contracts/contracts/RefundVault.sol',6);
require(state == State.Active);__AssertPostCoverageRefundVault('/Users/tikonoff/projects/etheal-contracts/contracts/RefundVault.sol',3);

__CoverageRefundVault('/Users/tikonoff/projects/etheal-contracts/contracts/RefundVault.sol',39);
     __StatementCoverageRefundVault('/Users/tikonoff/projects/etheal-contracts/contracts/RefundVault.sol',7);
state = State.Closed;
__CoverageRefundVault('/Users/tikonoff/projects/etheal-contracts/contracts/RefundVault.sol',40);
     __StatementCoverageRefundVault('/Users/tikonoff/projects/etheal-contracts/contracts/RefundVault.sol',8);
Closed();
__CoverageRefundVault('/Users/tikonoff/projects/etheal-contracts/contracts/RefundVault.sol',41);
    wallet.transfer(this.balance);
  }

  function enableRefunds() onlyOwner public {__FunctionCoverageRefundVault('/Users/tikonoff/projects/etheal-contracts/contracts/RefundVault.sol',4);

__CoverageRefundVault('/Users/tikonoff/projects/etheal-contracts/contracts/RefundVault.sol',45);
    __AssertPreCoverageRefundVault('/Users/tikonoff/projects/etheal-contracts/contracts/RefundVault.sol',4);
 __StatementCoverageRefundVault('/Users/tikonoff/projects/etheal-contracts/contracts/RefundVault.sol',9);
require(state == State.Active);__AssertPostCoverageRefundVault('/Users/tikonoff/projects/etheal-contracts/contracts/RefundVault.sol',4);

__CoverageRefundVault('/Users/tikonoff/projects/etheal-contracts/contracts/RefundVault.sol',46);
     __StatementCoverageRefundVault('/Users/tikonoff/projects/etheal-contracts/contracts/RefundVault.sol',10);
state = State.Refunding;
__CoverageRefundVault('/Users/tikonoff/projects/etheal-contracts/contracts/RefundVault.sol',47);
     __StatementCoverageRefundVault('/Users/tikonoff/projects/etheal-contracts/contracts/RefundVault.sol',11);
RefundsEnabled();
  }

  function refund(address investor) public {__FunctionCoverageRefundVault('/Users/tikonoff/projects/etheal-contracts/contracts/RefundVault.sol',5);

__CoverageRefundVault('/Users/tikonoff/projects/etheal-contracts/contracts/RefundVault.sol',51);
    __AssertPreCoverageRefundVault('/Users/tikonoff/projects/etheal-contracts/contracts/RefundVault.sol',5);
 __StatementCoverageRefundVault('/Users/tikonoff/projects/etheal-contracts/contracts/RefundVault.sol',12);
require(state == State.Refunding);__AssertPostCoverageRefundVault('/Users/tikonoff/projects/etheal-contracts/contracts/RefundVault.sol',5);

__CoverageRefundVault('/Users/tikonoff/projects/etheal-contracts/contracts/RefundVault.sol',52);
     __StatementCoverageRefundVault('/Users/tikonoff/projects/etheal-contracts/contracts/RefundVault.sol',13);
uint256 depositedValue = deposited[investor];
__CoverageRefundVault('/Users/tikonoff/projects/etheal-contracts/contracts/RefundVault.sol',53);
     __StatementCoverageRefundVault('/Users/tikonoff/projects/etheal-contracts/contracts/RefundVault.sol',14);
deposited[investor] = 0;
__CoverageRefundVault('/Users/tikonoff/projects/etheal-contracts/contracts/RefundVault.sol',54);
    investor.transfer(depositedValue);
__CoverageRefundVault('/Users/tikonoff/projects/etheal-contracts/contracts/RefundVault.sol',55);
     __StatementCoverageRefundVault('/Users/tikonoff/projects/etheal-contracts/contracts/RefundVault.sol',15);
Refunded(investor, depositedValue);
  }
}