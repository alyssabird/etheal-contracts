pragma solidity ^0.4.17;

import './ERC20MiniMe.sol';
import './SafeMath.sol';

/**
 * @title Crowdsale
 * @dev Crowdsale is a base contract for managing a token crowdsale.
 * Crowdsales have a start and end timestamps, where investors can make
 * token purchases and the crowdsale will assign them tokens based
 * on a token per ETH rate. Funds collected are forwarded to a wallet
 * as they arrive.
 */
contract Crowdsale {event __CoverageCrowdsale(string fileName, uint256 lineNumber);
event __FunctionCoverageCrowdsale(string fileName, uint256 fnId);
event __StatementCoverageCrowdsale(string fileName, uint256 statementId);
event __BranchCoverageCrowdsale(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageCrowdsale(string fileName, uint256 branchId);
event __AssertPostCoverageCrowdsale(string fileName, uint256 branchId);

  using SafeMath for uint256;

  // The token being sold
  ERC20MiniMe public token;

  // start and end timestamps where investments are allowed (both inclusive)
  uint256 public startTime;
  uint256 public endTime;

  // address where funds are collected
  address public wallet;

  // how many token units a buyer gets per wei
  uint256 public rate;

  // amount of raised money in wei
  uint256 public weiRaised;

  /**
   * event for token purchase logging
   * @param purchaser who paid for the tokens
   * @param beneficiary who got the tokens
   * @param value weis paid for purchase
   * @param amount amount of tokens purchased
   */
  event TokenPurchase(address indexed purchaser, address indexed beneficiary, uint256 value, uint256 amount);


  function Crowdsale(uint256 _startTime, uint256 _endTime, uint256 _rate, address _wallet) {__FunctionCoverageCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/Crowdsale.sol',1);

__CoverageCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/Crowdsale.sol',44);
    __AssertPreCoverageCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/Crowdsale.sol',1);
 __StatementCoverageCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/Crowdsale.sol',1);
require(_startTime >= now);__AssertPostCoverageCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/Crowdsale.sol',1);

__CoverageCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/Crowdsale.sol',45);
    __AssertPreCoverageCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/Crowdsale.sol',2);
 __StatementCoverageCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/Crowdsale.sol',2);
require(_endTime >= _startTime);__AssertPostCoverageCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/Crowdsale.sol',2);

__CoverageCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/Crowdsale.sol',46);
    __AssertPreCoverageCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/Crowdsale.sol',3);
 __StatementCoverageCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/Crowdsale.sol',3);
require(_rate > 0);__AssertPostCoverageCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/Crowdsale.sol',3);

__CoverageCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/Crowdsale.sol',47);
    __AssertPreCoverageCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/Crowdsale.sol',4);
 __StatementCoverageCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/Crowdsale.sol',4);
require(_wallet != 0x0);__AssertPostCoverageCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/Crowdsale.sol',4);


__CoverageCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/Crowdsale.sol',49);
     __StatementCoverageCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/Crowdsale.sol',5);
startTime = _startTime;
__CoverageCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/Crowdsale.sol',50);
     __StatementCoverageCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/Crowdsale.sol',6);
endTime = _endTime;
__CoverageCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/Crowdsale.sol',51);
     __StatementCoverageCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/Crowdsale.sol',7);
rate = _rate;
__CoverageCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/Crowdsale.sol',52);
     __StatementCoverageCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/Crowdsale.sol',8);
wallet = _wallet;
  }


  // fallback function can be used to buy tokens
  function () payable {__FunctionCoverageCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/Crowdsale.sol',2);

__CoverageCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/Crowdsale.sol',58);
     __StatementCoverageCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/Crowdsale.sol',9);
buyTokens(msg.sender);
  }

  // low level token purchase function
  function buyTokens(address beneficiary) public payable {__FunctionCoverageCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/Crowdsale.sol',3);

__CoverageCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/Crowdsale.sol',63);
     __StatementCoverageCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/Crowdsale.sol',10);
buyTokens(beneficiary, msg.value);
  }

  // implementation of low level token purchase function
  function buyTokens(address beneficiary, uint256 weiAmount) internal {__FunctionCoverageCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/Crowdsale.sol',4);

__CoverageCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/Crowdsale.sol',68);
    __AssertPreCoverageCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/Crowdsale.sol',5);
 __StatementCoverageCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/Crowdsale.sol',11);
require(beneficiary != 0x0);__AssertPostCoverageCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/Crowdsale.sol',5);

__CoverageCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/Crowdsale.sol',69);
    __AssertPreCoverageCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/Crowdsale.sol',6);
 __StatementCoverageCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/Crowdsale.sol',12);
require(validPurchase(weiAmount));__AssertPostCoverageCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/Crowdsale.sol',6);


__CoverageCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/Crowdsale.sol',71);
     __StatementCoverageCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/Crowdsale.sol',13);
transferToken(beneficiary, weiAmount);

    // update state
__CoverageCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/Crowdsale.sol',74);
     __StatementCoverageCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/Crowdsale.sol',14);
weiRaised = weiRaised.add(weiAmount);

__CoverageCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/Crowdsale.sol',76);
     __StatementCoverageCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/Crowdsale.sol',15);
forwardFunds(weiAmount);
  }

  // low level transfer token
  // override to create custom token transfer mechanism, eg. pull pattern
  function transferToken(address beneficiary, uint256 weiAmount) internal {__FunctionCoverageCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/Crowdsale.sol',5);

    // calculate token amount to be created
__CoverageCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/Crowdsale.sol',83);
     __StatementCoverageCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/Crowdsale.sol',16);
uint256 tokens = weiAmount.mul(rate);

__CoverageCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/Crowdsale.sol',85);
    token.generateTokens(beneficiary, tokens);

__CoverageCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/Crowdsale.sol',87);
     __StatementCoverageCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/Crowdsale.sol',17);
TokenPurchase(msg.sender, beneficiary, weiAmount, tokens);
  }

  // send ether to the fund collection wallet
  // override to create custom fund forwarding mechanisms
  function forwardFunds(uint256 weiAmount) internal {__FunctionCoverageCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/Crowdsale.sol',6);

__CoverageCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/Crowdsale.sol',93);
    wallet.transfer(weiAmount);
  }

  // @return true if the transaction can buy tokens
  function validPurchase(uint256 weiAmount) internal  returns (bool) {__FunctionCoverageCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/Crowdsale.sol',7);

__CoverageCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/Crowdsale.sol',98);
     __StatementCoverageCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/Crowdsale.sol',18);
bool withinPeriod = now >= startTime && now <= endTime;
__CoverageCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/Crowdsale.sol',99);
     __StatementCoverageCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/Crowdsale.sol',19);
bool nonZeroPurchase = weiAmount != 0;
__CoverageCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/Crowdsale.sol',100);
     __StatementCoverageCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/Crowdsale.sol',20);
return withinPeriod && nonZeroPurchase;
  }

  // @return true if crowdsale event has ended
  function hasEnded() public  returns (bool) {__FunctionCoverageCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/Crowdsale.sol',8);

__CoverageCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/Crowdsale.sol',105);
     __StatementCoverageCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/Crowdsale.sol',21);
return now > endTime;
  }

  // @return true if crowdsale has started
  function hasStarted() public  returns (bool) {__FunctionCoverageCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/Crowdsale.sol',9);

__CoverageCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/Crowdsale.sol',110);
     __StatementCoverageCrowdsale('/Users/tikonoff/projects/etheal-contracts/contracts/Crowdsale.sol',22);
return now >= startTime;
  }
}