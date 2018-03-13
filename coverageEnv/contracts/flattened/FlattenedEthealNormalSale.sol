pragma solidity ^0.4.18;

// File: contracts/Controlled.sol

contract Controlled {event __CoverageControlled(string fileName, uint256 lineNumber);
event __FunctionCoverageControlled(string fileName, uint256 fnId);
event __StatementCoverageControlled(string fileName, uint256 statementId);
event __BranchCoverageControlled(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageControlled(string fileName, uint256 branchId);
event __AssertPostCoverageControlled(string fileName, uint256 branchId);

    /// @notice The address of the controller is the only address that can call
    ///  a function with this modifier
    modifier onlyController {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',1);
 __AssertPreCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',1);
 __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',1);
require(msg.sender == controller);__AssertPostCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',1);
 _; }

    address public controller;

    function Controlled() public {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',2);
  __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',2);
controller = msg.sender;}

    /// @notice Changes the controller of the contract
    /// @param _newController The new controller of the contract
    function changeController(address _newController) public onlyController {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',3);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',17);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',3);
controller = _newController;
    }
}

// File: contracts/ERC20.sol

/**
 * @title ERC20
 * @dev ERC20 interface
 */
contract ERC20 {event __CoverageControlled(string fileName, uint256 lineNumber);
event __FunctionCoverageControlled(string fileName, uint256 fnId);
event __StatementCoverageControlled(string fileName, uint256 statementId);
event __BranchCoverageControlled(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageControlled(string fileName, uint256 branchId);
event __AssertPostCoverageControlled(string fileName, uint256 branchId);

    function balanceOf(address who) public  returns (uint256);
    function transfer(address to, uint256 value) public returns (bool);
    function allowance(address owner, address spender) public  returns (uint256);
    function transferFrom(address from, address to, uint256 value) public returns (bool);
    function approve(address spender, uint256 value) public returns (bool);
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

// File: contracts/ERC20MiniMe.sol

/**
 * @title MiniMe interface
 * @dev see https://github.com/ethereum/EIPs/issues/20
 */
contract ERC20MiniMe is ERC20, Controlled {event __CoverageControlled(string fileName, uint256 lineNumber);
event __FunctionCoverageControlled(string fileName, uint256 fnId);
event __StatementCoverageControlled(string fileName, uint256 statementId);
event __BranchCoverageControlled(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageControlled(string fileName, uint256 branchId);
event __AssertPostCoverageControlled(string fileName, uint256 branchId);

    function approveAndCall(address _spender, uint256 _amount, bytes _extraData) public returns (bool);
    function totalSupply() public  returns (uint);
    function balanceOfAt(address _owner, uint _blockNumber) public  returns (uint);
    function totalSupplyAt(uint _blockNumber) public  returns(uint);
    function createCloneToken(string _cloneTokenName, uint8 _cloneDecimalUnits, string _cloneTokenSymbol, uint _snapshotBlock, bool _transfersEnabled) public returns(address);
    function generateTokens(address _owner, uint _amount) public returns (bool);
    function destroyTokens(address _owner, uint _amount)  public returns (bool);
    function enableTransfers(bool _transfersEnabled) public;
    function isContract(address _addr)  internal returns(bool);
    function claimTokens(address _token) public;
    event ClaimedTokens(address indexed _token, address indexed _controller, uint _amount);
    event NewCloneToken(address indexed _cloneToken, uint _snapshotBlock);
}

// File: contracts/SafeMath.sol

/**
 * @title SafeMath
 * @dev Math operations with safety checks that throw on error
 */
library SafeMath {event __CoverageControlled(string fileName, uint256 lineNumber);
event __FunctionCoverageControlled(string fileName, uint256 fnId);
event __StatementCoverageControlled(string fileName, uint256 statementId);
event __BranchCoverageControlled(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageControlled(string fileName, uint256 branchId);
event __AssertPostCoverageControlled(string fileName, uint256 branchId);

  function mul(uint256 a, uint256 b) internal  returns (uint256) {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',4);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',66);
     __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',4);
uint256 c = a * b;
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',67);
    __AssertPreCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',2);
 __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',5);
assert(a == 0 || c / a == b);__AssertPostCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',2);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',68);
     __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',6);
return c;
  }

  function div(uint256 a, uint256 b) internal  returns (uint256) {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',5);

    // assert(b > 0); // Solidity automatically throws when dividing by 0
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',73);
     __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',7);
uint256 c = a / b;
    // assert(a == b * c + a % b); // There is no case in which this doesn't hold
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',75);
     __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',8);
return c;
  }

  function sub(uint256 a, uint256 b) internal  returns (uint256) {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',6);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',79);
    __AssertPreCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',3);
 __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',9);
assert(b <= a);__AssertPostCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',3);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',80);
     __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',10);
return a - b;
  }

  function add(uint256 a, uint256 b) internal  returns (uint256) {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',7);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',84);
     __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',11);
uint256 c = a + b;
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',85);
    __AssertPreCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',4);
 __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',12);
assert(c >= a);__AssertPostCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',4);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',86);
     __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',13);
return c;
  }
}

// File: contracts/Crowdsale.sol

/**
 * @title Crowdsale
 * @dev Crowdsale is a base contract for managing a token crowdsale.
 * Crowdsales have a start and end timestamps, where investors can make
 * token purchases and the crowdsale will assign them tokens based
 * on a token per ETH rate. Funds collected are forwarded to a wallet
 * as they arrive.
 */
contract Crowdsale {event __CoverageControlled(string fileName, uint256 lineNumber);
event __FunctionCoverageControlled(string fileName, uint256 fnId);
event __StatementCoverageControlled(string fileName, uint256 statementId);
event __BranchCoverageControlled(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageControlled(string fileName, uint256 branchId);
event __AssertPostCoverageControlled(string fileName, uint256 branchId);

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


  function Crowdsale(uint256 _startTime, uint256 _endTime, uint256 _rate, address _wallet) {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',8);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',130);
    __AssertPreCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',5);
 __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',14);
require(_startTime >= now);__AssertPostCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',5);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',131);
    __AssertPreCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',6);
 __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',15);
require(_endTime >= _startTime);__AssertPostCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',6);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',132);
    __AssertPreCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',7);
 __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',16);
