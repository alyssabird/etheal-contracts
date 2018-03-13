pragma solidity ^0.4.17;

// File: contracts/Controlled.sol

contract Controlled {event __CoverageControlled(string fileName, uint256 lineNumber);
event __FunctionCoverageControlled(string fileName, uint256 fnId);
event __StatementCoverageControlled(string fileName, uint256 statementId);
event __BranchCoverageControlled(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageControlled(string fileName, uint256 branchId);
event __AssertPostCoverageControlled(string fileName, uint256 branchId);

    /// @notice The address of the controller is the only address that can call
    ///  a function with this modifier
    modifier onlyController {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',1);
 __AssertPreCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',1);
 __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',1);
require(msg.sender == controller);__AssertPostCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',1);
 _; }

    address public controller;

    function Controlled() public {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',2);
  __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',2);
controller = msg.sender;}

    /// @notice Changes the controller of the contract
    /// @param _newController The new controller of the contract
    function changeController(address _newController) public onlyController {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',3);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',17);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',3);
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
  function Ownable() {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',4);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',77);
     __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',4);
owner = msg.sender;
  }


  /**
   * @dev Throws if called by any account other than the owner.
   */
  modifier onlyOwner() {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',5);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',85);
    __AssertPreCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',2);
 __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',5);
require(msg.sender == owner);__AssertPostCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',2);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',86);
    _;
  }


  /**
   * @dev Allows the current owner to transfer control of the contract to a newOwner.
   * @param newOwner The address to transfer ownership to.
   */
  function transferOwnership(address newOwner) onlyOwner public {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',6);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',95);
    __AssertPreCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',3);
 __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',6);
require(newOwner != address(0));__AssertPostCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',3);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',96);
     __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',7);
OwnershipTransferred(owner, newOwner);
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',97);
     __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',8);
owner = newOwner;
  }

}

// File: contracts/HasNoTokens.sol

/**
 * @title claim accidentally sent tokens
 */
contract HasNoTokens is Ownable {event __CoverageControlled(string fileName, uint256 lineNumber);
event __FunctionCoverageControlled(string fileName, uint256 fnId);
event __StatementCoverageControlled(string fileName, uint256 statementId);
event __BranchCoverageControlled(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageControlled(string fileName, uint256 branchId);
event __AssertPostCoverageControlled(string fileName, uint256 branchId);

    event ExtractedTokens(address indexed _token, address indexed _claimer, uint _amount);

    /// @notice This method can be used to extract mistakenly
    ///  sent tokens to this contract.
    /// @param _token The address of the token contract that you want to recover
    ///  set to 0 in case you want to extract ether.
    /// @param _claimer Address that tokens will be send to
    function extractTokens(address _token, address _claimer) onlyOwner public {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',7);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',116);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',9);
if (_token == 0x0) {__BranchCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',4,0);
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',117);
            _claimer.transfer(this.balance);
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',118);
             __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',10);
return;
        }else { __BranchCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',4,1);}


__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',121);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',11);
ERC20 token = ERC20(_token);
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',122);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',12);
uint balance = token.balanceOf(this);
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',123);
        token.transfer(_claimer, balance);
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',124);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',13);
ExtractedTokens(_token, _claimer, balance);
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
  modifier whenNotPaused() {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',8);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',145);
    __AssertPreCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',5);
 __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',14);
require(!paused);__AssertPostCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',5);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',146);
    _;
  }

  /**
   * @dev Modifier to make a function callable only when the contract is paused.
   */
  modifier whenPaused() {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',9);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',153);
    __AssertPreCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',6);
 __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',15);
require(paused);__AssertPostCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',6);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',154);
    _;
  }

  /**
   * @dev called by the owner to pause, triggers stopped state
   */
  function pause() onlyOwner whenNotPaused public {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',10);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',161);
     __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',16);
paused = true;
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',162);
     __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',17);
