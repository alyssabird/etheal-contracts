pragma solidity ^0.4.17;

/// @title MiniMeToken Contract
/// @author Jordi Baylina
/// @dev This token contract's goal is to make it easy for anyone to clone this
///  token using the token distribution at a given block, this will allow DAO's
///  and DApps to upgrade their features in a decentralized manner without
///  affecting the original token
/// @dev It is ERC20 compliant, but still needs to under go further testing.

import "./Controlled.sol";
import "./TokenController.sol";

contract ApproveAndCallFallBack {event __CoverageApproveAndCallFallBack(string fileName, uint256 lineNumber);
event __FunctionCoverageApproveAndCallFallBack(string fileName, uint256 fnId);
event __StatementCoverageApproveAndCallFallBack(string fileName, uint256 statementId);
event __BranchCoverageApproveAndCallFallBack(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageApproveAndCallFallBack(string fileName, uint256 branchId);
event __AssertPostCoverageApproveAndCallFallBack(string fileName, uint256 branchId);

    function receiveApproval(address from, uint256 _amount, address _token, bytes _data) public;
}

/// @dev The actual token contract, the default controller is the msg.sender
///  that deploys the contract, so usually this token will be deployed by a
///  token controller contract, which Giveth will call a "Campaign"
contract MiniMeToken is Controlled {event __CoverageApproveAndCallFallBack(string fileName, uint256 lineNumber);
event __FunctionCoverageApproveAndCallFallBack(string fileName, uint256 fnId);
event __StatementCoverageApproveAndCallFallBack(string fileName, uint256 statementId);
event __BranchCoverageApproveAndCallFallBack(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageApproveAndCallFallBack(string fileName, uint256 branchId);
event __AssertPostCoverageApproveAndCallFallBack(string fileName, uint256 branchId);


    string public name;                //The Token's name: e.g. DigixDAO Tokens
    uint8 public decimals;             //Number of decimals of the smallest unit
    string public symbol;              //An identifier: e.g. REP
    string public version = 'MMT_0.2'; //An arbitrary versioning scheme


    /// @dev `Checkpoint` is the structure that attaches a block number to a
    ///  given value, the block number attached is the one that last changed the
    ///  value
    struct Checkpoint {

        // `fromBlock` is the block number that the value was generated from
        uint128 fromBlock;

        // `value` is the amount of tokens at a specific block number
        uint128 value;
    }

    // `parentToken` is the Token address that was cloned to produce this token;
    //  it will be 0x0 for a token that was not cloned
    MiniMeToken public parentToken;

    // `parentSnapShotBlock` is the block number from the Parent Token that was
    //  used to determine the initial distribution of the Clone Token
    uint public parentSnapShotBlock;

    // `creationBlock` is the block number that the Clone Token was created
    uint public creationBlock;

    // `balances` is the map that tracks the balance of each address, in this
    //  contract when the balance changes the block number that the change
    //  occurred is also included in the map
    mapping (address => Checkpoint[]) balances;

    // `allowed` tracks any extra transfer rights as in all ERC20 tokens
    mapping (address => mapping (address => uint256)) allowed;

    // Tracks the history of the `totalSupply` of the token
    Checkpoint[] totalSupplyHistory;

    // Flag that determines if the token is transferable or not.
    bool public transfersEnabled;

    // The factory used to create new clone tokens
    MiniMeTokenFactory public tokenFactory;

////////////////
// Constructor
////////////////

    /// @notice Constructor to create a MiniMeToken
    /// @param _tokenFactory The address of the MiniMeTokenFactory contract that
    ///  will create the Clone token contracts, the token factory needs to be
    ///  deployed first
    /// @param _parentToken Address of the parent token, set to 0x0 if it is a
    ///  new token
    /// @param _parentSnapShotBlock Block of the parent token that will
    ///  determine the initial distribution of the clone token, set to 0 if it
    ///  is a new token
    /// @param _tokenName Name of the new token
    /// @param _decimalUnits Number of decimals of the new token
    /// @param _tokenSymbol Token Symbol for the new token
    /// @param _transfersEnabled If true, tokens will be able to be transferred
    function MiniMeToken(
        address _tokenFactory,
        address _parentToken,
        uint _parentSnapShotBlock,
        string _tokenName,
        uint8 _decimalUnits,
        string _tokenSymbol,
        bool _transfersEnabled
    ) public {__FunctionCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',1);

__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',95);
         __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',1);
tokenFactory = MiniMeTokenFactory(_tokenFactory);
__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',96);
         __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',2);
name = _tokenName;                                 // Set the name
__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',97);
         __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',3);
decimals = _decimalUnits;                          // Set the decimals
__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',98);
         __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',4);
symbol = _tokenSymbol;                             // Set the symbol
__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',99);
         __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',5);
parentToken = MiniMeToken(_parentToken);
__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',100);
         __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',6);
parentSnapShotBlock = _parentSnapShotBlock;
__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',101);
         __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',7);
transfersEnabled = _transfersEnabled;
__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',102);
         __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',8);
creationBlock = block.number;
    }


///////////////////
// ERC20 Methods
///////////////////

    /// @notice Send `_amount` tokens to `_to` from `msg.sender`
    /// @param _to The address of the recipient
    /// @param _amount The amount of tokens to be transferred
    /// @return Whether the transfer was successful or not
    function transfer(address _to, uint256 _amount) public returns (bool success) {__FunctionCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',2);

__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',115);
        __AssertPreCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',1);
 __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',9);
require(transfersEnabled);__AssertPostCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',1);

__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',116);
         __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',10);
return doTransfer(msg.sender, _to, _amount);
    }

    /// @notice Send `_amount` tokens to `_to` from `_from` on the condition it
    ///  is approved by `_from`
    /// @param _from The address holding the tokens being transferred
    /// @param _to The address of the recipient
    /// @param _amount The amount of tokens to be transferred
    /// @return True if the transfer was successful
    function transferFrom(address _from, address _to, uint256 _amount
    ) public returns (bool success) {__FunctionCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',3);


        // The controller of this contract can move tokens around at will,
        //  this is important to recognize! Confirm that you trust the
        //  controller of this contract, which in most situations should be
        //  another open source smart contract or 0x0
__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',132);
         __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',11);
if (msg.sender != controller) {__BranchCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',2,0);
__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',133);
            __AssertPreCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',3);
 __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',12);
require(transfersEnabled);__AssertPostCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',3);


            // The standard ERC 20 transferFrom functionality
__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',136);
             __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',13);
if (allowed[_from][msg.sender] < _amount) { __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',14);
__BranchCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',4,0);return false;}else { __BranchCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',4,1);}

__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',137);
             __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',15);
allowed[_from][msg.sender] -= _amount;
        }else { __BranchCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',2,1);}

__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',139);
         __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',16);
return doTransfer(_from, _to, _amount);
    }

    /// @dev This is the actual transfer function in the token contract, it can
    ///  only be called by other functions in this contract.
    /// @param _from The address holding the tokens being transferred
    /// @param _to The address of the recipient
    /// @param _amount The amount of tokens to be transferred
    /// @return True if the transfer was successful
    function doTransfer(address _from, address _to, uint _amount
    ) internal returns(bool) {__FunctionCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',4);


__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',151);
            __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',17);
if (_amount == 0) {__BranchCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',5,0);
__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',152);
                __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',18);
return true;
           }else { __BranchCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',5,1);}


__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',155);
           __AssertPreCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',6);
 __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',19);
require(parentSnapShotBlock < block.number);__AssertPostCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',6);


           // Do not allow transfer to 0x0 or the token contract itself
__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',158);
           __AssertPreCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',7);
 __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',20);
require((_to != 0) && (_to != address(this)));__AssertPostCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',7);


           // If the amount being transfered is more than the balance of the
           //  account the transfer returns false
__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',162);
            __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',21);
var previousBalanceFrom = balanceOfAt(_from, block.number);
__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',163);
            __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',22);
if (previousBalanceFrom < _amount) {__BranchCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',8,0);
__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',164);
                __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',23);
return false;
           }else { __BranchCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',8,1);}


           // Alerts the token controller of the transfer
__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',168);
            __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',24);
if (isContract(controller)) {__BranchCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',9,0);
__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',169);
               __AssertPreCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',10);
 __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',25);
require(TokenController(controller).onTransfer(_from, _to, _amount));__AssertPostCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',10);

           }else { __BranchCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',9,1);}


           // First update the balance array with the new value for the address
           //  sending the tokens
__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',174);
            __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',26);
updateValueAtNow(balances[_from], previousBalanceFrom - _amount);

           // Then update the balance array with the new value for the address
           //  receiving the tokens
__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',178);
            __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',27);
var previousBalanceTo = balanceOfAt(_to, block.number);
__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',179);
           __AssertPreCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',11);
 __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',28);
require(previousBalanceTo + _amount >= previousBalanceTo);__AssertPostCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',11);
 // Check for overflow
__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',180);
            __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',29);
updateValueAtNow(balances[_to], previousBalanceTo + _amount);

           // An event to make the transfer easy to find on the blockchain
__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',183);
            __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',30);
Transfer(_from, _to, _amount);

__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',185);
            __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',31);
return true;
    }

    /// @param _owner The address that's balance is being requested
    /// @return The balance of `_owner` at the current block
    function balanceOf(address _owner) public  returns (uint256 balance) {__FunctionCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',5);

__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',191);
         __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',32);
return balanceOfAt(_owner, block.number);
    }

    /// @notice `msg.sender` approves `_spender` to spend `_amount` tokens on
    ///  its behalf. This is a modified version of the ERC20 approve function
    ///  to be a little bit safer
    /// @param _spender The address of the account able to transfer the tokens
    /// @param _amount The amount of tokens to be approved for transfer
    /// @return True if the approval was successful
    function approve(address _spender, uint256 _amount) public returns (bool success) {__FunctionCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',6);

__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',201);
        __AssertPreCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',12);
 __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',33);
require(transfersEnabled);__AssertPostCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',12);


        // To change the approve amount you first have to reduce the addresses`
        //  allowance to zero by calling `approve(_spender,0)` if it is not
        //  already 0 to mitigate the race condition described here:
        //  https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',207);
        __AssertPreCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',13);
 __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',34);
require((_amount == 0) || (allowed[msg.sender][_spender] == 0));__AssertPostCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',13);


        // Alerts the token controller of the approve function call
__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',210);
         __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',35);
if (isContract(controller)) {__BranchCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',14,0);
__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',211);
            __AssertPreCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',15);
 __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',36);
require(TokenController(controller).onApprove(msg.sender, _spender, _amount));__AssertPostCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',15);

        }else { __BranchCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',14,1);}


__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',214);
         __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',37);
allowed[msg.sender][_spender] = _amount;
__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',215);
         __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',38);
Approval(msg.sender, _spender, _amount);
__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',216);
         __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',39);
return true;
    }

    /// @dev This function makes it easy to read the `allowed[]` map
    /// @param _owner The address of the account that owns the token
    /// @param _spender The address of the account able to transfer the tokens
    /// @return Amount of remaining tokens of _owner that _spender is allowed
    ///  to spend
    function allowance(address _owner, address _spender
    ) public  returns (uint256 remaining) {__FunctionCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',7);

__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',226);
         __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',40);
return allowed[_owner][_spender];
    }

    /// @notice `msg.sender` approves `_spender` to send `_amount` tokens on
    ///  its behalf, and then a function is triggered in the contract that is
    ///  being approved, `_spender`. This allows users to use their tokens to
    ///  interact with contracts in one function call instead of two
    /// @param _spender The address of the contract able to transfer the tokens
    /// @param _amount The amount of tokens to be approved for transfer
    /// @return True if the function call was successful
    function approveAndCall(address _spender, uint256 _amount, bytes _extraData
    ) public returns (bool success) {__FunctionCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',8);

__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',238);
        __AssertPreCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',16);
 __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',41);
require(approve(_spender, _amount));__AssertPostCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',16);


__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',240);
         __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',42);
ApproveAndCallFallBack(_spender).receiveApproval(
            msg.sender,
            _amount,
            this,
            _extraData
        );

__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',247);
         __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',43);
return true;
    }

    /// @dev This function makes it easy to get the total number of tokens
    /// @return The total number of tokens
    function totalSupply() public  returns (uint) {__FunctionCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',9);

__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',253);
         __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',44);
return totalSupplyAt(block.number);
    }


////////////////
// Query balance and totalSupply in History
////////////////

    /// @dev Queries the balance of `_owner` at a specific `_blockNumber`
    /// @param _owner The address from which the balance will be retrieved
    /// @param _blockNumber The block number when the balance is queried
    /// @return The balance at `_blockNumber`
    function balanceOfAt(address _owner, uint _blockNumber) public 
        returns (uint) {__FunctionCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',10);


        // These next few lines are used when the balance of the token is
        //  requested before a check point was ever created for this token, it
        //  requires that the `parentToken.balanceOfAt` be queried at the
        //  genesis block for that token as this contains initial balance of
        //  this token
__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',273);
         __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',45);
if ((balances[_owner].length == 0)
            || (balances[_owner][0].fromBlock > _blockNumber)) {__BranchCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',17,0);
__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',275);
             __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',46);
if (address(parentToken) != 0) {__BranchCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',18,0);
__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',276);
                 __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',47);
return parentToken.balanceOfAt(_owner, min(_blockNumber, parentSnapShotBlock));
            } else {__BranchCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',18,1);
                // Has no parent
__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',279);
                 __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',48);
return 0;
            }

        // This will return the expected balance during normal situations
        } else {__BranchCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',17,1);
__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',284);
             __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',49);
return getValueAt(balances[_owner], _blockNumber);
        }
    }

    /// @notice Total amount of tokens at a specific `_blockNumber`.
    /// @param _blockNumber The block number when the totalSupply is queried
    /// @return The total amount of tokens at `_blockNumber`
    function totalSupplyAt(uint _blockNumber) public  returns(uint) {__FunctionCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',11);


        // These next few lines are used when the totalSupply of the token is
        //  requested before a check point was ever created for this token, it
        //  requires that the `parentToken.totalSupplyAt` be queried at the
        //  genesis block for this token as that contains totalSupply of this
        //  token at this block number.
__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',298);
         __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',50);
if ((totalSupplyHistory.length == 0)
            || (totalSupplyHistory[0].fromBlock > _blockNumber)) {__BranchCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',19,0);
__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',300);
             __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',51);
if (address(parentToken) != 0) {__BranchCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',20,0);
__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',301);
                 __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',52);
return parentToken.totalSupplyAt(min(_blockNumber, parentSnapShotBlock));
            } else {__BranchCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',20,1);
__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',303);
                 __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',53);
return 0;
            }

        // This will return the expected totalSupply during normal situations
        } else {__BranchCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',19,1);
__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',308);
             __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',54);
return getValueAt(totalSupplyHistory, _blockNumber);
        }
    }

////////////////
// Clone Token Method
////////////////

    /// @notice Creates a new clone token with the initial distribution being
    ///  this token at `_snapshotBlock`
    /// @param _cloneTokenName Name of the clone token
    /// @param _cloneDecimalUnits Number of decimals of the smallest unit
    /// @param _cloneTokenSymbol Symbol of the clone token
    /// @param _snapshotBlock Block when the distribution of the parent token is
    ///  copied to set the initial distribution of the new clone token;
    ///  if the block is zero than the actual block, the current block is used
    /// @param _transfersEnabled True if transfers are allowed in the clone
    /// @return The address of the new MiniMeToken Contract
    function createCloneToken(
        string _cloneTokenName,
        uint8 _cloneDecimalUnits,
        string _cloneTokenSymbol,
        uint _snapshotBlock,
        bool _transfersEnabled
    ) public returns(address) {__FunctionCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',12);

__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',333);
         __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',55);
if (_snapshotBlock == 0) { __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',56);
__BranchCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',21,0);_snapshotBlock = block.number;}else { __BranchCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',21,1);}

__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',334);
         __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',57);
MiniMeToken cloneToken = tokenFactory.createCloneToken(
            this,
            _snapshotBlock,
            _cloneTokenName,
            _cloneDecimalUnits,
            _cloneTokenSymbol,
            _transfersEnabled
            );

__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',343);
        cloneToken.changeController(msg.sender);

        // An event to make the token easy to find on the blockchain
__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',346);
         __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',58);
NewCloneToken(address(cloneToken), _snapshotBlock);
__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',347);
         __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',59);
return address(cloneToken);
    }

////////////////
// Generate and destroy tokens
////////////////

    /// @notice Generates `_amount` tokens that are assigned to `_owner`
    /// @param _owner The address that will be assigned the new tokens
    /// @param _amount The quantity of tokens generated
    /// @return True if the tokens are generated correctly
    function generateTokens(address _owner, uint _amount
    ) public onlyController returns (bool) {__FunctionCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',13);

__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',360);
         __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',60);
uint curTotalSupply = totalSupply();
__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',361);
        __AssertPreCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',22);
 __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',61);
require(curTotalSupply + _amount >= curTotalSupply);__AssertPostCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',22);
 // Check for overflow
__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',362);
         __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',62);
uint previousBalanceTo = balanceOf(_owner);
__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',363);
        __AssertPreCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',23);
 __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',63);
require(previousBalanceTo + _amount >= previousBalanceTo);__AssertPostCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',23);
 // Check for overflow
__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',364);
         __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',64);
updateValueAtNow(totalSupplyHistory, curTotalSupply + _amount);
__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',365);
         __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',65);
updateValueAtNow(balances[_owner], previousBalanceTo + _amount);
__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',366);
         __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',66);
Transfer(0, _owner, _amount);
__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',367);
         __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',67);
return true;
    }


    /// @notice Burns `_amount` tokens from `_owner`
    /// @param _owner The address that will lose the tokens
    /// @param _amount The quantity of tokens to burn
    /// @return True if the tokens are burned correctly
    function destroyTokens(address _owner, uint _amount
    ) onlyController public returns (bool) {__FunctionCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',14);

__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',377);
         __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',68);
uint curTotalSupply = totalSupply();
__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',378);
        __AssertPreCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',24);
 __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',69);
require(curTotalSupply >= _amount);__AssertPostCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',24);

__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',379);
         __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',70);
uint previousBalanceFrom = balanceOf(_owner);
__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',380);
        __AssertPreCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',25);
 __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',71);
require(previousBalanceFrom >= _amount);__AssertPostCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',25);

__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',381);
         __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',72);
updateValueAtNow(totalSupplyHistory, curTotalSupply - _amount);
__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',382);
         __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',73);
updateValueAtNow(balances[_owner], previousBalanceFrom - _amount);
__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',383);
         __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',74);
Transfer(_owner, 0, _amount);
__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',384);
         __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',75);
return true;
    }

////////////////
// Enable tokens transfers
////////////////


    /// @notice Enables token holders to transfer their tokens freely if true
    /// @param _transfersEnabled True if transfers are allowed in the clone
    function enableTransfers(bool _transfersEnabled) public onlyController {__FunctionCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',15);

__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',395);
         __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',76);
transfersEnabled = _transfersEnabled;
    }

////////////////
// Internal helper functions to query and set a value in a snapshot array
////////////////

    /// @dev `getValueAt` retrieves the number of tokens at a given block number
    /// @param checkpoints The history of values being queried
    /// @param _block The block number to retrieve the value at
    /// @return The number of tokens being queried
    function getValueAt(Checkpoint[] storage checkpoints, uint _block
    )  internal returns (uint) {__FunctionCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',16);

__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',408);
         __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',77);
if (checkpoints.length == 0) { __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',78);
__BranchCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',26,0);return 0;}else { __BranchCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',26,1);}


        // Shortcut for the actual value
__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',411);
         __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',79);
if (_block >= checkpoints[checkpoints.length-1].fromBlock)
            { __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',80);
__BranchCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',27,0);__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',412);
return checkpoints[checkpoints.length-1].value;}else { __BranchCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',27,1);}

__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',413);
         __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',81);
if (_block < checkpoints[0].fromBlock) { __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',82);
__BranchCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',28,0);return 0;}else { __BranchCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',28,1);}


        // Binary search of the value in the array
__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',416);
         __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',83);
uint min = 0;
__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',417);
         __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',84);
uint max = checkpoints.length-1;
__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',418);
         __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',85);
while (max > min) {
__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',419);
             __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',86);
uint mid = (max + min + 1)/ 2;
__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',420);
             __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',87);
if (checkpoints[mid].fromBlock<=_block) {__BranchCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',29,0);
__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',421);
                 __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',88);
min = mid;
            } else {__BranchCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',29,1);
__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',423);
                 __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',89);
max = mid-1;
            }
        }
__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',426);
         __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',90);
return checkpoints[min].value;
    }

    /// @dev `updateValueAtNow` used to update the `balances` map and the
    ///  `totalSupplyHistory`
    /// @param checkpoints The history of data being updated
    /// @param _value The new number of tokens
    function updateValueAtNow(Checkpoint[] storage checkpoints, uint _value
    ) internal  {__FunctionCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',17);

__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',435);
         __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',91);
if ((checkpoints.length == 0)
        || (checkpoints[checkpoints.length -1].fromBlock < block.number)) {__BranchCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',30,0);
__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',437);
                __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',92);
Checkpoint storage newCheckPoint = checkpoints[ checkpoints.length++ ];
__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',438);
                __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',93);
newCheckPoint.fromBlock =  uint128(block.number);
__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',439);
                __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',94);
newCheckPoint.value = uint128(_value);
           } else {__BranchCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',30,1);
__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',441);
                __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',95);
Checkpoint storage oldCheckPoint = checkpoints[checkpoints.length-1];
__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',442);
                __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',96);
oldCheckPoint.value = uint128(_value);
           }
    }

    /// @dev Internal function to determine if an address is a contract
    /// @param _addr The address being queried
    /// @return True if `_addr` is a contract
    function isContract(address _addr)  internal returns(bool) {__FunctionCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',18);

__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',450);
        uint size;
__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',451);
         __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',97);
if (_addr == 0) { __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',98);
__BranchCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',31,0);return false;}else { __BranchCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',31,1);}

__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',452);
        assembly {
            size := extcodesize(_addr)
        }
__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',455);
         __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',99);
return size>0;
    }

    /// @dev Helper function to return a min betwen the two uints
    function min(uint a, uint b)  internal returns (uint) {__FunctionCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',19);

__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',460);
         __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',100);
return a < b ? a : b;
    }

    /// @notice The fallback function: If the contract's controller has not been
    ///  set to 0, then the `proxyPayment` method is called which relays the
    ///  ether and creates tokens as described in the token controller contract
    function () public payable {__FunctionCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',20);

__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',467);
        __AssertPreCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',32);
 __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',101);
require(isContract(controller));__AssertPostCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',32);

__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',468);
        __AssertPreCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',33);
 __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',102);
require(TokenController(controller).proxyPayment.value(msg.value)(msg.sender));__AssertPostCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',33);

    }

//////////
// Safety Methods
//////////

    /// @notice This method can be used by the controller to extract mistakenly
    ///  sent tokens to this contract.
    /// @param _token The address of the token contract that you want to recover
    ///  set to 0 in case you want to extract ether.
    function claimTokens(address _token) public onlyController {__FunctionCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',21);

__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',480);
         __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',103);
if (_token == 0x0) {__BranchCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',34,0);
__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',481);
            controller.transfer(this.balance);
__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',482);
             __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',104);
return;
        }else { __BranchCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',34,1);}


__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',485);
         __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',105);
MiniMeToken token = MiniMeToken(_token);
__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',486);
         __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',106);
uint balance = token.balanceOf(this);
__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',487);
        token.transfer(controller, balance);
__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',488);
         __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',107);
ClaimedTokens(_token, controller, balance);
    }

////////////////
// Events
////////////////
    event ClaimedTokens(address indexed _token, address indexed _controller, uint _amount);
    event Transfer(address indexed _from, address indexed _to, uint256 _amount);
    event NewCloneToken(address indexed _cloneToken, uint _snapshotBlock);
    event Approval(address indexed _owner, address indexed _spender, uint256 _amount);

}


////////////////
// MiniMeTokenFactory
////////////////

/// @dev This contract is used to generate clone contracts from a contract.
///  In solidity this is the way to create a contract from a contract of the
///  same class
contract MiniMeTokenFactory {event __CoverageApproveAndCallFallBack(string fileName, uint256 lineNumber);
event __FunctionCoverageApproveAndCallFallBack(string fileName, uint256 fnId);
event __StatementCoverageApproveAndCallFallBack(string fileName, uint256 statementId);
event __BranchCoverageApproveAndCallFallBack(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageApproveAndCallFallBack(string fileName, uint256 branchId);
event __AssertPostCoverageApproveAndCallFallBack(string fileName, uint256 branchId);


    /// @notice Update the DApp by creating a new token with new functionalities
    ///  the msg.sender becomes the controller of this clone token
    /// @param _parentToken Address of the token being cloned
    /// @param _snapshotBlock Block of the parent token that will
    ///  determine the initial distribution of the clone token
    /// @param _tokenName Name of the new token
    /// @param _decimalUnits Number of decimals of the new token
    /// @param _tokenSymbol Token Symbol for the new token
    /// @param _transfersEnabled If true, tokens will be able to be transferred
    /// @return The address of the new token contract
    function createCloneToken(
        address _parentToken,
        uint _snapshotBlock,
        string _tokenName,
        uint8 _decimalUnits,
        string _tokenSymbol,
        bool _transfersEnabled
    ) public returns (MiniMeToken) {__FunctionCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',22);

__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',529);
         __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',108);
MiniMeToken newToken = new MiniMeToken(
            this,
            _parentToken,
            _snapshotBlock,
            _tokenName,
            _decimalUnits,
            _tokenSymbol,
            _transfersEnabled
            );

__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',539);
        newToken.changeController(msg.sender);
__CoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',540);
         __StatementCoverageApproveAndCallFallBack('/Users/tikonoff/projects/etheal-contracts/contracts/MiniMeToken.sol',109);
return newToken;
    }
}