require(_rate > 0);__AssertPostCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',7);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',133);
    __AssertPreCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',8);
 __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',17);
require(_wallet != 0x0);__AssertPostCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',8);


__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',135);
     __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',18);
startTime = _startTime;
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',136);
     __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',19);
endTime = _endTime;
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',137);
     __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',20);
rate = _rate;
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',138);
     __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',21);
wallet = _wallet;
  }


  // fallback function can be used to buy tokens
  function () payable {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',9);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',144);
     __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',22);
buyTokens(msg.sender);
  }

  // low level token purchase function
  function buyTokens(address beneficiary) public payable {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',10);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',149);
     __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',23);
buyTokens(beneficiary, msg.value);
  }

  // implementation of low level token purchase function
  function buyTokens(address beneficiary, uint256 weiAmount) internal {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',11);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',154);
    __AssertPreCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',9);
 __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',24);
require(beneficiary != 0x0);__AssertPostCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',9);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',155);
    __AssertPreCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',10);
 __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',25);
require(validPurchase(weiAmount));__AssertPostCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',10);


__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',157);
     __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',26);
transferToken(beneficiary, weiAmount);

    // update state
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',160);
     __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',27);
weiRaised = weiRaised.add(weiAmount);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',162);
     __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',28);
forwardFunds(weiAmount);
  }

  // low level transfer token
  // override to create custom token transfer mechanism, eg. pull pattern
  function transferToken(address beneficiary, uint256 weiAmount) internal {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',12);

    // calculate token amount to be created
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',169);
     __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',29);
uint256 tokens = weiAmount.mul(rate);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',171);
    token.generateTokens(beneficiary, tokens);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',173);
     __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',30);
TokenPurchase(msg.sender, beneficiary, weiAmount, tokens);
  }

  // send ether to the fund collection wallet
  // override to create custom fund forwarding mechanisms
  function forwardFunds(uint256 weiAmount) internal {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',13);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',179);
    wallet.transfer(weiAmount);
  }

  // @return true if the transaction can buy tokens
  function validPurchase(uint256 weiAmount) internal  returns (bool) {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',14);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',184);
     __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',31);
bool withinPeriod = now >= startTime && now <= endTime;
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',185);
     __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',32);
bool nonZeroPurchase = weiAmount != 0;
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',186);
     __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',33);
return withinPeriod && nonZeroPurchase;
  }

  // @return true if crowdsale event has ended
  function hasEnded() public  returns (bool) {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',15);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',191);
     __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',34);
return now > endTime;
  }

  // @return true if crowdsale has started
  function hasStarted() public  returns (bool) {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',16);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',196);
     __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',35);
return now >= startTime;
  }
}

// File: contracts/CappedCrowdsale.sol

/**
 * @title CappedCrowdsale
 * @dev Extension of Crowdsale with a max amount of funds raised
 */
contract CappedCrowdsale is Crowdsale {event __CoverageControlled(string fileName, uint256 lineNumber);
event __FunctionCoverageControlled(string fileName, uint256 fnId);
event __StatementCoverageControlled(string fileName, uint256 statementId);
event __BranchCoverageControlled(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageControlled(string fileName, uint256 branchId);
event __AssertPostCoverageControlled(string fileName, uint256 branchId);

  using SafeMath for uint256;

  uint256 public cap;

  function CappedCrowdsale(uint256 _cap) {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',17);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',212);
    __AssertPreCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',11);
 __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',36);
require(_cap > 0);__AssertPostCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',11);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',213);
     __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',37);
cap = _cap;
  }

  // overriding Crowdsale#validPurchase to add extra cap logic
  // @return true if investors can buy at the moment
  function validPurchase(uint256 weiAmount) internal  returns (bool) {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',18);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',219);
     __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',38);
return super.validPurchase(weiAmount) && !capReached();
  }

  // overriding Crowdsale#hasEnded to add cap logic
  // @return true if crowdsale event has ended
  function hasEnded() public  returns (bool) {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',19);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',225);
     __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',39);
return super.hasEnded() || capReached();
  }

  // @return true if cap has been reached
  function capReached() internal  returns (bool) {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',20);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',230);
    __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',40);
return weiRaised >= cap;
  }

  // overriding Crowdsale#buyTokens to add partial refund logic
  function buyTokens(address beneficiary) public payable {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',21);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',235);
      __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',41);
uint256 weiToCap = cap.sub(weiRaised);
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',236);
      __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',42);
uint256 weiAmount; (,weiAmount) = weiToCap < msg.value ? (__BranchCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',12,0),weiToCap) : (__BranchCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',12,1),msg.value);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',238);
      __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',43);
buyTokens(beneficiary, weiAmount);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',240);
      __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',44);
uint256 refund = msg.value.sub(weiAmount);
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',241);
      __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',45);
if (refund > 0) {__BranchCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',13,0);
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',242);
       msg.sender.transfer(refund);
     }else { __BranchCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',13,1);}

   }
}

// File: contracts/ECRecovery.sol

/**
 * @title Eliptic curve signature operations
 *
 * @dev Based on https://gist.github.com/axic/5b33912c6f61ae6fd96d6c4a47afde6d
 */