Pause();
  }

  /**
   * @dev called by the owner to unpause, returns to normal state
   */
  function unpause() onlyOwner whenPaused public {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',11);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',169);
     __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',18);
paused = false;
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',170);
     __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',19);
Unpause();
  }
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

  function mul(uint256 a, uint256 b) internal  returns (uint256) {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',12);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',182);
     __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',20);
uint256 c = a * b;
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',183);
    __AssertPreCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',7);
 __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',21);
assert(a == 0 || c / a == b);__AssertPostCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',7);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',184);
     __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',22);
return c;
  }

  function div(uint256 a, uint256 b) internal  returns (uint256) {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',13);

    // assert(b > 0); // Solidity automatically throws when dividing by 0
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',189);
     __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',23);
uint256 c = a / b;
    // assert(a == b * c + a % b); // There is no case in which this doesn't hold
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',191);
     __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',24);
return c;
  }

  function sub(uint256 a, uint256 b) internal  returns (uint256) {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',14);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',195);
    __AssertPreCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',8);
 __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',25);
assert(b <= a);__AssertPostCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',8);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',196);
     __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',26);
return a - b;
  }

  function add(uint256 a, uint256 b) internal  returns (uint256) {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',15);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',200);
     __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',27);
uint256 c = a + b;
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',201);
    __AssertPreCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',9);
 __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',28);
assert(c >= a);__AssertPostCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',9);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',202);
     __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',29);
return c;
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

// File: contracts/iEthealSale.sol

/// @dev Crowdsale interface for Etheal Normal Sale, functions needed from outside.
contract iEthealSale {event __CoverageControlled(string fileName, uint256 lineNumber);
event __FunctionCoverageControlled(string fileName, uint256 fnId);
event __StatementCoverageControlled(string fileName, uint256 statementId);
event __BranchCoverageControlled(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageControlled(string fileName, uint256 branchId);
event __AssertPostCoverageControlled(string fileName, uint256 branchId);

    uint256 public whitelistThreshold;
    mapping (address => uint256) public stakes;
    function setPromoBonus(address _investor) public;
    function buyTokens(address _beneficiary) public payable;
    function depositEth(address _beneficiary, uint256 _time, bytes _whitelistSign) public payable;
    function depositOffchain(address _beneficiary, uint256 _amount, uint256 _time) public;
    function hasEnded() public  returns (bool);
}

// File: contracts/EthealPromoTokenController.sol

/**
 * @title EthealPromoToken
 * @author thesved
 * @notice Controller of the Etheal PROMO Token
 */
contract EthealPromoTokenController is Pausable, HasNoTokens {event __CoverageControlled(string fileName, uint256 lineNumber);
event __FunctionCoverageControlled(string fileName, uint256 fnId);
event __StatementCoverageControlled(string fileName, uint256 statementId);
event __BranchCoverageControlled(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageControlled(string fileName, uint256 branchId);
event __AssertPostCoverageControlled(string fileName, uint256 branchId);

    using SafeMath for uint;

    // when migrating this contains the address of the new controller
    TokenController public newController;

    // PromoToken which this controlls
    ERC20MiniMe public ethealPromoToken;

    // Address of crowdsale where we set promo token bonus
    iEthealSale public crowdsale;


    ////////////////
    // Constructor, overrides
    ////////////////

    /// @dev overrides HasNoTokens#extractTokens to make it possible to extract any tokens
    function extractTokens(address _token, address _claimer) onlyOwner public {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',16);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',280);
        super.extractTokens(_token, _claimer);
    }


    ////////////////
    // Handle ownership - only for owner
    ////////////////

    /// @notice replaces controller when it was not yet replaced, only multisig can do it
    function setNewController(address _controller) public onlyOwner {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',17);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',290);
        __AssertPreCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',10);
 __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',30);
require(_controller != address(0) && newController == address(0));__AssertPostCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',10);


__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',292);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',31);
newController = TokenController(_controller);
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',293);
        ethealPromoToken.changeController(_controller);

        // send eth
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',296);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',32);
uint256 _stake = this.balance;
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',297);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',33);
if (_stake > 0) {__BranchCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',11,0);
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',298);
            _controller.transfer(_stake);
        }else { __BranchCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',11,1);}


        // send tokens
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',302);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',34);
_stake = ethealPromoToken.balanceOf(this);
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',303);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',35);
if (_stake > 0) {__BranchCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',12,0);
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',304);
            ethealPromoToken.transfer(_controller, _stake);
        }else { __BranchCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',12,1);}

    }

    /// @notice set the crowdsale contract: we will set the bonus on this contract
    function setCrowdsale(address _crowdsale) public onlyOwner {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',18);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',310);
        __AssertPreCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',13);
 __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',36);
