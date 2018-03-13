pragma solidity ^0.4.17;

// File: contracts/Controlled.sol

contract Controlled {
    /// @notice The address of the controller is the only address that can call
    ///  a function with this modifier
    modifier onlyController { require(msg.sender == controller); _; }

    address public controller;

    function Controlled() public { controller = msg.sender;}

    /// @notice Changes the controller of the contract
    /// @param _newController The new controller of the contract
    function changeController(address _newController) public onlyController {
        controller = _newController;
    }
}

// File: contracts/ERC20.sol

/**
 * @title ERC20
 * @dev ERC20 interface
 */
contract ERC20 {
    function balanceOf(address who) public constant returns (uint256);
    function transfer(address to, uint256 value) public returns (bool);
    function allowance(address owner, address spender) public constant returns (uint256);
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
contract ERC20MiniMe is ERC20, Controlled {
    function approveAndCall(address _spender, uint256 _amount, bytes _extraData) public returns (bool);
    function totalSupply() public constant returns (uint);
    function balanceOfAt(address _owner, uint _blockNumber) public constant returns (uint);
    function totalSupplyAt(uint _blockNumber) public constant returns(uint);
    function createCloneToken(string _cloneTokenName, uint8 _cloneDecimalUnits, string _cloneTokenSymbol, uint _snapshotBlock, bool _transfersEnabled) public returns(address);
    function generateTokens(address _owner, uint _amount) public returns (bool);
    function destroyTokens(address _owner, uint _amount)  public returns (bool);
    function enableTransfers(bool _transfersEnabled) public;
    function isContract(address _addr) constant internal returns(bool);
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
contract Ownable {
  address public owner;


  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);


  /**
   * @dev The Ownable constructor sets the original `owner` of the contract to the sender
   * account.
   */
  function Ownable() {
    owner = msg.sender;
  }


  /**
   * @dev Throws if called by any account other than the owner.
   */
  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }


  /**
   * @dev Allows the current owner to transfer control of the contract to a newOwner.
   * @param newOwner The address to transfer ownership to.
   */
  function transferOwnership(address newOwner) onlyOwner public {
    require(newOwner != address(0));
    OwnershipTransferred(owner, newOwner);
    owner = newOwner;
  }

}

// File: contracts/HasNoTokens.sol

/**
 * @title claim accidentally sent tokens
 */
contract HasNoTokens is Ownable {
    event ExtractedTokens(address indexed _token, address indexed _claimer, uint _amount);

    /// @notice This method can be used to extract mistakenly
    ///  sent tokens to this contract.
    /// @param _token The address of the token contract that you want to recover
    ///  set to 0 in case you want to extract ether.
    /// @param _claimer Address that tokens will be send to
    function extractTokens(address _token, address _claimer) onlyOwner public {
        if (_token == 0x0) {
            _claimer.transfer(this.balance);
            return;
        }

        ERC20 token = ERC20(_token);
        uint balance = token.balanceOf(this);
        token.transfer(_claimer, balance);
        ExtractedTokens(_token, _claimer, balance);
    }
}

// File: contracts/Pausable.sol

/**
 * @title Pausable
 * @dev Base contract which allows children to implement an emergency stop mechanism.
 */
contract Pausable is Ownable {
  event Pause();
  event Unpause();

  bool public paused = false;


  /**
   * @dev Modifier to make a function callable only when the contract is not paused.
   */
  modifier whenNotPaused() {
    require(!paused);
    _;
  }

  /**
   * @dev Modifier to make a function callable only when the contract is paused.
   */
  modifier whenPaused() {
    require(paused);
    _;
  }

  /**
   * @dev called by the owner to pause, triggers stopped state
   */
  function pause() onlyOwner whenNotPaused public {
    paused = true;
    Pause();
  }

  /**
   * @dev called by the owner to unpause, returns to normal state
   */
  function unpause() onlyOwner whenPaused public {
    paused = false;
    Unpause();
  }
}

// File: contracts/SafeMath.sol

/**
 * @title SafeMath
 * @dev Math operations with safety checks that throw on error
 */