library ECRecovery {event __CoverageControlled(string fileName, uint256 lineNumber);
event __FunctionCoverageControlled(string fileName, uint256 fnId);
event __StatementCoverageControlled(string fileName, uint256 statementId);
event __BranchCoverageControlled(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageControlled(string fileName, uint256 branchId);
event __AssertPostCoverageControlled(string fileName, uint256 branchId);


  /**
   * @dev Recover signer address from a message by using his signature
   * @param hash bytes32 message, the hash is the signed message. What is recovered is the signer address.
   * @param sig bytes signature, the signature is generated using web3.eth.sign()
   */
  function recover(bytes32 hash, bytes sig) public  returns (address) {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',22);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',263);
    bytes32 r;
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',264);
    bytes32 s;
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',265);
    uint8 v;

    //Check the signature length
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',268);
     __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',46);
if (sig.length != 65) {__BranchCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',14,0);
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',269);
       __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',47);
return (address(0));
    }else { __BranchCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',14,1);}


    // Divide the signature in r, s and v variables
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',273);
    assembly {
      r := mload(add(sig, 32))
      s := mload(add(sig, 64))
      v := byte(0, mload(add(sig, 96)))
    }

    // Version of signature should be 27 or 28, but 0 and 1 are also possible versions
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',280);
     __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',48);
if (v < 27) {__BranchCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',15,0);
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',281);
       __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',49);
v += 27;
    }else { __BranchCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',15,1);}


    // If the version is correct return the signer address
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',285);
     __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',50);
if (v != 27 && v != 28) {__BranchCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',16,0);
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',286);
       __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',51);
return (address(0));
    } else {__BranchCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',16,1);
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',288);
       __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',52);
return ecrecover(hash, v, r, s);
    }
  }

}

// File: contracts/Ownable.sol

/**
 * @title Ownable
 * @dev The Ownable contract has an owner address, and provides basic authorization control
 * functions, this simplifies the implementation of "user permissions".
 */
contract Ownable {event __CoverageControlled(string fileName, uint256 lineNumber);
event __FunctionCoverageControlled(string fileName, uint256 fnId);
event __StatementCoverageControlled(string fileName, uint256 statementId);
event __BranchCoverageControlled(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageControlled(string fileName, uint256 branchId);
event __AssertPostCoverageControlled(string fileName, uint256 branchId);

  address public owner;


  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);


  /**
   * @dev The Ownable constructor sets the original `owner` of the contract to the sender
   * account.
   */
  function Ownable() {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',23);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',313);
     __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',53);
owner = msg.sender;
  }


  /**
   * @dev Throws if called by any account other than the owner.
   */
  modifier onlyOwner() {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',24);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',321);
    __AssertPreCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',17);
 __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',54);
require(msg.sender == owner);__AssertPostCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',17);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',322);
    _;
  }


  /**
   * @dev Allows the current owner to transfer control of the contract to a newOwner.
   * @param newOwner The address to transfer ownership to.
   */
  function transferOwnership(address newOwner) onlyOwner public {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',25);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',331);
    __AssertPreCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',18);
 __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',55);
require(newOwner != address(0));__AssertPostCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',18);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',332);
     __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',56);
OwnershipTransferred(owner, newOwner);
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',333);
     __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',57);
owner = newOwner;
  }

}

// File: contracts/EthealWhitelist.sol

/**
 * @title EthealWhitelist
 * @author thesved
 * @notice EthealWhitelist contract which handles KYC
 */
contract EthealWhitelist is Ownable {event __CoverageControlled(string fileName, uint256 lineNumber);
event __FunctionCoverageControlled(string fileName, uint256 fnId);
event __StatementCoverageControlled(string fileName, uint256 statementId);
event __BranchCoverageControlled(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageControlled(string fileName, uint256 branchId);
event __AssertPostCoverageControlled(string fileName, uint256 branchId);

    using ECRecovery for bytes32;

    // signer address for offchain whitelist signing
    address public signer;

    // storing whitelisted addresses
    mapping(address => bool) public isWhitelisted;

    event WhitelistSet(address indexed _address, bool _state);

    ////////////////
    // Constructor
    ////////////////
    function EthealWhitelist(address _signer) {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',26);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',360);
        __AssertPreCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',19);
 __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',58);
require(_signer != address(0));__AssertPostCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',19);


__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',362);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',59);
signer = _signer;
    }

    /// @notice set signing address after deployment
    function setSigner(address _signer) public onlyOwner {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',27);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',367);
        __AssertPreCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',20);
 __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',60);
require(_signer != address(0));__AssertPostCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',20);


__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',369);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',61);
signer = _signer;
    }

    ////////////////
    // Whitelisting: only owner
    ////////////////

    /// @notice Set whitelist state for an address.
    function setWhitelist(address _addr, bool _state) public onlyOwner {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',28);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',378);
        __AssertPreCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',21);
 __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',62);
require(_addr != address(0));__AssertPostCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',21);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',379);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',63);
isWhitelisted[_addr] = _state;
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',380);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',64);
WhitelistSet(_addr, _state);
    }

    /// @notice Set whitelist state for multiple addresses
    function setManyWhitelist(address[] _addr, bool _state) public onlyOwner {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',29);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',385);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',65);
for (uint256 i = 0; i < _addr.length; i++) {
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',386);
             __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',66);
setWhitelist(_addr[i], _state);
        }
    }

    /// @notice offchain whitelist check
    function isOffchainWhitelisted(address _addr, bytes _sig) public  returns (bool) {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',30);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',392);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',67);
bytes32 hash = keccak256("\x19Ethereum Signed Message:\n20",_addr);
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',393);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',68);
return hash.recover(_sig) == signer;
    }
}

// File: contracts/FinalizableCrowdsale.sol

/**
 * @title FinalizableCrowdsale
 * @dev Extension of Crowdsale where an owner can do extra work
 * after finishing.
 */