require(_crowdsale != address(0));__AssertPostCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',13);


__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',312);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',37);
crowdsale = iEthealSale(_crowdsale);
    }

    /// @notice set the token
    function setPromoToken(address _token) public onlyOwner {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',19);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',317);
        __AssertPreCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',14);
 __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',38);
require(_token != address(0));__AssertPostCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',14);


__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',319);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',39);
ethealPromoToken = ERC20MiniMe(_token);
    }


    ////////////////
    // Distribute tokens
    ////////////////

    /// @notice Distribute promo token
    function distributeToken(address _to, uint256 _amount) public onlyOwner {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',20);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',329);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',40);
distributeTokenInternal(_to, _amount);
    }

    /// @notice Distribute promo token for multiple addresses
    function distributeManyToken(address[] _to, uint256 _amount) external onlyOwner {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',21);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',334);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',41);
for (uint256 i=0; i<_to.length; i++) {
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',335);
             __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',42);
distributeTokenInternal(_to[i], _amount);
        }
    }

    /// @notice Internal function for generation, no check for faster mass action
    function distributeTokenInternal(address _to, uint256 _amount) internal {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',22);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',341);
        ethealPromoToken.generateTokens(_to, _amount);
    }

    /// @notice burn promo token
    function burnToken(address _where, uint256 _amount) public onlyOwner {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',23);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',346);
        __AssertPreCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',15);
 __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',43);
require(ethealPromoToken.destroyTokens(_where, _amount));__AssertPostCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',15);

    }

    /// @notice burn promo token on multiple addresses
    function burnManyToken(address[] _where, uint256 _amount) external onlyOwner {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',24);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',351);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',44);
for (uint256 i=0; i<_where.length; i++) {
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',352);
             __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',45);
burnToken(_where[i], _amount);
        }
    }


    ////////////////
    // MiniMe Controller functions
    ////////////////

    /// @notice No eth payment to the token contract
    function proxyPayment(address) payable public returns (bool) {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',25);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',363);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',46);
revert();
    }

    /// @notice If promo token is sent back, set promo bonus for the _from address
    function onTransfer(address _from, address _to, uint256 _amount) public returns (bool) {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',26);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',368);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',47);
if (!paused && _amount > 0 && crowdsale != address(0) && (_to == address(1) || _to == address(this) || _to == address(crowdsale))) {__BranchCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',16,0);
__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',369);
            crowdsale.setPromoBonus(_from);
        }else { __BranchCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',16,1);}


__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',372);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',48);
return !paused;
    }

    function onApprove(address, address, uint256) public returns (bool) {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',27);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',376);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',49);
return !paused;
    }

    /// @notice Retrieve mistakenly sent tokens (other than the etheal token) from the token contract 
    function claimTokenTokens(address _token) public onlyOwner {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',28);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',381);
        __AssertPreCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',17);
 __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',50);
require(_token != address(ethealPromoToken));__AssertPostCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',17);


__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealPromoTokenController.sol',383);
        ethealPromoToken.claimTokens(_token);
    }
}