library SafeMath {
  function mul(uint256 a, uint256 b) internal pure returns (uint256) {
    uint256 c = a * b;
    assert(a == 0 || c / a == b);
    return c;
  }

  function div(uint256 a, uint256 b) internal pure returns (uint256) {
    // assert(b > 0); // Solidity automatically throws when dividing by 0
    uint256 c = a / b;
    // assert(a == b * c + a % b); // There is no case in which this doesn't hold
    return c;
  }

  function sub(uint256 a, uint256 b) internal pure returns (uint256) {
    assert(b <= a);
    return a - b;
  }

  function add(uint256 a, uint256 b) internal pure returns (uint256) {
    uint256 c = a + b;
    assert(c >= a);
    return c;
  }
}

// File: contracts/TokenController.sol

/// @dev The token controller contract must implement these functions
contract TokenController {
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
contract iEthealSale {
    uint256 public whitelistThreshold;
    mapping (address => uint256) public stakes;
    function setPromoBonus(address _investor) public;
    function buyTokens(address _beneficiary) public payable;
    function depositEth(address _beneficiary, uint256 _time, bytes _whitelistSign) public payable;
    function depositOffchain(address _beneficiary, uint256 _amount, uint256 _time) public;
    function hasEnded() public constant returns (bool);
}

// File: contracts/EthealPromoTokenController.sol

/**
 * @title EthealPromoToken
 * @author thesved
 * @notice Controller of the Etheal PROMO Token
 */
contract EthealPromoTokenController is Pausable, HasNoTokens {
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
    function extractTokens(address _token, address _claimer) onlyOwner public {
        super.extractTokens(_token, _claimer);
    }


    ////////////////
    // Handle ownership - only for owner
    ////////////////

    /// @notice replaces controller when it was not yet replaced, only multisig can do it
    function setNewController(address _controller) public onlyOwner {
        require(_controller != address(0) && newController == address(0));

        newController = TokenController(_controller);
        ethealPromoToken.changeController(_controller);

        // send eth
        uint256 _stake = this.balance;
        if (_stake > 0) {
            _controller.transfer(_stake);
        }

        // send tokens
        _stake = ethealPromoToken.balanceOf(this);
        if (_stake > 0) {
            ethealPromoToken.transfer(_controller, _stake);
        }
    }

    /// @notice set the crowdsale contract: we will set the bonus on this contract
    function setCrowdsale(address _crowdsale) public onlyOwner {
        require(_crowdsale != address(0));

        crowdsale = iEthealSale(_crowdsale);
    }

    /// @notice set the token
    function setPromoToken(address _token) public onlyOwner {
        require(_token != address(0));

        ethealPromoToken = ERC20MiniMe(_token);
    }


    ////////////////
    // Distribute tokens
    ////////////////

    /// @notice Distribute promo token
    function distributeToken(address _to, uint256 _amount) public onlyOwner {
        distributeTokenInternal(_to, _amount);
    }

    /// @notice Distribute promo token for multiple addresses
    function distributeManyToken(address[] _to, uint256 _amount) external onlyOwner {
        for (uint256 i=0; i<_to.length; i++) {
            distributeTokenInternal(_to[i], _amount);
        }
    }

    /// @notice Internal function for generation, no check for faster mass action
    function distributeTokenInternal(address _to, uint256 _amount) internal {
        ethealPromoToken.generateTokens(_to, _amount);
    }

    /// @notice burn promo token
    function burnToken(address _where, uint256 _amount) public onlyOwner {
        require(ethealPromoToken.destroyTokens(_where, _amount));
    }

    /// @notice burn promo token on multiple addresses
    function burnManyToken(address[] _where, uint256 _amount) external onlyOwner {
        for (uint256 i=0; i<_where.length; i++) {
            burnToken(_where[i], _amount);
        }
    }


    ////////////////
    // MiniMe Controller functions
    ////////////////

    /// @notice No eth payment to the token contract
    function proxyPayment(address) payable public returns (bool) {
        revert();
    }

    /// @notice If promo token is sent back, set promo bonus for the _from address
    function onTransfer(address _from, address _to, uint256 _amount) public returns (bool) {
        if (!paused && _amount > 0 && crowdsale != address(0) && (_to == address(1) || _to == address(this) || _to == address(crowdsale))) {
            crowdsale.setPromoBonus(_from);
        }

        return !paused;
    }

    function onApprove(address, address, uint256) public returns (bool) {
        return !paused;
    }

    /// @notice Retrieve mistakenly sent tokens (other than the etheal token) from the token contract 
    function claimTokenTokens(address _token) public onlyOwner {
        require(_token != address(ethealPromoToken));

        ethealPromoToken.claimTokens(_token);
    }
}