contract FinalizableCrowdsale is Crowdsale, Ownable {event __CoverageControlled(string fileName, uint256 lineNumber);
event __FunctionCoverageControlled(string fileName, uint256 fnId);
event __StatementCoverageControlled(string fileName, uint256 statementId);
event __BranchCoverageControlled(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageControlled(string fileName, uint256 branchId);
event __AssertPostCoverageControlled(string fileName, uint256 branchId);

  using SafeMath for uint256;

  bool public isFinalized = false;

  event Finalized();

  /**
   * @dev Must be called after crowdsale ends, to do some extra finalization
   * work. Calls the contract's finalization function.
   */
  function finalize() onlyOwner public {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',31);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',416);
    __AssertPreCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',22);
 __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',69);
require(!isFinalized);__AssertPostCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',22);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',417);
    __AssertPreCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',23);
 __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',70);
require(hasEnded());__AssertPostCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',23);


__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',419);
     __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',71);
finalization();
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',420);
     __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',72);
Finalized();

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',422);
     __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',73);
isFinalized = true;
  }

  /**
   * @dev Can be overridden to add finalization logic. The overriding function
   * should call super.finalization() to ensure the chain of finalization is
   * executed entirely.
   */
  function finalization() internal {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',32);

  }
}

// File: contracts/Pausable.sol

/**
 * @title Pausable
 * @dev Base contract which allows children to implement an emergency stop mechanism.
 */
contract Pausable is Ownable {event __CoverageControlled(string fileName, uint256 lineNumber);
event __FunctionCoverageControlled(string fileName, uint256 fnId);
event __StatementCoverageControlled(string fileName, uint256 statementId);
event __BranchCoverageControlled(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageControlled(string fileName, uint256 branchId);
event __AssertPostCoverageControlled(string fileName, uint256 branchId);

  event Pause();
  event Unpause();

  bool public paused = false;


  /**
   * @dev Modifier to make a function callable only when the contract is not paused.
   */
  modifier whenNotPaused() {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',33);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',451);
    __AssertPreCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',24);
 __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',74);
require(!paused);__AssertPostCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',24);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',452);
    _;
  }

  /**
   * @dev Modifier to make a function callable only when the contract is paused.
   */
  modifier whenPaused() {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',34);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',459);
    __AssertPreCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',25);
 __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',75);
require(paused);__AssertPostCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',25);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',460);
    _;
  }

  /**
   * @dev called by the owner to pause, triggers stopped state
   */
  function pause() onlyOwner whenNotPaused public {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',35);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',467);
     __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',76);
paused = true;
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',468);
     __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',77);
Pause();
  }

  /**
   * @dev called by the owner to unpause, returns to normal state
   */
  function unpause() onlyOwner whenPaused public {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',36);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',475);
     __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',78);
paused = false;
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',476);
     __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',79);
Unpause();
  }
}

// File: contracts/TokenController.sol

/// @dev The token controller contract must implement these functions
contract TokenController {event __CoverageControlled(string fileName, uint256 lineNumber);
event __FunctionCoverageControlled(string fileName, uint256 fnId);
event __StatementCoverageControlled(string fileName, uint256 statementId);
event __BranchCoverageControlled(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageControlled(string fileName, uint256 branchId);
event __AssertPostCoverageControlled(string fileName, uint256 branchId);

    ERC20MiniMe public ethealToken;
    address public SALE; // address where sale tokens are located

    /// @notice needed for hodler handling
    function addHodlerStake(address _beneficiary, uint _stake) public;
    function setHodlerStake(address _beneficiary, uint256 _stake) public;
    function setHodlerTime(uint256 _time) public;


    /// @notice Called when `_owner` sends ether to the MiniMe Token contract
    /// @param _owner The address that sent the ether to create tokens
    /// @return True if the ether is accepted, false if it throws
    function proxyPayment(address _owner) public payable returns(bool);

    /// @notice Notifies the controller about a token transfer allowing the
    ///  controller to react if desired
    /// @param _from The origin of the transfer
    /// @param _to The destination of the transfer
    /// @param _amount The amount of the transfer
    /// @return False if the controller does not authorize the transfer
    function onTransfer(address _from, address _to, uint _amount) public returns(bool);

    /// @notice Notifies the controller about an approval allowing the
    ///  controller to react if desired
    /// @param _owner The address that calls `approve()`
    /// @param _spender The spender in the `approve()` call
    /// @param _amount The amount in the `approve()` call
    /// @return False if the controller does not authorize the approval
    function onApprove(address _owner, address _spender, uint _amount) public returns(bool);
}

// File: contracts/EthealNormalSale.sol

/**
 * @title EthealNormalSale
 * @author thesved
 * @notice Etheal Token Sale contract, with softcap and hardcap (cap)
 * @dev This contract has to be finalized before token claims are enabled
 */
contract EthealNormalSale is Pausable, FinalizableCrowdsale, CappedCrowdsale {event __CoverageControlled(string fileName, uint256 lineNumber);
event __FunctionCoverageControlled(string fileName, uint256 fnId);
event __StatementCoverageControlled(string fileName, uint256 statementId);
event __BranchCoverageControlled(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageControlled(string fileName, uint256 branchId);
event __AssertPostCoverageControlled(string fileName, uint256 branchId);

    // the token is here
    TokenController public ethealController;

    // after reaching {weiRaised} >= {softCap}, there is {softCapTime} seconds until the sale closes
    // {softCapClose} contains the closing time
    uint256 public rate = 700;
    uint256 public softCap = 6800 ether;
    uint256 public softCapTime = 120 hours;
    uint256 public softCapClose;
    uint256 public cap = 14300 ether;

    // how many token is sold and not claimed, used for refunding to token controller
    uint256 public tokenBalance;

    // total token sold
    uint256 public tokenSold;

    // minimum contribution, 0.1ETH
    uint256 public minContribution = 0.1 ether;

    // whitelist: above threshold the contract has to approve each transaction
    EthealWhitelist public whitelist;
    uint256 public whitelistThreshold = 1 ether;

    // deposit address from which it can get funds before sale
    address public deposit;
    
    // stakes contains token bought and contirbutions contains the value in wei
    mapping (address => uint256) public stakes;
    mapping (address => uint256) public contributions;

    // promo token bonus
    address public promoTokenController;
    mapping (address => uint256) public bonusExtra;

    // addresses of contributors to handle finalization after token sale end (refunds or token claims)
    address[] public contributorsKeys; 

    // events for token purchase during sale and claiming tokens after sale
    event TokenClaimed(address indexed _claimer, address indexed _beneficiary, uint256 _amount);
    event TokenPurchase(address indexed _purchaser, address indexed _beneficiary, uint256 _value, uint256 _amount, uint256 _participants, uint256 _weiRaised);
    event TokenSoftCapReached(uint256 _closeTime);
    event TokenHardCapReached();

    ////////////////
    // Constructor and inherited function overrides
    ////////////////

    /// @notice Constructor to create PreSale contract
    /// @param _ethealController Address of ethealController
    /// @param _startTime The start time of token sale in seconds.
    /// @param _endTime The end time of token sale in seconds.
    /// @param _minContribution The minimum contribution per transaction in wei (0.1 ETH)
    /// @param _rate Number of HEAL tokens per 1 ETH
    /// @param _softCap Softcap in wei, reaching it ends the sale in _softCapTime seconds
    /// @param _softCapTime Seconds until the sale remains open after reaching _softCap
    /// @param _cap Maximum cap in wei, we can't raise more funds
    /// @param _wallet Address of multisig wallet, which will get all the funds after successful sale
    function EthealNormalSale(
        address _ethealController,
        uint256 _startTime, 
        uint256 _endTime, 
        uint256 _minContribution, 
        uint256 _rate, 
        uint256 _softCap, 
        uint256 _softCapTime, 
        uint256 _cap, 
        address _wallet
    )
        CappedCrowdsale(_cap)
        FinalizableCrowdsale()
        Crowdsale(_startTime, _endTime, _rate, _wallet)
    {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',37);

        // ethealController must be valid
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',598);
        __AssertPreCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',26);
 __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',80);
require(_ethealController != address(0));__AssertPostCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',26);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',599);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',81);
ethealController = TokenController(_ethealController);

        // caps have to be consistent with each other
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',602);
        __AssertPreCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',27);
 __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',82);
require(_softCap <= _cap);__AssertPostCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',27);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',603);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',83);
softCap = _softCap;
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',604);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',84);
softCapTime = _softCapTime;

        // this is needed since super constructor wont overwite overriden variables
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',607);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',85);
cap = _cap;
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',608);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',86);
rate = _rate;

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',610);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',87);
minContribution = _minContribution;
    }

    ////////////////
    // Administer contract details
    ////////////////

    /// @notice Sets min contribution
    function setMinContribution(uint256 _minContribution) public onlyOwner {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',38);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',619);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',88);
