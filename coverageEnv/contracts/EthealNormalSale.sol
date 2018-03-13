pragma solidity ^0.4.17;

import "./ERC20MiniMe.sol";
import "./CappedCrowdsale.sol";
import "./TokenController.sol";
import "./FinalizableCrowdsale.sol";
import "./Pausable.sol";
import "./EthealWhitelist.sol";

/**
 * @title EthealNormalSale
 * @author thesved
 * @notice Etheal Token Sale contract, with softcap and hardcap (cap)
 * @dev This contract has to be finalized before token claims are enabled
 */
contract EthealNormalSale is Pausable, FinalizableCrowdsale, CappedCrowdsale {event __CoverageEthealNormalSale(string fileName, uint256 lineNumber);
event __FunctionCoverageEthealNormalSale(string fileName, uint256 fnId);
event __StatementCoverageEthealNormalSale(string fileName, uint256 statementId);
event __BranchCoverageEthealNormalSale(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageEthealNormalSale(string fileName, uint256 branchId);
event __AssertPostCoverageEthealNormalSale(string fileName, uint256 branchId);

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
    {__FunctionCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',1);

        // ethealController must be valid
__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',91);
        __AssertPreCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',1);
 __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',1);
require(_ethealController != address(0));__AssertPostCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',1);

__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',92);
         __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',2);
ethealController = TokenController(_ethealController);

        // caps have to be consistent with each other
__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',95);
        __AssertPreCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',2);
 __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',3);
require(_softCap <= _cap);__AssertPostCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',2);

__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',96);
         __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',4);
softCap = _softCap;
__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',97);
         __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',5);
softCapTime = _softCapTime;

        // this is needed since super constructor wont overwite overriden variables
__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',100);
         __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',6);
cap = _cap;
__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',101);
         __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',7);
rate = _rate;

__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',103);
         __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',8);
minContribution = _minContribution;
    }

    ////////////////
    // Administer contract details
    ////////////////

    /// @notice Sets min contribution
    function setMinContribution(uint256 _minContribution) public onlyOwner {__FunctionCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',2);

__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',112);
         __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',9);
minContribution = _minContribution;
    }

    /// @notice Sets soft cap and max cap
    function setCaps(uint256 _softCap, uint256 _softCapTime, uint256 _cap) public onlyOwner {__FunctionCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',3);

__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',117);
        __AssertPreCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',3);
 __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',10);
require(_softCap <= _cap);__AssertPostCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',3);

__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',118);
         __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',11);
softCap = _softCap;
__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',119);
         __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',12);
softCapTime = _softCapTime;
__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',120);
         __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',13);
cap = _cap;
    }

    /// @notice Sets crowdsale start and end time
    function setTimes(uint256 _startTime, uint256 _endTime) public onlyOwner {__FunctionCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',4);

__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',125);
        __AssertPreCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',4);
 __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',14);
require(_startTime <= _endTime);__AssertPostCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',4);

__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',126);
         __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',15);
startTime = _startTime;
__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',127);
         __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',16);
endTime = _endTime;
    }

    /// @notice Set rate
    function setRate(uint256 _rate) public onlyOwner {__FunctionCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',5);

__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',132);
        __AssertPreCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',5);
 __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',17);
require(_rate > 0);__AssertPostCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',5);

__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',133);
         __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',18);
rate = _rate;
    }

    /// @notice Set address of promo token
    function setPromoTokenController(address _addr) public onlyOwner {__FunctionCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',6);

__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',138);
        __AssertPreCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',6);
 __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',19);
require(_addr != address(0));__AssertPostCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',6);

__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',139);
         __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',20);
promoTokenController = _addr;
    }

    /// @notice Set whitelist contract address and minimum threshold
    function setWhitelist(address _whitelist, uint256 _threshold) public onlyOwner {__FunctionCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',7);

        // if whitelist contract address is provided we set it
__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',145);
         __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',21);
if (_whitelist != address(0)) {__BranchCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',7,0);
__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',146);
             __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',22);
whitelist = EthealWhitelist(_whitelist);
        }else { __BranchCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',7,1);}

__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',148);
         __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',23);
whitelistThreshold = _threshold;
    }

    /// @notice Set deposit contract address from which it can receive money before sale
    function setDeposit(address _deposit) public onlyOwner {__FunctionCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',8);

__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',153);
         __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',24);
deposit = _deposit;
    }

    ////////////////
    // Purchase functions
    ////////////////

    /// @dev Overriding Crowdsale#buyTokens to add partial refund
    /// @param _beneficiary Beneficiary of the token purchase
    function buyTokens(address _beneficiary) public payable whenNotPaused {__FunctionCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',9);

__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',163);
         __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',25);
handlePayment(_beneficiary, msg.value, now, "");
    }

    /// @dev buying tokens for someone with offchain whitelist signature
    function buyTokens(address _beneficiary, bytes _whitelistSign) public payable whenNotPaused {__FunctionCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',10);

__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',168);
         __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',26);
handlePayment(_beneficiary, msg.value, now, _whitelistSign);
    }

    /// @dev Internal function for handling transactions with ether.
    function handlePayment(address _beneficiary, uint256 _amount, uint256 _time, bytes memory _whitelistSign) internal {__FunctionCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',11);

__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',173);
        __AssertPreCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',8);
 __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',27);
require(_beneficiary != address(0));__AssertPostCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',8);


__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',175);
         __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',28);
uint256 weiAmount = handleContribution(_beneficiary, _amount, _time, _whitelistSign);      
__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',176);
         __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',29);
forwardFunds(weiAmount);  

        // handle refund excess tokens
__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',179);
         __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',30);
uint256 refund = _amount.sub(weiAmount);
__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',180);
         __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',31);
if (refund > 0) {__BranchCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',9,0);
__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',181);
            _beneficiary.transfer(refund);
        }else { __BranchCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',9,1);}

    }

    /// @dev Handling the amount of contribution and cap logic. Internal function.
    /// @return Wei successfully contributed.
    function handleContribution(address _beneficiary, uint256 _amount, uint256 _time, bytes memory _whitelistSign) internal returns (uint256) {__FunctionCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',12);

__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',188);
        __AssertPreCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',10);
 __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',32);
require(_beneficiary != address(0));__AssertPostCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',10);


__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',190);
         __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',33);
uint256 weiToCap = howMuchCanXContributeNow(_beneficiary);
__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',191);
         __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',34);
uint256 weiAmount = uint256Min(weiToCap, _amount);

        // account the new contribution 
__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',194);
         __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',35);
transferToken(_beneficiary, weiAmount, _time, _whitelistSign);
__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',195);
         __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',36);
weiRaised = weiRaised.add(weiAmount);

        // close sale in softCapTime seconds after reaching softCap
__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',198);
         __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',37);
if (weiRaised >= softCap && softCapClose == 0) {__BranchCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',11,0);
__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',199);
             __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',38);
softCapClose = now.add(softCapTime);
__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',200);
             __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',39);
TokenSoftCapReached(uint256Min(softCapClose, endTime));
        }else { __BranchCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',11,1);}


        // event for hard cap reached
__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',204);
         __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',40);
if (weiRaised >= cap) {__BranchCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',12,0);
__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',205);
             __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',41);
TokenHardCapReached();
        }else { __BranchCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',12,1);}


__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',208);
         __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',42);
return weiAmount;
    }

    /// @dev Handling token distribution and accounting. Overriding Crowdsale#transferToken.
    /// @param _beneficiary Address of the recepient of the tokens
    /// @param _weiAmount Contribution in wei
    /// @param _time When the contribution was made
    function transferToken(address _beneficiary, uint256 _weiAmount, uint256 _time, bytes memory _whitelistSign) internal {__FunctionCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',13);

__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',216);
        __AssertPreCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',13);
 __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',43);
require(_beneficiary != address(0));__AssertPostCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',13);

__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',217);
        __AssertPreCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',14);
 __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',44);
require(validPurchase(_weiAmount));__AssertPostCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',14);


        // require whitelist above threshold
__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',220);
         __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',45);
contributions[_beneficiary] = contributions[_beneficiary].add(_weiAmount);
__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',221);
        __AssertPreCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',15);
 __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',46);
require(contributions[_beneficiary] <= whitelistThreshold 
                || whitelist.isWhitelisted(_beneficiary)
                || whitelist.isOffchainWhitelisted(_beneficiary, _whitelistSign)
        );__AssertPostCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',15);


        // calculate tokens, so we can refund excess tokens to EthealController after token sale
__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',227);
         __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',47);
uint256 _bonus = getBonus(_beneficiary, _weiAmount, _time);
__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',228);
         __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',48);
uint256 tokens = _weiAmount.mul(rate).mul(_bonus).div(100);
__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',229);
         __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',49);
tokenBalance = tokenBalance.add(tokens);

__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',231);
         __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',50);
if (stakes[_beneficiary] == 0) {__BranchCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',16,0);
__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',232);
            contributorsKeys.push(_beneficiary);
        }else { __BranchCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',16,1);}

__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',234);
         __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',51);
stakes[_beneficiary] = stakes[_beneficiary].add(tokens);

__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',236);
         __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',52);
TokenPurchase(msg.sender, _beneficiary, _weiAmount, tokens, contributorsKeys.length, weiRaised);
    }

    /// @dev Get eth deposit from Deposit contract
    function depositEth(address _beneficiary, uint256 _time, bytes _whitelistSign) public payable whenNotPaused {__FunctionCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',14);

__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',241);
        __AssertPreCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',17);
 __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',53);
require(msg.sender == deposit);__AssertPostCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',17);


__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',243);
         __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',54);
handlePayment(_beneficiary, msg.value, _time, _whitelistSign);
    }

    /// @dev Deposit from other currencies
    function depositOffchain(address _beneficiary, uint256 _amount, uint256 _time, bytes _whitelistSign) public onlyOwner whenNotPaused {__FunctionCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',15);

__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',248);
         __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',55);
handleContribution(_beneficiary, _amount, _time, _whitelistSign);
    }

    /// @dev Overriding Crowdsale#validPurchase to add min contribution logic
    /// @param _weiAmount Contribution amount in wei
    /// @return true if contribution is okay
    function validPurchase(uint256 _weiAmount) internal  returns (bool) {__FunctionCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',16);

__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',255);
         __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',56);
bool nonEnded = !hasEnded();
__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',256);
         __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',57);
bool nonZero = _weiAmount != 0;
__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',257);
         __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',58);
bool enoughContribution = _weiAmount >= minContribution;
__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',258);
         __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',59);
return nonEnded && nonZero && enoughContribution;
    }

    /// @dev Overriding Crowdsale#hasEnded to add soft cap logic
    /// @return true if crowdsale event has ended or a softCapClose time is set and passed
    function hasEnded() public  returns (bool) {__FunctionCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',17);

__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',264);
         __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',60);
return super.hasEnded() || softCapClose > 0 && now > softCapClose;
    }

    /// @dev Extending RefundableCrowdsale#finalization sending back excess tokens to ethealController
    function finalization() internal {__FunctionCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',18);

__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',269);
         __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',61);
uint256 _balance = getHealBalance();

        // saving token balance for future reference
__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',272);
         __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',62);
tokenSold = tokenBalance; 

        // send back the excess token to ethealController
__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',275);
         __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',63);
if (_balance > tokenBalance) {__BranchCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',18,0);
__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',276);
            ethealController.ethealToken().transfer(ethealController.SALE(), _balance.sub(tokenBalance));
        }else { __BranchCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',18,1);}


        // hodler stake counting starts 14 days after closing normal sale
__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',280);
        ethealController.setHodlerTime(now + 14 days);

__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',282);
        super.finalization();
    }


    ////////////////
    // AFTER token sale
    ////////////////

    /// @notice Modifier for after sale finalization
    modifier afterSale() {__FunctionCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',19);

__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',292);
        __AssertPreCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',19);
 __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',64);
require(isFinalized);__AssertPostCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',19);

__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',293);
        _;
    }

    /// @notice Claim token for msg.sender after token sale based on stake.
    function claimToken() public afterSale {__FunctionCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',20);

__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',298);
         __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',65);
claimTokenFor(msg.sender);
    }

    /// @notice Claim token after token sale based on stake.
    /// @dev Anyone can call this function and distribute tokens after successful token sale
    /// @param _beneficiary Address of the beneficiary who gets the token
    function claimTokenFor(address _beneficiary) public afterSale whenNotPaused {__FunctionCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',21);

__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',305);
         __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',66);
uint256 tokens = stakes[_beneficiary];
__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',306);
        __AssertPreCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',20);
 __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',67);
require(tokens > 0);__AssertPostCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',20);


        // set the stake 0 for beneficiary
__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',309);
         __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',68);
stakes[_beneficiary] = 0;

        // decrease tokenBalance, to make it possible to withdraw excess HEAL funds
__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',312);
         __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',69);
tokenBalance = tokenBalance.sub(tokens);

        // distribute hodlr stake
__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',315);
        ethealController.addHodlerStake(_beneficiary, tokens);

        // distribute token
__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',318);
        __AssertPreCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',21);
 __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',70);
require(ethealController.ethealToken().transfer(_beneficiary, tokens));__AssertPostCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',21);

__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',319);
         __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',71);
TokenClaimed(msg.sender, _beneficiary, tokens);
    }

    /// @notice claimToken() for multiple addresses
    /// @dev Anyone can call this function and distribute tokens after successful token sale
    /// @param _beneficiaries Array of addresses for which we want to claim tokens
    function claimManyTokenFor(address[] _beneficiaries) external afterSale {__FunctionCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',22);

__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',326);
         __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',72);
for (uint256 i = 0; i < _beneficiaries.length; i++) {
__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',327);
             __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',73);
claimTokenFor(_beneficiaries[i]);
        }
    }


    ////////////////
    // Bonus functions
    ////////////////

    /// @notice Sets extra 5% bonus for those addresses who send back a promo token
    /// @param _addr this address gets the bonus
    function setPromoBonus(address _addr) public {__FunctionCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',23);

__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',339);
        __AssertPreCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',22);
 __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',74);
require(msg.sender == promoTokenController || msg.sender == owner);__AssertPostCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',22);

__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',340);
         __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',75);
if (bonusExtra[ _addr ] < 5)
            { __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',76);
__BranchCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',23,0);__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',341);
bonusExtra[ _addr ] = 5;}else { __BranchCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',23,1);}

    }

    /// @notice Manual set extra bonus for addresses
    function setBonusExtra(address _addr, uint256 _bonus) public onlyOwner {__FunctionCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',24);

__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',346);
        __AssertPreCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',24);
 __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',77);
require(_addr != address(0));__AssertPostCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',24);

__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',347);
         __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',78);
bonusExtra[_addr] = _bonus;
    }

    /// @notice Mass set extra bonus for addresses
    function setManyBonusExtra(address[] _addr, uint256 _bonus) external onlyOwner {__FunctionCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',25);

__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',352);
         __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',79);
for (uint256 i = 0; i < _addr.length; i++) {
__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',353);
             __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',80);
setBonusExtra(_addr[i],_bonus);
        }
    }

    /// @notice Returns bonus for now
    function getBonusNow(address _addr, uint256 _size) public  returns (uint256) {__FunctionCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',26);

__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',359);
         __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',81);
return getBonus(_addr, _size, now);
    }

    /// @notice Returns the bonus in percentage, eg 130 means 30% bonus
    function getBonus(address _addr, uint256 _size, uint256 _time) public  returns (uint256 _bonus) {__FunctionCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',27);

        // detailed bonus structure: https://etheal.com/#heal-token
__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',365);
         __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',82);
_bonus = 100;
        
        // time based bonuses
__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',368);
         __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',83);
uint256 _day = getSaleDay(_time);
__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',369);
         __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',84);
uint256 _hour = getSaleHour(_time);
__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',370);
         __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',85);
if (_day <= 1) {__BranchCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',25,0);
__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',371);
             __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',86);
if (_hour <= 1) { __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',87);
__BranchCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',26,0);_bonus = 130;}
            else { __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',88);
__BranchCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',26,1);if (_hour <= 5) { __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',89);
__BranchCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',27,0);_bonus = 125;}
            else { __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',90);
__BranchCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',27,1);if (_hour <= 8) { __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',91);
__BranchCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',28,0);_bonus = 120;}
            else { __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',92);
__BranchCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',28,1);_bonus = 118;}}}
        } 
        else { __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',93);
__BranchCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',25,1);if (_day <= 2) {__BranchCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',29,0);  __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',94);
_bonus = 116; }
        else { __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',95);
__BranchCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',29,1);if (_day <= 3) {__BranchCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',30,0);  __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',96);
_bonus = 115; }
        else { __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',97);
__BranchCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',30,1);if (_day <= 5) {__BranchCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',31,0);  __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',98);
_bonus = 114; }
        else { __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',99);
__BranchCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',31,1);if (_day <= 7) {__BranchCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',32,0);  __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',100);
_bonus = 113; }
        else { __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',101);
__BranchCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',32,1);if (_day <= 9) {__BranchCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',33,0);  __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',102);
_bonus = 112; }
        else { __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',103);
__BranchCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',33,1);if (_day <= 11) {__BranchCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',34,0);  __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',104);
_bonus = 111; }
        else { __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',105);
__BranchCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',34,1);if (_day <= 13) {__BranchCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',35,0);  __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',106);
_bonus = 110; }
        else { __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',107);
__BranchCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',35,1);if (_day <= 15) {__BranchCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',36,0);  __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',108);
_bonus = 108; }
        else { __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',109);
__BranchCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',36,1);if (_day <= 17) {__BranchCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',37,0);  __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',110);
_bonus = 107; }
        else { __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',111);
__BranchCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',37,1);if (_day <= 19) {__BranchCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',38,0);  __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',112);
_bonus = 106; }
        else { __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',113);
__BranchCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',38,1);if (_day <= 21) {__BranchCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',39,0);  __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',114);
_bonus = 105; }
        else { __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',115);
__BranchCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',39,1);if (_day <= 23) {__BranchCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',40,0);  __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',116);
_bonus = 104; }
        else { __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',117);
__BranchCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',40,1);if (_day <= 25) {__BranchCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',41,0);  __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',118);
_bonus = 103; }
        else { __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',119);
__BranchCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',41,1);if (_day <= 27) {__BranchCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',42,0);  __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',120);
_bonus = 102; }else { __BranchCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',42,1);}
}}}}}}}}}}}}}}

        // size based bonuses
