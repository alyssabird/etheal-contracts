pragma solidity ^0.4.17;

import "./ERC20MiniMe.sol";
import "./CappedCrowdsale.sol";
import "./RefundableCrowdsale.sol";
import "./TokenController.sol";
import "./Pausable.sol";


/**
 * @title EthealPreSale
 * @author thesved
 * @notice Etheal Token Sale round one presale contract, with mincap (goal), softcap and hardcap (cap)
 * @dev This contract has to be finalized before refund or token claims are enabled
 */
contract EthealPreSale is Pausable, CappedCrowdsale, RefundableCrowdsale {event __CoverageEthealPreSale(string fileName, uint256 lineNumber);
event __FunctionCoverageEthealPreSale(string fileName, uint256 fnId);
event __StatementCoverageEthealPreSale(string fileName, uint256 statementId);
event __BranchCoverageEthealPreSale(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageEthealPreSale(string fileName, uint256 branchId);
event __AssertPostCoverageEthealPreSale(string fileName, uint256 branchId);

    // the token is here
    TokenController public ethealController;

    // after reaching {weiRaised} >= {softCap}, there is {softCapTime} seconds until the sale closes
    // {softCapClose} contains the closing time
    uint256 public rate = 1250;
    uint256 public goal = 333 ether;
    uint256 public softCap = 3600 ether;
    uint256 public softCapTime = 120 hours;
    uint256 public softCapClose;
    uint256 public cap = 7200 ether;

    // how many token is sold and not claimed, used for refunding to token controller
    uint256 public tokenBalance;

    // total token sold
    uint256 public tokenSold;

    // contributing above {maxGasPrice} results in 
    // calculating stakes on {maxGasPricePenalty} / 100
    // eg. 80 {maxGasPricePenalty} means 80%, sending 5 ETH with more than 100gwei gas price will be calculated as 4 ETH
    uint256 public maxGasPrice = 100 * 10**9;
    uint256 public maxGasPricePenalty = 80;

    // minimum contribution, 0.1ETH
    uint256 public minContribution = 0.1 ether;

    // first {whitelistDayCount} days of token sale is exclusive for whitelisted addresses
    // {whitelistDayMaxStake} contains the max stake limits per address for each whitelist sales day
    // {whitelist} contains who can contribute during whitelist period
    uint8 public whitelistDayCount;
    mapping (address => bool) public whitelist;
    mapping (uint8 => uint256) public whitelistDayMaxStake;
    
    // stakes contains contribution stake in wei
    // contributed ETH is calculated on 80% when sending funds with gasprice above maxGasPrice
    mapping (address => uint256) public stakes;

    // addresses of contributors to handle finalization after token sale end (refunds or token claims)
    address[] public contributorsKeys; 

    // events for token purchase during sale and claiming tokens after sale
    event TokenClaimed(address indexed _claimer, address indexed _beneficiary, uint256 _stake, uint256 _amount);
    event TokenPurchase(address indexed _purchaser, address indexed _beneficiary, uint256 _value, uint256 _stake, uint256 _amount, uint256 _participants, uint256 _weiRaised);
    event TokenGoalReached();
    event TokenSoftCapReached(uint256 _closeTime);

    // whitelist events for adding days with maximum stakes and addresses
    event WhitelistAddressAdded(address indexed _whitelister, address indexed _beneficiary);
    event WhitelistAddressRemoved(address indexed _whitelister, address indexed _beneficiary);
    event WhitelistSetDay(address indexed _whitelister, uint8 _day, uint256 _maxStake);


    ////////////////
    // Constructor and inherited function overrides
    ////////////////

    /// @notice Constructor to create PreSale contract
    /// @param _ethealController Address of ethealController
    /// @param _startTime The start time of token sale in seconds.
    /// @param _endTime The end time of token sale in seconds.
    /// @param _minContribution The minimum contribution per transaction in wei (0.1 ETH)
    /// @param _rate Number of HEAL tokens per 1 ETH
    /// @param _goal Minimum funding in wei, below that EVERYONE gets back ALL their
    ///  contributions regardless of maxGasPrice penalty. 
    ///  Eg. someone contributes with 5 ETH, but gets only 4 ETH stakes because
    ///  sending funds with gasprice over 100Gwei, he will still get back >>5 ETH<<
    ///  in case of unsuccessful token sale
    /// @param _softCap Softcap in wei, reaching it ends the sale in _softCapTime seconds
    /// @param _softCapTime Seconds until the sale remains open after reaching _softCap
    /// @param _cap Maximum cap in wei, we can't raise more funds
    /// @param _gasPrice Maximum gas price
    /// @param _gasPenalty Penalty in percentage points for calculating stakes, eg. 80 means calculating 
    ///  stakes on 80% if gasprice was higher than _gasPrice
    /// @param _wallet Address of multisig wallet, which will get all the funds after successful sale
    function EthealPreSale(
        address _ethealController,
        uint256 _startTime, 
        uint256 _endTime, 
        uint256 _minContribution, 
        uint256 _rate, 
        uint256 _goal, 
        uint256 _softCap, 
        uint256 _softCapTime, 
        uint256 _cap, 
        uint256 _gasPrice, 
        uint256 _gasPenalty, 
        address _wallet
    )
        CappedCrowdsale(_cap)
        FinalizableCrowdsale()
        RefundableCrowdsale(_goal)
        Crowdsale(_startTime, _endTime, _rate, _wallet)
    {__FunctionCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',1);

        // ethealController must be valid
__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',112);
        __AssertPreCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',1);
 __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',1);
require(_ethealController != address(0));__AssertPostCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',1);

__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',113);
         __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',2);
ethealController = TokenController(_ethealController);

        // caps have to be consistent with each other
__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',116);
        __AssertPreCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',2);
 __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',3);
require(_goal <= _softCap && _softCap <= _cap);__AssertPostCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',2);


        
__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',119);
         __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',4);
softCap = _softCap;
__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',120);
         __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',5);
softCapTime = _softCapTime;

        // this is needed since super constructor wont overwite overriden variables
__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',123);
         __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',6);
cap = _cap;
__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',124);
         __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',7);
goal = _goal;
__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',125);
         __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',8);
rate = _rate;

__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',127);
         __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',9);
maxGasPrice = _gasPrice;
__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',128);
         __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',10);
maxGasPricePenalty = _gasPenalty;

__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',130);
         __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',11);
minContribution = _minContribution;
    }

    /// @dev Overriding Crowdsale#buyTokens to add partial refund and softcap logic 
    /// @param _beneficiary Beneficiary of the token purchase
    function buyTokens(address _beneficiary) public payable whenNotPaused {__FunctionCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',2);

__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',136);
        __AssertPreCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',3);
 __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',12);
require(_beneficiary != address(0));__AssertPostCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',3);


__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',138);
         __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',13);
uint256 weiToCap = howMuchCanXContributeNow(_beneficiary);
__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',139);
         __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',14);
uint256 weiAmount = uint256Min(weiToCap, msg.value);

        // goal is reached
__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',142);
         __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',15);
if (weiRaised < goal && weiRaised.add(weiAmount) >= goal)
            { __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',16);
__BranchCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',4,0);__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',143);
TokenGoalReached();}else { __BranchCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',4,1);}


        // call the Crowdsale#buyTokens internal function
__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',146);
         __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',17);
buyTokens(_beneficiary, weiAmount);

        // close sale in softCapTime seconds after reaching softCap
__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',149);
         __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',18);
if (weiRaised >= softCap && softCapClose == 0) {__BranchCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',5,0);
__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',150);
             __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',19);
softCapClose = now.add(softCapTime);
__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',151);
             __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',20);
TokenSoftCapReached(uint256Min(softCapClose, endTime));
        }else { __BranchCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',5,1);}


        // handle refund
__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',155);
         __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',21);
uint256 refund = msg.value.sub(weiAmount);
__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',156);
         __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',22);
if (refund > 0) {__BranchCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',6,0);
__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',157);
            msg.sender.transfer(refund);
        }else { __BranchCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',6,1);}

    }

    /// @dev Overriding Crowdsale#transferToken, which keeps track of contributions DURING token sale
    /// @param _beneficiary Address of the recepient of the tokens
    /// @param _weiAmount Contribution in wei
    function transferToken(address _beneficiary, uint256 _weiAmount) internal {__FunctionCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',3);

__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',165);
        __AssertPreCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',7);
 __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',23);
require(_beneficiary != address(0));__AssertPostCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',7);


__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',167);
         __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',24);
uint256 weiAmount = _weiAmount;
        // check maxGasPricePenalty
__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',169);
         __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',25);
if (maxGasPrice > 0 && tx.gasprice > maxGasPrice) {__BranchCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',8,0);
__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',170);
             __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',26);
weiAmount = weiAmount.mul(maxGasPricePenalty).div(100);
        }else { __BranchCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',8,1);}


        // calculate tokens, so we can refund excess tokens to EthealController after token sale
__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',174);
         __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',27);
uint256 tokens = weiAmount.mul(rate);
__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',175);
         __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',28);
tokenBalance = tokenBalance.add(tokens);

__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',177);
         __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',29);
if (stakes[_beneficiary] == 0)
            {__BranchCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',9,0);__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',178);
contributorsKeys.push(_beneficiary);}else { __BranchCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',9,1);}


__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',180);
         __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',30);
stakes[_beneficiary] = stakes[_beneficiary].add(weiAmount);

__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',182);
         __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',31);
TokenPurchase(msg.sender, _beneficiary, _weiAmount, weiAmount, tokens, contributorsKeys.length, weiRaised);
    }

    /// @dev Overriding Crowdsale#validPurchase to add min contribution logic
    /// @param _weiAmount Contribution amount in wei
    /// @return true if contribution is okay
    function validPurchase(uint256 _weiAmount) internal  returns (bool) {__FunctionCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',4);

__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',189);
         __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',32);
return super.validPurchase(_weiAmount) && _weiAmount >= minContribution;
    }

    /// @dev Overriding Crowdsale#hasEnded to add soft cap logic
    /// @return true if crowdsale event has ended or a softCapClose time is set and passed
    function hasEnded() public  returns (bool) {__FunctionCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',5);

__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',195);
         __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',33);
return super.hasEnded() || softCapClose > 0 && now > softCapClose;
    }

    /// @dev Overriding RefundableCrowdsale#claimRefund to enable anyone to call for any address
    ///  which enables us to refund anyone and also anyone can refund themselves
    function claimRefund() public {__FunctionCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',6);

__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',201);
         __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',34);
claimRefundFor(msg.sender);
    }

    /// @dev Extending RefundableCrowdsale#finalization sending back excess tokens to ethealController
    function finalization() internal {__FunctionCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',7);

__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',206);
         __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',35);
uint256 _balance = getHealBalance();

        // if token sale was successful send back excess funds
__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',209);
         __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',36);
if (goalReached()) {__BranchCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',10,0);
            // saving token balance for future reference
__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',211);
             __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',37);
tokenSold = tokenBalance; 

            // send back the excess token to ethealController
__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',214);
             __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',38);
if (_balance > tokenBalance) {__BranchCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',11,0);
__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',215);
                ethealController.ethealToken().transfer(ethealController.SALE(), _balance.sub(tokenBalance));
            }else { __BranchCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',11,1);}

        } else { __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',39);
__BranchCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',10,1);if (!goalReached() && _balance > 0) {__BranchCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',12,0);
            // if token sale is failed, then send back all tokens to ethealController's sale address
__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',219);
             __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',40);
tokenBalance = 0;
__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',220);
            ethealController.ethealToken().transfer(ethealController.SALE(), _balance);
        }else { __BranchCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',12,1);}
}

__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',223);
        super.finalization();
    }


    ////////////////
    // BEFORE token sale
    ////////////////

    /// @notice Modifier for before sale cases
    modifier beforeSale() {__FunctionCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',8);

__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',233);
        __AssertPreCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',13);
 __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',41);
require(!hasStarted());__AssertPostCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',13);

__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',234);
        _;
    }

    /// @notice Sets whitelist
    /// @dev The length of _whitelistLimits says that the first X days of token sale is 
    ///  closed, meaning only for whitelisted addresses.
    /// @param _add Array of addresses to add to whitelisted ethereum accounts
    /// @param _remove Array of addresses to remove to whitelisted ethereum accounts
    /// @param _whitelistLimits Array of limits in wei, where _whitelistLimits[0] = 10 ETH means
    ///  whitelisted addresses can contribute maximum 10 ETH stakes on the first day
    ///  After _whitelistLimits.length days, there will be no limits per address (besides hard cap)
    function setWhitelist(address[] _add, address[] _remove, uint256[] _whitelistLimits) public onlyOwner beforeSale {__FunctionCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',9);

__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',246);
         __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',42);
uint256 i = 0;
__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',247);
         __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',43);
uint8 j = 0; // access max daily stakes

        // we override whiteListLimits only if it was supplied as an argument
__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',250);
         __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',44);
if (_whitelistLimits.length > 0) {__BranchCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',14,0);
            // saving whitelist max stake limits for each day -> uint256 maxStakeLimit
__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',252);
             __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',45);
whitelistDayCount = uint8(_whitelistLimits.length);

__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',254);
             __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',46);
for (i = 0; i < _whitelistLimits.length; i++) {
__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',255);
                 __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',47);
j = uint8(i.add(1));
__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',256);
                 __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',48);
if (whitelistDayMaxStake[j] != _whitelistLimits[i]) {__BranchCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',15,0);
__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',257);
                     __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',49);
whitelistDayMaxStake[j] = _whitelistLimits[i];
__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',258);
                     __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',50);
WhitelistSetDay(msg.sender, j, _whitelistLimits[i]);
                }else { __BranchCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',15,1);}

            }
        }else { __BranchCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',14,1);}


        // adding whitelist addresses
__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',264);
         __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',51);
for (i = 0; i < _add.length; i++) {
__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',265);
            __AssertPreCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',16);
 __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',52);
require(_add[i] != address(0));__AssertPostCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',16);

            
__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',267);
             __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',53);
if (!whitelist[_add[i]]) {__BranchCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',17,0);
__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',268);
                 __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',54);
whitelist[_add[i]] = true;
__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',269);
                 __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',55);
WhitelistAddressAdded(msg.sender, _add[i]);
            }else { __BranchCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',17,1);}

        }

        // removing whitelist addresses
__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',274);
         __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',56);
for (i = 0; i < _remove.length; i++) {
__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',275);
            __AssertPreCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',18);
 __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',57);
require(_remove[i] != address(0));__AssertPostCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',18);

            
__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',277);
             __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',58);
if (whitelist[_remove[i]]) {__BranchCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',19,0);
__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',278);
                 __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',59);
whitelist[_remove[i]] = false;
__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',279);
                 __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',60);
WhitelistAddressRemoved(msg.sender, _remove[i]);
            }else { __BranchCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',19,1);}

        }
    }

    /// @notice Sets max gas price and penalty before sale
    function setMaxGas(uint256 _maxGas, uint256 _penalty) public onlyOwner beforeSale {__FunctionCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',10);

__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',286);
         __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',61);
maxGasPrice = _maxGas;
__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',287);
         __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',62);
maxGasPricePenalty = _penalty;
    }

    /// @notice Sets min contribution before sale
    function setMinContribution(uint256 _minContribution) public onlyOwner beforeSale {__FunctionCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',11);

__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',292);
         __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',63);
minContribution = _minContribution;
    }

    /// @notice Sets minimum goal, soft cap and max cap
    function setCaps(uint256 _goal, uint256 _softCap, uint256 _softCapTime, uint256 _cap) public onlyOwner beforeSale {__FunctionCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',12);

__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',297);
         __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',64);
goal = _goal;
__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',298);
         __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',65);
softCap = _softCap;
__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',299);
         __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',66);
softCapTime = _softCapTime;
__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',300);
         __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',67);
cap = _cap;
    }

    /// @notice Sets crowdsale start and end time
    function setTimes(uint256 _startTime, uint256 _endTime) public onlyOwner beforeSale {__FunctionCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',13);

__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',305);
         __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',68);
startTime = _startTime;
__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',306);
         __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',69);
endTime = _endTime;
    }

    /// @notice Set rate
    function setRate(uint256 _rate) public onlyOwner beforeSale {__FunctionCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',14);

__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',311);
         __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',70);
rate = _rate;
    }


    ////////////////
    // AFTER token sale
    ////////////////

    /// @notice Modifier for cases where sale is failed
    /// @dev It checks whether we haven't reach the minimum goal AND whether the contract is finalized
    modifier afterSaleFail() {__FunctionCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',15);

__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',322);
        __AssertPreCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',20);
 __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',71);
require(!goalReached() && isFinalized);__AssertPostCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',20);

__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',323);
        _;
    }

    /// @notice Modifier for cases where sale is closed and was successful.
    /// @dev It checks whether
    ///  the sale has ended 
    ///  and we have reached our goal
    ///  AND whether the contract is finalized
    modifier afterSaleSuccess() {__FunctionCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',16);

__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',332);
        __AssertPreCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',21);
 __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',72);
require(goalReached() && isFinalized);__AssertPostCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',21);

__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',333);
        _;
    }

    /// @notice Modifier for after sale finalization
    modifier afterSale() {__FunctionCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',17);

__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',338);
        __AssertPreCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',22);
 __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',73);
require(isFinalized);__AssertPostCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',22);

__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',339);
        _;
    }

    
    /// @notice Refund an ethereum address
    /// @param _beneficiary Address we want to refund
    function claimRefundFor(address _beneficiary) public afterSaleFail whenNotPaused {__FunctionCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',18);

__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',346);
        __AssertPreCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',23);
 __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',74);
require(_beneficiary != address(0));__AssertPostCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',23);

__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',347);
        vault.refund(_beneficiary);
    }

    /// @notice Refund several addresses with one call
    /// @param _beneficiaries Array of addresses we want to refund
    function claimRefundsFor(address[] _beneficiaries) external afterSaleFail {__FunctionCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',19);

__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',353);
         __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',75);
for (uint256 i = 0; i < _beneficiaries.length; i++)
            { __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',76);
__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',354);
claimRefundFor(_beneficiaries[i]);}
    }

    /// @notice Claim token for msg.sender after token sale based on stake.
    function claimToken() public afterSaleSuccess {__FunctionCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',20);

__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',359);
         __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',77);
claimTokenFor(msg.sender);
    }

    /// @notice Claim token after token sale based on stake.
    /// @dev Anyone can call this function and distribute tokens after successful token sale
    /// @param _beneficiary Address of the beneficiary who gets the token
    function claimTokenFor(address _beneficiary) public afterSaleSuccess whenNotPaused {__FunctionCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',21);

__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',366);
         __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',78);
uint256 stake = stakes[_beneficiary];
__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',367);
        __AssertPreCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',24);
 __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',79);
require(stake > 0);__AssertPostCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',24);


        // set the stake 0 for beneficiary
__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',370);
         __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',80);
stakes[_beneficiary] = 0;

        // calculate token count
__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',373);
         __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',81);
uint256 tokens = stake.mul(rate);

        // decrease tokenBalance, to make it possible to withdraw excess HEAL funds
__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',376);
         __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',82);
tokenBalance = tokenBalance.sub(tokens);

        // distribute hodlr stake
__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',379);
        ethealController.addHodlerStake(_beneficiary, tokens);

        // distribute token
__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',382);
        __AssertPreCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',25);
 __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',83);
require(ethealController.ethealToken().transfer(_beneficiary, tokens));__AssertPostCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',25);

__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',383);
         __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',84);
TokenClaimed(msg.sender, _beneficiary, stake, tokens);
    }

    /// @notice claimToken() for multiple addresses
    /// @dev Anyone can call this function and distribute tokens after successful token sale
    /// @param _beneficiaries Array of addresses for which we want to claim tokens
    function claimTokensFor(address[] _beneficiaries) external afterSaleSuccess {__FunctionCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',22);

__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',390);
         __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',85);
for (uint256 i = 0; i < _beneficiaries.length; i++)
            { __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',86);
__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',391);
claimTokenFor(_beneficiaries[i]);}
    }

    /// @notice Get back accidentally sent token from the vault
    function extractVaultTokens(address _token, address _claimer) public onlyOwner afterSale {__FunctionCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',23);

__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',396);
        __AssertPreCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',26);
 __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',87);
require(_claimer != address(0));__AssertPostCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',26);


__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',398);
        vault.extractTokens(_token, _claimer);
    }


    ////////////////
    // Constant, helper functions
    ////////////////

    /// @notice How many wei can the msg.sender contribute now.
    function howMuchCanIContributeNow()  public returns (uint256) {__FunctionCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',24);

__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',408);
         __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',88);
return howMuchCanXContributeNow(msg.sender);
    }

    /// @notice How many wei can an ethereum address contribute now.
    /// @dev This function can return 0 when the crowdsale is stopped
    ///  or the address has maxed the current day's whitelist cap,
    ///  it is possible, that next day he can contribute
    /// @param _beneficiary Ethereum address
    /// @return Number of wei the _beneficiary can contribute now.
    function howMuchCanXContributeNow(address _beneficiary)  public returns (uint256) {__FunctionCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',25);

__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',418);
        __AssertPreCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',27);
 __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',89);
require(_beneficiary != address(0));__AssertPostCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',27);


__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',420);
         __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',90);
if (!hasStarted() || hasEnded()) 
            { __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',91);
__BranchCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',28,0);__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',421);
return 0;}else { __BranchCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',28,1);}


        // wei to hard cap
__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',424);
         __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',92);
uint256 weiToCap = cap.sub(weiRaised);

        // if this is a whitelist limited period
__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',427);
         __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',93);
uint8 _saleDay = getSaleDayNow();
__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',428);
         __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',94);
if (_saleDay <= whitelistDayCount) {__BranchCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',29,0);
            // address can't contribute if
            //  it is not whitelisted
__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',431);
             __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',95);
if (!whitelist[_beneficiary])
                { __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',96);
__BranchCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',30,0);__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',432);
return 0;}else { __BranchCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',30,1);}


            // personal cap is the daily whitelist limit minus the stakes the address already has
__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',435);
             __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',97);
uint256 weiToPersonalCap = whitelistDayMaxStake[_saleDay].sub(stakes[_beneficiary]);

            // calculate for maxGasPrice penalty
__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',438);
             __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',98);
if (msg.value > 0 && maxGasPrice > 0 && tx.gasprice > maxGasPrice)
                { __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',99);
__BranchCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',31,0);__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',439);
weiToPersonalCap = weiToPersonalCap.mul(100).div(maxGasPricePenalty);}else { __BranchCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',31,1);}


__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',441);
             __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',100);
weiToCap = uint256Min(weiToCap, weiToPersonalCap);
        }else { __BranchCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',29,1);}


__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',444);
         __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',101);
return weiToCap;
    }

    /// @notice For a give date how many 24 hour blocks have ellapsed since token sale start
    /// @dev _time has to be bigger than the startTime of token sale, otherwise SafeMath's div will throw.
    ///  Within 24 hours of token sale it will return 1, 
    ///  between 24 and 48 hours it will return 2, etc.
    /// @param _time Date in seconds for which we want to know which sale day it is
    /// @return Number of 24 hour blocks ellapsing since token sale start starting from 1
    function getSaleDay(uint256 _time)  public returns (uint8) {__FunctionCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',26);

__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',454);
         __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',102);
return uint8(_time.sub(startTime).div(60*60*24).add(1));
    }

    /// @notice How many 24 hour blocks have ellapsed since token sale start
    /// @return Number of 24 hour blocks ellapsing since token sale start starting from 1
    function getSaleDayNow()  public returns (uint8) {__FunctionCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',27);

__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',460);
         __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',103);
return getSaleDay(now);
    }

    /// @notice Minimum between two uint8 numbers
    function uint8Min(uint8 a, uint8 b)  internal returns (uint8) {__FunctionCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',28);

__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',465);
         __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',104);
return a > b ? b : a;
    }

    /// @notice Minimum between two uint256 numbers
    function uint256Min(uint256 a, uint256 b)  internal returns (uint256) {__FunctionCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',29);

__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',470);
         __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',105);
return a > b ? b : a;
    }


    ////////////////
    // Test and contribution web app, NO audit is needed
    ////////////////

    /// @notice Was this token sale successful?
    /// @return true if the sale is over and we have reached the minimum goal
    function wasSuccess()  public returns (bool) {__FunctionCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',30);

__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',481);
         __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',106);
return hasEnded() && goalReached();
    }

    /// @notice How many contributors we have.
    /// @return Number of different contributor ethereum addresses
    function getContributorsCount()  public returns (uint256) {__FunctionCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',31);

__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',487);
         __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',107);
return contributorsKeys.length;
    }

    /// @notice Get contributor addresses to manage refunds or token claims.
    /// @dev If the sale is not yet successful, then it searches in the RefundVault.
    ///  If the sale is successful, it searches in contributors.
    /// @param _pending If true, then returns addresses which didn't get refunded or their tokens distributed to them
    /// @param _claimed If true, then returns already refunded or token distributed addresses
    /// @return Array of addresses of contributors
    function getContributors(bool _pending, bool _claimed)  public returns (address[] contributors) {__FunctionCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',32);

__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',497);
         __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',108);
uint256 i = 0;
__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',498);
         __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',109);
uint256 results = 0;
__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',499);
         __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',110);
address[] memory _contributors = new address[](contributorsKeys.length);

        // if we have reached our goal, then search in contributors, since this is what we want to monitor
__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',502);
         __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',111);
if (goalReached()) {__BranchCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',32,0);
__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',503);
             __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',112);
for (i = 0; i < contributorsKeys.length; i++) {
__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',504);
                 __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',113);
if (_pending && stakes[contributorsKeys[i]] > 0 || _claimed && stakes[contributorsKeys[i]] == 0) {__BranchCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',33,0);
__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',505);
                     __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',114);
_contributors[results] = contributorsKeys[i];
__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',506);
                    results++;
                }else { __BranchCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',33,1);}

            }
        } else {__BranchCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',32,1);
            // otherwise search in the refund vault
__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',511);
             __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',115);
for (i = 0; i < contributorsKeys.length; i++) {
__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',512);
                 __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',116);
if (_pending && vault.deposited(contributorsKeys[i]) > 0 || _claimed && vault.deposited(contributorsKeys[i]) == 0) {__BranchCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',34,0);
__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',513);
                     __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',117);
_contributors[results] = contributorsKeys[i];
__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',514);
                    results++;
                }else { __BranchCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',34,1);}

            }
        }

__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',519);
         __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',118);
contributors = new address[](results);
__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',520);
         __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',119);
for (i = 0; i < results; i++) {
__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',521);
             __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',120);
contributors[i] = _contributors[i];
        }

__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',524);
         __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',121);
return contributors;
    }

    /// @notice How many HEAL tokens do this contract have
    function getHealBalance()  public returns (uint256) {__FunctionCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',33);

__CoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',529);
         __StatementCoverageEthealPreSale('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPreSale.sol',122);
return ethealController.ethealToken().balanceOf(address(this));
    }
}