minContribution = _minContribution;
    }

    /// @notice Sets soft cap and max cap
    function setCaps(uint256 _softCap, uint256 _softCapTime, uint256 _cap) public onlyOwner {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',39);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',624);
        __AssertPreCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',28);
 __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',89);
require(_softCap <= _cap);__AssertPostCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',28);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',625);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',90);
softCap = _softCap;
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',626);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',91);
softCapTime = _softCapTime;
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',627);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',92);
cap = _cap;
    }

    /// @notice Sets crowdsale start and end time
    function setTimes(uint256 _startTime, uint256 _endTime) public onlyOwner {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',40);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',632);
        __AssertPreCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',29);
 __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',93);
require(_startTime <= _endTime);__AssertPostCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',29);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',633);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',94);
startTime = _startTime;
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',634);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',95);
endTime = _endTime;
    }

    /// @notice Set rate
    function setRate(uint256 _rate) public onlyOwner {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',41);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',639);
        __AssertPreCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',30);
 __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',96);
require(_rate > 0);__AssertPostCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',30);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',640);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',97);
rate = _rate;
    }

    /// @notice Set address of promo token
    function setPromoTokenController(address _addr) public onlyOwner {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',42);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',645);
        __AssertPreCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',31);
 __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',98);
require(_addr != address(0));__AssertPostCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',31);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',646);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',99);
promoTokenController = _addr;
    }

    /// @notice Set whitelist contract address and minimum threshold
    function setWhitelist(address _whitelist, uint256 _threshold) public onlyOwner {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',43);

        // if whitelist contract address is provided we set it
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',652);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',100);
if (_whitelist != address(0)) {__BranchCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',32,0);
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',653);
             __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',101);
whitelist = EthealWhitelist(_whitelist);
        }else { __BranchCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',32,1);}

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',655);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',102);
whitelistThreshold = _threshold;
    }

    /// @notice Set deposit contract address from which it can receive money before sale
    function setDeposit(address _deposit) public onlyOwner {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',44);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',660);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',103);
deposit = _deposit;
    }

    ////////////////
    // Purchase functions
    ////////////////

    /// @dev Overriding Crowdsale#buyTokens to add partial refund
    /// @param _beneficiary Beneficiary of the token purchase
    function buyTokens(address _beneficiary) public payable whenNotPaused {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',45);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',670);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',104);
handlePayment(_beneficiary, msg.value, now, "");
    }

    /// @dev buying tokens for someone with offchain whitelist signature
    function buyTokens(address _beneficiary, bytes _whitelistSign) public payable whenNotPaused {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',46);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',675);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',105);
handlePayment(_beneficiary, msg.value, now, _whitelistSign);
    }

    /// @dev Internal function for handling transactions with ether.
    function handlePayment(address _beneficiary, uint256 _amount, uint256 _time, bytes memory _whitelistSign) internal {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',47);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',680);
        __AssertPreCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',33);
 __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',106);
require(_beneficiary != address(0));__AssertPostCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',33);


