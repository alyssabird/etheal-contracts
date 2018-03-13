pragma solidity ^0.4.17;

import './TokenController.sol';
import './SafeMath.sol';
import './Ownable.sol';

/**
 * @title Hodler
 * @dev Handles hodler reward, TokenController should create and own it.
 */
contract Hodler is Ownable {event __CoverageHodler(string fileName, uint256 lineNumber);
event __FunctionCoverageHodler(string fileName, uint256 fnId);
event __StatementCoverageHodler(string fileName, uint256 statementId);
event __BranchCoverageHodler(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageHodler(string fileName, uint256 branchId);
event __AssertPostCoverageHodler(string fileName, uint256 branchId);

    using SafeMath for uint;

    // HODLER reward tracker
    // stake amount per address
    struct HODL {
        uint256 stake;
        // moving ANY funds invalidates hodling of the address
        bool invalid;
        bool claimed3M;
        bool claimed6M;
        bool claimed9M;
    }

    mapping (address => HODL) public hodlerStakes;

    // total current staking value and hodler addresses
    uint256 public hodlerTotalValue;
    uint256 public hodlerTotalCount;

    // store dates and total stake values for 3 - 6 - 9 months after normal sale
    uint256 public hodlerTotalValue3M;
    uint256 public hodlerTotalValue6M;
    uint256 public hodlerTotalValue9M;
    uint256 public hodlerTimeStart;
    uint256 public hodlerTime3M;
    uint256 public hodlerTime6M;
    uint256 public hodlerTime9M;

    // reward HEAL token amount
    uint256 public TOKEN_HODL_3M;
    uint256 public TOKEN_HODL_6M;
    uint256 public TOKEN_HODL_9M;

    // total amount of tokens claimed so far
    uint256 public claimedTokens;

    
    event LogHodlSetStake(address indexed _setter, address indexed _beneficiary, uint256 _value);
    event LogHodlClaimed(address indexed _setter, address indexed _beneficiary, uint256 _value);
    event LogHodlStartSet(address indexed _setter, uint256 _time);


    /// @dev Only before hodl is started
    modifier beforeHodlStart() {__FunctionCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',1);

__CoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',56);
         __StatementCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',1);
if (hodlerTimeStart == 0 || now <= hodlerTimeStart)
            {__BranchCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',1,0);__CoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',57);
_;}else { __BranchCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',1,1);}

    }

    /// @dev Contructor, it should be created by a TokenController
    function Hodler(uint256 _stake3m, uint256 _stake6m, uint256 _stake9m) {__FunctionCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',2);

__CoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',62);
         __StatementCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',2);
TOKEN_HODL_3M = _stake3m;
__CoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',63);
         __StatementCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',3);
TOKEN_HODL_6M = _stake6m;
__CoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',64);
         __StatementCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',4);
TOKEN_HODL_9M = _stake9m;
    }

    /// @notice Adding hodler stake to an account
    /// @dev Only owner contract can call it and before hodling period starts
    /// @param _beneficiary Recepient address of hodler stake
    /// @param _stake Amount of additional hodler stake
    function addHodlerStake(address _beneficiary, uint256 _stake) public onlyOwner beforeHodlStart {__FunctionCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',3);

        // real change and valid _beneficiary is needed
__CoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',73);
         __StatementCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',5);
if (_stake == 0 || _beneficiary == address(0))
            { __StatementCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',6);
__BranchCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',2,0);__CoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',74);
return;}else { __BranchCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',2,1);}

        
        // add stake and maintain count
__CoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',77);
         __StatementCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',7);
if (hodlerStakes[_beneficiary].stake == 0)
            { __StatementCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',8);
__BranchCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',3,0);__CoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',78);
hodlerTotalCount = hodlerTotalCount.add(1);}else { __BranchCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',3,1);}


__CoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',80);
         __StatementCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',9);
hodlerStakes[_beneficiary].stake = hodlerStakes[_beneficiary].stake.add(_stake);

__CoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',82);
         __StatementCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',10);
hodlerTotalValue = hodlerTotalValue.add(_stake);

__CoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',84);
         __StatementCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',11);
LogHodlSetStake(msg.sender, _beneficiary, hodlerStakes[_beneficiary].stake);
    }

    /// @notice Setting hodler stake of an account
    /// @dev Only owner contract can call it and before hodling period starts
    /// @param _beneficiary Recepient address of hodler stake
    /// @param _stake Amount to set the hodler stake
    function setHodlerStake(address _beneficiary, uint256 _stake) public onlyOwner beforeHodlStart {__FunctionCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',4);

        // real change and valid _beneficiary is needed
__CoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',93);
         __StatementCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',12);
if (hodlerStakes[_beneficiary].stake == _stake || _beneficiary == address(0))
            { __StatementCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',13);
__BranchCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',4,0);__CoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',94);
return;}else { __BranchCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',4,1);}

        
        // add stake and maintain count
__CoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',97);
         __StatementCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',14);
if (hodlerStakes[_beneficiary].stake == 0 && _stake > 0) {__BranchCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',5,0);
__CoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',98);
             __StatementCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',15);
hodlerTotalCount = hodlerTotalCount.add(1);
        } else { __StatementCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',16);
__BranchCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',5,1);if (hodlerStakes[_beneficiary].stake > 0 && _stake == 0) {__BranchCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',6,0);
__CoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',100);
             __StatementCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',17);
hodlerTotalCount = hodlerTotalCount.sub(1);
        }else { __BranchCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',6,1);}
}

__CoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',103);
         __StatementCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',18);
uint256 _diff; (,_diff) = _stake > hodlerStakes[_beneficiary].stake ? (__BranchCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',7,0),_stake.sub(hodlerStakes[_beneficiary].stake)) : (__BranchCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',7,1),hodlerStakes[_beneficiary].stake.sub(_stake));
__CoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',104);
         __StatementCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',19);
if (_stake > hodlerStakes[_beneficiary].stake) {__BranchCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',8,0);
__CoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',105);
             __StatementCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',20);
hodlerTotalValue = hodlerTotalValue.add(_diff);
        } else {__BranchCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',8,1);
__CoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',107);
             __StatementCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',21);
hodlerTotalValue = hodlerTotalValue.sub(_diff);
        }
__CoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',109);
         __StatementCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',22);
hodlerStakes[_beneficiary].stake = _stake;

__CoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',111);
         __StatementCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',23);
LogHodlSetStake(msg.sender, _beneficiary, _stake);
    }

    /// @notice Setting hodler start period.
    /// @param _time The time when hodler reward starts counting
    function setHodlerTime(uint256 _time) public onlyOwner beforeHodlStart {__FunctionCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',5);

__CoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',117);
        __AssertPreCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',9);
 __StatementCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',24);
require(_time >= now);__AssertPostCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',9);


__CoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',119);
         __StatementCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',25);
hodlerTimeStart = _time;
__CoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',120);
         __StatementCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',26);
hodlerTime3M = _time.add(90 days);
__CoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',121);
         __StatementCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',27);
hodlerTime6M = _time.add(180 days);
__CoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',122);
         __StatementCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',28);
hodlerTime9M = _time.add(270 days);

__CoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',124);
         __StatementCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',29);
LogHodlStartSet(msg.sender, _time);
    }

    /// @notice Invalidates hodler account 
    /// @dev Gets called by EthealController#onTransfer before every transaction
    function invalidate(address _account) public onlyOwner {__FunctionCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',6);

__CoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',130);
         __StatementCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',30);
if (hodlerStakes[_account].stake > 0 && !hodlerStakes[_account].invalid) {__BranchCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',10,0);
__CoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',131);
             __StatementCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',31);
hodlerStakes[_account].invalid = true;
__CoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',132);
             __StatementCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',32);
hodlerTotalValue = hodlerTotalValue.sub(hodlerStakes[_account].stake);
__CoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',133);
             __StatementCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',33);
hodlerTotalCount = hodlerTotalCount.sub(1);
        }else { __BranchCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',10,1);}


        // update hodl total values "automatically" - whenever someone sends funds thus
__CoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',137);
         __StatementCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',34);
updateAndGetHodlTotalValue();
    }

    /// @notice Claiming HODL reward for msg.sender
    function claimHodlReward() public {__FunctionCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',7);

__CoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',142);
         __StatementCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',35);
claimHodlRewardFor(msg.sender);
    }

    /// @notice Claiming HODL reward for an address
    function claimHodlRewardFor(address _beneficiary) public {__FunctionCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',8);

        // only when the address has a valid stake
__CoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',148);
        __AssertPreCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',11);
 __StatementCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',36);
require(hodlerStakes[_beneficiary].stake > 0 && !hodlerStakes[_beneficiary].invalid);__AssertPostCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',11);


__CoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',150);
         __StatementCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',37);
uint256 _stake = 0;
        
        // update hodl total values
__CoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',153);
         __StatementCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',38);
updateAndGetHodlTotalValue();

        // claim hodl if not claimed
__CoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',156);
         __StatementCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',39);
if (!hodlerStakes[_beneficiary].claimed3M && now >= hodlerTime3M) {__BranchCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',12,0);
__CoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',157);
             __StatementCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',40);
_stake = _stake.add(hodlerStakes[_beneficiary].stake.mul(TOKEN_HODL_3M).div(hodlerTotalValue3M));
__CoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',158);
             __StatementCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',41);
hodlerStakes[_beneficiary].claimed3M = true;
        }else { __BranchCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',12,1);}

__CoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',160);
         __StatementCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',42);
if (!hodlerStakes[_beneficiary].claimed6M && now >= hodlerTime6M) {__BranchCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',13,0);
__CoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',161);
             __StatementCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',43);
_stake = _stake.add(hodlerStakes[_beneficiary].stake.mul(TOKEN_HODL_6M).div(hodlerTotalValue6M));
__CoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',162);
             __StatementCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',44);
hodlerStakes[_beneficiary].claimed6M = true;
        }else { __BranchCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',13,1);}

__CoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',164);
         __StatementCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',45);
if (!hodlerStakes[_beneficiary].claimed9M && now >= hodlerTime9M) {__BranchCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',14,0);
__CoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',165);
             __StatementCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',46);
_stake = _stake.add(hodlerStakes[_beneficiary].stake.mul(TOKEN_HODL_9M).div(hodlerTotalValue9M));
__CoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',166);
             __StatementCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',47);
hodlerStakes[_beneficiary].claimed9M = true;
        }else { __BranchCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',14,1);}


__CoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',169);
         __StatementCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',48);
if (_stake > 0) {__BranchCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',15,0);
            // increasing claimed tokens
__CoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',171);
             __StatementCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',49);
claimedTokens = claimedTokens.add(_stake);

            // transferring tokens
__CoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',174);
            __AssertPreCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',16);
 __StatementCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',50);
require(TokenController(owner).ethealToken().transfer(_beneficiary, _stake));__AssertPostCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',16);


            // log
__CoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',177);
             __StatementCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',51);
LogHodlClaimed(msg.sender, _beneficiary, _stake);
        }else { __BranchCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',15,1);}

    }

    /// @notice claimHodlRewardFor() for multiple addresses
    /// @dev Anyone can call this function and distribute hodl rewards
    /// @param _beneficiaries Array of addresses for which we want to claim hodl rewards
    function claimHodlRewardsFor(address[] _beneficiaries) external {__FunctionCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',9);

__CoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',185);
         __StatementCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',52);
for (uint256 i = 0; i < _beneficiaries.length; i++)
            { __StatementCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',53);
__CoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',186);
claimHodlRewardFor(_beneficiaries[i]);}
    }

    /// @notice Setting 3 - 6 - 9 months total staking hodl value if time is come
    function updateAndGetHodlTotalValue() public returns (uint) {__FunctionCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',10);

__CoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',191);
         __StatementCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',54);
if (now >= hodlerTime3M && hodlerTotalValue3M == 0) {__BranchCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',17,0);
__CoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',192);
             __StatementCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',55);
hodlerTotalValue3M = hodlerTotalValue;
        }else { __BranchCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',17,1);}


__CoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',195);
         __StatementCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',56);
if (now >= hodlerTime6M && hodlerTotalValue6M == 0) {__BranchCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',18,0);
__CoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',196);
             __StatementCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',57);
hodlerTotalValue6M = hodlerTotalValue;
        }else { __BranchCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',18,1);}


__CoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',199);
         __StatementCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',58);
if (now >= hodlerTime9M && hodlerTotalValue9M == 0) {__BranchCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',19,0);
__CoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',200);
             __StatementCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',59);
hodlerTotalValue9M = hodlerTotalValue;

            // since we can transfer more tokens to this contract, make it possible to retain more than the predefined limit
__CoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',203);
             __StatementCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',60);
TOKEN_HODL_9M = TokenController(owner).ethealToken().balanceOf(this).sub(TOKEN_HODL_3M).sub(TOKEN_HODL_6M).add(claimedTokens);
        }else { __BranchCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',19,1);}


__CoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',206);
         __StatementCoverageHodler('/Users/tikonoff/projects/etheal-contracts/contracts/Hodler.sol',61);
return hodlerTotalValue;
    }
}