__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',392);
         __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',121);
if (_size >= 100 ether) {__BranchCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',43,0);  __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',122);
_bonus = _bonus + 4; }
        else { __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',123);
__BranchCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',43,1);if (_size >= 10 ether) {__BranchCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',44,0);  __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',124);
_bonus = _bonus + 2; }else { __BranchCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',44,1);}
}

        // manual bonus
__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',396);
         __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',125);
_bonus += bonusExtra[ _addr ];

__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',398);
         __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',126);
return _bonus;
    }


    ////////////////
    // Constant, helper functions
    ////////////////

    /// @notice How many wei can the msg.sender contribute now.
    function howMuchCanIContributeNow()  public returns (uint256) {__FunctionCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',28);

__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',408);
         __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',127);
return howMuchCanXContributeNow(msg.sender);
    }

    /// @notice How many wei can an ethereum address contribute now.
    /// @param _beneficiary Ethereum address
    /// @return Number of wei the _beneficiary can contribute now.
    function howMuchCanXContributeNow(address _beneficiary)  public returns (uint256) {__FunctionCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',29);

__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',415);
        __AssertPreCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',45);
 __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',128);
require(_beneficiary != address(0));__AssertPostCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',45);


__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',417);
         __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',129);
if (hasEnded() || paused) 
            { __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',130);
__BranchCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',46,0);__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',418);
return 0;}else { __BranchCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',46,1);}


        // wei to hard cap
__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',421);
         __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',131);
uint256 weiToCap = cap.sub(weiRaised);

__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',423);
         __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',132);
return weiToCap;
    }

    /// @notice For a give date how many 24 hour blocks have ellapsed since token sale start
    ///  Before sale return 0, first day 1, second day 2, ...
    /// @param _time Date in seconds for which we want to know which sale day it is
    /// @return Number of 24 hour blocks ellapsing since token sale start starting from 1
    function getSaleDay(uint256 _time)  public returns (uint256) {__FunctionCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',30);

__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',431);
         __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',133);
uint256 _day = 0;
__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',432);
         __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',134);
if (_time > startTime) {__BranchCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',47,0);
__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',433);
             __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',135);
_day = _time.sub(startTime).div(60*60*24).add(1);
        }else { __BranchCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',47,1);}

__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',435);
         __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',136);
return _day;
    }

    /// @notice How many 24 hour blocks have ellapsed since token sale start
    /// @return Number of 24 hour blocks ellapsing since token sale start starting from 1
    function getSaleDayNow()  public returns (uint256) {__FunctionCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',31);

__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',441);
         __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',137);
return getSaleDay(now);
    }

    /// @notice Returns sale hour: 0 before sale, 1 for the first hour, ...
    /// @param _time Date in seconds for which we want to know which sale hour it is
    /// @return Number of 1 hour blocks ellapsing since token sale start starting from 1
    function getSaleHour(uint256 _time)  public returns (uint256) {__FunctionCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',32);

__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',448);
         __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',138);
uint256 _hour = 0;
__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',449);
         __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',139);
if (_time > startTime) {__BranchCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',48,0);
__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',450);
             __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',140);
_hour = _time.sub(startTime).div(60*60).add(1);
        }else { __BranchCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',48,1);}

__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',452);
         __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',141);
return _hour;
    }

    /// @notice How many 1 hour blocks have ellapsed since token sale start
    /// @return Number of 1 hour blocks ellapsing since token sale start starting from 1
    function getSaleHourNow()  public returns (uint256) {__FunctionCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',33);

__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',458);
         __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',142);
return getSaleHour(now);
    }

    /// @notice Minimum between two uint256 numbers
    function uint256Min(uint256 a, uint256 b)  internal returns (uint256) {__FunctionCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',34);

__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',463);
         __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',143);
return a > b ? b : a;
    }


    ////////////////
    // Test and contribution web app, NO audit is needed
    ////////////////

    /// @notice How many contributors we have.
    /// @return Number of different contributor ethereum addresses
    function getContributorsCount()  public returns (uint256) {__FunctionCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',35);

__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',474);
         __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',144);
return contributorsKeys.length;
    }

    /// @notice Get contributor addresses to manage refunds or token claims.
    /// @dev If the sale is not yet successful, then it searches in the RefundVault.
    ///  If the sale is successful, it searches in contributors.
    /// @param _pending If true, then returns addresses which didn't get their tokens distributed to them
    /// @param _claimed If true, then returns already distributed addresses
    /// @return Array of addresses of contributors
    function getContributors(bool _pending, bool _claimed)  public returns (address[] contributors) {__FunctionCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',36);

__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',484);
         __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',145);
uint256 i = 0;
__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',485);
         __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',146);
uint256 results = 0;
__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',486);
         __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',147);
address[] memory _contributors = new address[](contributorsKeys.length);

        // search in contributors
__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',489);
         __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',148);
for (i = 0; i < contributorsKeys.length; i++) {
__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',490);
             __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',149);
if (_pending && stakes[contributorsKeys[i]] > 0 || _claimed && stakes[contributorsKeys[i]] == 0) {__BranchCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',49,0);
__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',491);
                 __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',150);
_contributors[results] = contributorsKeys[i];
__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',492);
                results++;
            }else { __BranchCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',49,1);}

        }

__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',496);
         __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',151);
contributors = new address[](results);
__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',497);
         __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',152);
for (i = 0; i < results; i++) {
__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',498);
             __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',153);
contributors[i] = _contributors[i];
        }

__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',501);
         __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',154);
return contributors;
    }

    /// @notice How many HEAL tokens do this contract have
    function getHealBalance()  public returns (uint256) {__FunctionCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',37);

__CoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',506);
         __StatementCoverageEthealNormalSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealNormalSale.sol',155);
return ethealController.ethealToken().balanceOf(address(this));
    }
}