__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',682);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',107);
uint256 weiAmount = handleContribution(_beneficiary, _amount, _time, _whitelistSign);      
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',683);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',108);
forwardFunds(weiAmount);  

        // handle refund excess tokens
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',686);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',109);
uint256 refund = _amount.sub(weiAmount);
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',687);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',110);
if (refund > 0) {__BranchCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',34,0);
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',688);
            _beneficiary.transfer(refund);
        }else { __BranchCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',34,1);}

    }

    /// @dev Handling the amount of contribution and cap logic. Internal function.
    /// @return Wei successfully contributed.
    function handleContribution(address _beneficiary, uint256 _amount, uint256 _time, bytes memory _whitelistSign) internal returns (uint256) {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',48);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',695);
        __AssertPreCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',35);
 __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',111);
require(_beneficiary != address(0));__AssertPostCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',35);


__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',697);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',112);
uint256 weiToCap = howMuchCanXContributeNow(_beneficiary);
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',698);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',113);
uint256 weiAmount = uint256Min(weiToCap, _amount);

        // account the new contribution 
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',701);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',114);
transferToken(_beneficiary, weiAmount, _time, _whitelistSign);
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',702);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',115);
weiRaised = weiRaised.add(weiAmount);

        // close sale in softCapTime seconds after reaching softCap
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',705);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',116);
if (weiRaised >= softCap && softCapClose == 0) {__BranchCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',36,0);
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',706);
             __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',117);
softCapClose = now.add(softCapTime);
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',707);
             __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',118);
TokenSoftCapReached(uint256Min(softCapClose, endTime));
        }else { __BranchCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',36,1);}


        // event for hard cap reached
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',711);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',119);
if (weiRaised >= cap) {__BranchCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',37,0);
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',712);
             __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',120);
TokenHardCapReached();
        }else { __BranchCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',37,1);}


__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',715);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',121);
return weiAmount;
    }

    /// @dev Handling token distribution and accounting. Overriding Crowdsale#transferToken.
    /// @param _beneficiary Address of the recepient of the tokens
    /// @param _weiAmount Contribution in wei
    /// @param _time When the contribution was made
    function transferToken(address _beneficiary, uint256 _weiAmount, uint256 _time, bytes memory _whitelistSign) internal {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',49);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',723);
        __AssertPreCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',38);
 __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',122);
require(_beneficiary != address(0));__AssertPostCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',38);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',724);
        __AssertPreCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',39);
 __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',123);
require(validPurchase(_weiAmount));__AssertPostCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',39);


        // require whitelist above threshold
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',727);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',124);
contributions[_beneficiary] = contributions[_beneficiary].add(_weiAmount);
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',728);
        __AssertPreCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',40);
 __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',125);
require(contributions[_beneficiary] <= whitelistThreshold 
                || whitelist.isWhitelisted(_beneficiary)
                || whitelist.isOffchainWhitelisted(_beneficiary, _whitelistSign)
        );__AssertPostCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',40);


        // calculate tokens, so we can refund excess tokens to EthealController after token sale
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',734);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',126);
uint256 _bonus = getBonus(_beneficiary, _weiAmount, _time);
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',735);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',127);
uint256 tokens = _weiAmount.mul(rate).mul(_bonus).div(100);
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',736);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',128);
tokenBalance = tokenBalance.add(tokens);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',738);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',129);
if (stakes[_beneficiary] == 0) {__BranchCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',41,0);
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',739);
            contributorsKeys.push(_beneficiary);
        }else { __BranchCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',41,1);}

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',741);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',130);
stakes[_beneficiary] = stakes[_beneficiary].add(tokens);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',743);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',131);
TokenPurchase(msg.sender, _beneficiary, _weiAmount, tokens, contributorsKeys.length, weiRaised);
    }

    /// @dev Get eth deposit from Deposit contract
    function depositEth(address _beneficiary, uint256 _time, bytes _whitelistSign) public payable whenNotPaused {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',50);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',748);
        __AssertPreCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',42);
 __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',132);
require(msg.sender == deposit);__AssertPostCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',42);


__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',750);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',133);
handlePayment(_beneficiary, msg.value, _time, _whitelistSign);
    }

    /// @dev Deposit from other currencies
    function depositOffchain(address _beneficiary, uint256 _amount, uint256 _time, bytes _whitelistSign) public onlyOwner whenNotPaused {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',51);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',755);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',134);
handleContribution(_beneficiary, _amount, _time, _whitelistSign);
    }

    /// @dev Overriding Crowdsale#validPurchase to add min contribution logic
    /// @param _weiAmount Contribution amount in wei
    /// @return true if contribution is okay
    function validPurchase(uint256 _weiAmount) internal  returns (bool) {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',52);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',762);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',135);
bool nonEnded = !hasEnded();
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',763);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',136);
bool nonZero = _weiAmount != 0;
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',764);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',137);
bool enoughContribution = _weiAmount >= minContribution;
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',765);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',138);
return nonEnded && nonZero && enoughContribution;
    }

    /// @dev Overriding Crowdsale#hasEnded to add soft cap logic
    /// @return true if crowdsale event has ended or a softCapClose time is set and passed
    function hasEnded() public  returns (bool) {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',53);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',771);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',139);
return super.hasEnded() || softCapClose > 0 && now > softCapClose;
    }

    /// @dev Extending RefundableCrowdsale#finalization sending back excess tokens to ethealController
    function finalization() internal {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',54);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',776);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',140);
uint256 _balance = getHealBalance();

        // saving token balance for future reference
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',779);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',141);
tokenSold = tokenBalance; 

        // send back the excess token to ethealController
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',782);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',142);
if (_balance > tokenBalance) {__BranchCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',43,0);
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',783);
            ethealController.ethealToken().transfer(ethealController.SALE(), _balance.sub(tokenBalance));
        }else { __BranchCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',43,1);}


        // hodler stake counting starts 14 days after closing normal sale
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',787);
        ethealController.setHodlerTime(now + 14 days);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',789);
        super.finalization();
    }


    ////////////////
    // AFTER token sale
    ////////////////

    /// @notice Modifier for after sale finalization
    modifier afterSale() {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',55);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',799);
        __AssertPreCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',44);
 __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',143);
require(isFinalized);__AssertPostCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',44);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',800);
        _;
    }

    /// @notice Claim token for msg.sender after token sale based on stake.
    function claimToken() public afterSale {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',56);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',805);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',144);
claimTokenFor(msg.sender);
    }

    /// @notice Claim token after token sale based on stake.
    /// @dev Anyone can call this function and distribute tokens after successful token sale
    /// @param _beneficiary Address of the beneficiary who gets the token
    function claimTokenFor(address _beneficiary) public afterSale whenNotPaused {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',57);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',812);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',145);
uint256 tokens = stakes[_beneficiary];
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',813);
        __AssertPreCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',45);
 __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',146);
require(tokens > 0);__AssertPostCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',45);


        // set the stake 0 for beneficiary
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',816);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',147);
stakes[_beneficiary] = 0;

        // decrease tokenBalance, to make it possible to withdraw excess HEAL funds
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',819);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',148);
tokenBalance = tokenBalance.sub(tokens);

        // distribute hodlr stake
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',822);
        ethealController.addHodlerStake(_beneficiary, tokens);

        // distribute token
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',825);
        __AssertPreCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',46);
 __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',149);
require(ethealController.ethealToken().transfer(_beneficiary, tokens));__AssertPostCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',46);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',826);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',150);
TokenClaimed(msg.sender, _beneficiary, tokens);
    }

    /// @notice claimToken() for multiple addresses
    /// @dev Anyone can call this function and distribute tokens after successful token sale
    /// @param _beneficiaries Array of addresses for which we want to claim tokens
    function claimManyTokenFor(address[] _beneficiaries) external afterSale {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',58);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',833);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',151);
for (uint256 i = 0; i < _beneficiaries.length; i++) {
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',834);
             __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',152);
claimTokenFor(_beneficiaries[i]);
        }
    }


    ////////////////
    // Bonus functions
    ////////////////

    /// @notice Sets extra 5% bonus for those addresses who send back a promo token
    /// @param _addr this address gets the bonus
    function setPromoBonus(address _addr) public {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',59);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',846);
        __AssertPreCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',47);
 __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',153);
require(msg.sender == promoTokenController || msg.sender == owner);__AssertPostCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',47);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',847);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',154);
if (bonusExtra[ _addr ] < 5)
            { __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',155);
__BranchCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',48,0);__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',848);
bonusExtra[ _addr ] = 5;}else { __BranchCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',48,1);}

    }

    /// @notice Manual set extra bonus for addresses
    function setBonusExtra(address _addr, uint256 _bonus) public onlyOwner {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',60);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',853);
        __AssertPreCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',49);
 __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',156);
require(_addr != address(0));__AssertPostCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',49);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',854);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',157);
bonusExtra[_addr] = _bonus;
    }

    /// @notice Mass set extra bonus for addresses
    function setManyBonusExtra(address[] _addr, uint256 _bonus) external onlyOwner {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',61);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',859);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',158);
for (uint256 i = 0; i < _addr.length; i++) {
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',860);
             __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',159);
setBonusExtra(_addr[i],_bonus);
        }
    }

    /// @notice Returns bonus for now
    function getBonusNow(address _addr, uint256 _size) public  returns (uint256) {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',62);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',866);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',160);
return getBonus(_addr, _size, now);
    }

    /// @notice Returns the bonus in percentage, eg 130 means 30% bonus
    function getBonus(address _addr, uint256 _size, uint256 _time) public  returns (uint256 _bonus) {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',63);

        // detailed bonus structure: https://etheal.com/#heal-token
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',872);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',161);
_bonus = 100;
        
        // time based bonuses
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',875);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',162);
uint256 _day = getSaleDay(_time);
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',876);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',163);
uint256 _hour = getSaleHour(_time);
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',877);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',164);
if (_day <= 1) {__BranchCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',50,0);
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',878);
             __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',165);
if (_hour <= 1) { __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',166);
__BranchCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',51,0);_bonus = 130;}
            else { __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',167);
__BranchCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',51,1);if (_hour <= 5) { __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',168);
__BranchCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',52,0);_bonus = 125;}
            else { __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',169);
__BranchCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',52,1);if (_hour <= 8) { __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',170);
__BranchCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',53,0);_bonus = 120;}
            else { __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',171);
__BranchCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',53,1);_bonus = 118;}}}
        } 
        else { __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',172);
__BranchCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',50,1);if (_day <= 2) {__BranchCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',54,0);  __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',173);
_bonus = 116; }
        else { __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',174);
__BranchCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',54,1);if (_day <= 3) {__BranchCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',55,0);  __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',175);
_bonus = 115; }
        else { __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',176);
__BranchCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',55,1);if (_day <= 5) {__BranchCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',56,0);  __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',177);
_bonus = 114; }
        else { __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',178);
__BranchCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',56,1);if (_day <= 7) {__BranchCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',57,0);  __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',179);
_bonus = 113; }
        else { __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',180);
__BranchCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',57,1);if (_day <= 9) {__BranchCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',58,0);  __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',181);
_bonus = 112; }
        else { __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',182);
__BranchCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',58,1);if (_day <= 11) {__BranchCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',59,0);  __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',183);
_bonus = 111; }
        else { __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',184);
__BranchCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',59,1);if (_day <= 13) {__BranchCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',60,0);  __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',185);
_bonus = 110; }
        else { __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',186);
__BranchCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',60,1);if (_day <= 15) {__BranchCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',61,0);  __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',187);
_bonus = 108; }
        else { __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',188);
__BranchCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',61,1);if (_day <= 17) {__BranchCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',62,0);  __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',189);
_bonus = 107; }
        else { __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',190);
__BranchCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',62,1);if (_day <= 19) {__BranchCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',63,0);  __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',191);
_bonus = 106; }
        else { __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',192);
__BranchCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',63,1);if (_day <= 21) {__BranchCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',64,0);  __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',193);
_bonus = 105; }
        else { __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',194);
__BranchCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',64,1);if (_day <= 23) {__BranchCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',65,0);  __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',195);
_bonus = 104; }
        else { __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',196);
__BranchCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',65,1);if (_day <= 25) {__BranchCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',66,0);  __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',197);
_bonus = 103; }
        else { __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',198);
__BranchCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',66,1);if (_day <= 27) {__BranchCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',67,0);  __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',199);
_bonus = 102; }else { __BranchCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',67,1);}
}}}}}}}}}}}}}}

        // size based bonuses
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',899);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',200);
if (_size >= 100 ether) {__BranchCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',68,0);  __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',201);
_bonus = _bonus + 4; }
        else { __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',202);
__BranchCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',68,1);if (_size >= 10 ether) {__BranchCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',69,0);  __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',203);
_bonus = _bonus + 2; }else { __BranchCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',69,1);}
}

        // manual bonus
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',903);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',204);
_bonus += bonusExtra[ _addr ];

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',905);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',205);
return _bonus;
    }


    ////////////////
    // Constant, helper functions
    ////////////////

    /// @notice How many wei can the msg.sender contribute now.
    function howMuchCanIContributeNow()  public returns (uint256) {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',64);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',915);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',206);
return howMuchCanXContributeNow(msg.sender);
    }

    /// @notice How many wei can an ethereum address contribute now.
    /// @param _beneficiary Ethereum address
    /// @return Number of wei the _beneficiary can contribute now.
    function howMuchCanXContributeNow(address _beneficiary)  public returns (uint256) {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',65);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',922);
        __AssertPreCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',70);
 __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',207);
require(_beneficiary != address(0));__AssertPostCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',70);


__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',924);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',208);
if (hasEnded() || paused) 
            { __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',209);
__BranchCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',71,0);__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',925);
return 0;}else { __BranchCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',71,1);}


        // wei to hard cap
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',928);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',210);
uint256 weiToCap = cap.sub(weiRaised);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',930);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',211);
return weiToCap;
    }

    /// @notice For a give date how many 24 hour blocks have ellapsed since token sale start
    ///  Before sale return 0, first day 1, second day 2, ...
    /// @param _time Date in seconds for which we want to know which sale day it is
    /// @return Number of 24 hour blocks ellapsing since token sale start starting from 1
    function getSaleDay(uint256 _time)  public returns (uint256) {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',66);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',938);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',212);
uint256 _day = 0;
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',939);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',213);
if (_time > startTime) {__BranchCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',72,0);
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',940);
             __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',214);
_day = _time.sub(startTime).div(60*60*24).add(1);
        }else { __BranchCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',72,1);}

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',942);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',215);
return _day;
    }

    /// @notice How many 24 hour blocks have ellapsed since token sale start
    /// @return Number of 24 hour blocks ellapsing since token sale start starting from 1
    function getSaleDayNow()  public returns (uint256) {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',67);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',948);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',216);
return getSaleDay(now);
    }

    /// @notice Returns sale hour: 0 before sale, 1 for the first hour, ...
    /// @param _time Date in seconds for which we want to know which sale hour it is
    /// @return Number of 1 hour blocks ellapsing since token sale start starting from 1
    function getSaleHour(uint256 _time)  public returns (uint256) {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',68);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',955);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',217);
uint256 _hour = 0;
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',956);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',218);
if (_time > startTime) {__BranchCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',73,0);
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',957);
             __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',219);
_hour = _time.sub(startTime).div(60*60).add(1);
        }else { __BranchCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',73,1);}

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',959);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',220);
return _hour;
    }

    /// @notice How many 1 hour blocks have ellapsed since token sale start
    /// @return Number of 1 hour blocks ellapsing since token sale start starting from 1
    function getSaleHourNow()  public returns (uint256) {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',69);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',965);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',221);
return getSaleHour(now);
    }

    /// @notice Minimum between two uint256 numbers
    function uint256Min(uint256 a, uint256 b)  internal returns (uint256) {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',70);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',970);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',222);
return a > b ? b : a;
    }


    ////////////////
    // Test and contribution web app, NO audit is needed
    ////////////////

    /// @notice How many contributors we have.
    /// @return Number of different contributor ethereum addresses
    function getContributorsCount()  public returns (uint256) {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',71);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',981);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',223);
return contributorsKeys.length;
    }

    /// @notice Get contributor addresses to manage refunds or token claims.
    /// @dev If the sale is not yet successful, then it searches in the RefundVault.
    ///  If the sale is successful, it searches in contributors.
    /// @param _pending If true, then returns addresses which didn't get their tokens distributed to them
    /// @param _claimed If true, then returns already distributed addresses
    /// @return Array of addresses of contributors
    function getContributors(bool _pending, bool _claimed)  public returns (address[] contributors) {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',72);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',991);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',224);
uint256 i = 0;
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',992);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',225);
uint256 results = 0;
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',993);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',226);
address[] memory _contributors = new address[](contributorsKeys.length);

        // search in contributors
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',996);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',227);
for (i = 0; i < contributorsKeys.length; i++) {
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',997);
             __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',228);
if (_pending && stakes[contributorsKeys[i]] > 0 || _claimed && stakes[contributorsKeys[i]] == 0) {__BranchCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',74,0);
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',998);
                 __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',229);
_contributors[results] = contributorsKeys[i];
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',999);
                results++;
            }else { __BranchCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',74,1);}

        }

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',1003);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',230);
contributors = new address[](results);
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',1004);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',231);
for (i = 0; i < results; i++) {
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',1005);
             __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',232);
contributors[i] = _contributors[i];
        }

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',1008);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',233);
return contributors;
    }

    /// @notice How many HEAL tokens do this contract have
    function getHealBalance()  public returns (uint256) {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',73);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',1013);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealNormalSale.sol',234);
return ethealController.ethealToken().balanceOf(address(this));
    }
}
