pragma solidity ^0.4.17;

import "./SafeMath.sol";
import "./ERC20MiniMe.sol";
import "./Crowdsale.sol";
import "./TokenController.sol";
import "./Pausable.sol";
import "./Hodler.sol";
import "./TokenVesting.sol";
import "./HasNoTokens.sol";


/**
 * @title EthealController
 * @author thesved
 * @notice Controller of the Etheal Token
 * @dev Crowdsale can be only replaced when no active crowdsale is running.
 *  The contract is paused by default. It has to be unpaused to enable token transfer.
 */
contract EthealController is Pausable, HasNoTokens, TokenController {event __CoverageEthealController(string fileName, uint256 lineNumber);
event __FunctionCoverageEthealController(string fileName, uint256 fnId);
event __StatementCoverageEthealController(string fileName, uint256 statementId);
event __BranchCoverageEthealController(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageEthealController(string fileName, uint256 branchId);
event __AssertPostCoverageEthealController(string fileName, uint256 branchId);

    using SafeMath for uint;

    // when migrating this contains the address of the new controller
    TokenController public newController;

    // token contract
    ERC20MiniMe public ethealToken;

    // distribution of tokens
    uint256 public constant ETHEAL_UNIT = 10**18;
    uint256 public constant THOUSAND = 10**3;
    uint256 public constant MILLION = 10**6;
    uint256 public constant TOKEN_SALE1_PRE = 9 * MILLION * ETHEAL_UNIT;
    uint256 public constant TOKEN_SALE1_NORMAL = 20 * MILLION * ETHEAL_UNIT;
    uint256 public constant TOKEN_SALE2 = 9 * MILLION * ETHEAL_UNIT;
    uint256 public constant TOKEN_SALE3 = 5 * MILLION * ETHEAL_UNIT;
    uint256 public constant TOKEN_HODL_3M = 1 * MILLION * ETHEAL_UNIT;
    uint256 public constant TOKEN_HODL_6M = 2 * MILLION * ETHEAL_UNIT;
    uint256 public constant TOKEN_HODL_9M = 7 * MILLION * ETHEAL_UNIT;
    uint256 public constant TOKEN_REFERRAL = 2 * MILLION * ETHEAL_UNIT;
    uint256 public constant TOKEN_BOUNTY = 1500 * THOUSAND * ETHEAL_UNIT;
    uint256 public constant TOKEN_COMMUNITY = 20 * MILLION * ETHEAL_UNIT;
    uint256 public constant TOKEN_TEAM = 14 * MILLION * ETHEAL_UNIT;
    uint256 public constant TOKEN_FOUNDERS = 6500 * THOUSAND * ETHEAL_UNIT;
    uint256 public constant TOKEN_INVESTORS = 3 * MILLION * ETHEAL_UNIT;

    // addresses only SALE will remain, the others will be real eth addresses
    address public SALE = 0X1;
    address public FOUNDER1 = 0X2;
    address public FOUNDER2 = 0X3;
    address public INVESTOR1 = 0X4;
    address public INVESTOR2 = 0X5;

    // addresses for multisig and crowdsale
    address public ethealMultisigWallet;
    Crowdsale public crowdsale;

    // hodler reward contract
    Hodler public hodlerReward;

    // token grants
    TokenVesting[] public tokenGrants;
    uint256 public constant VESTING_TEAM_CLIFF = 365 days;
    uint256 public constant VESTING_TEAM_DURATION = 4 * 365 days;
    uint256 public constant VESTING_ADVISOR_CLIFF = 3 * 30 days;
    uint256 public constant VESTING_ADVISOR_DURATION = 6 * 30 days;


    /// @dev only the crowdsale can call it
    modifier onlyCrowdsale() {__FunctionCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',1);

__CoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',71);
        __AssertPreCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',1);
 __StatementCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',1);
require(msg.sender == address(crowdsale));__AssertPostCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',1);

__CoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',72);
        _;
    }

    /// @dev only the crowdsale can call it
    modifier onlyEthealMultisig() {__FunctionCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',2);

__CoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',77);
        __AssertPreCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',2);
 __StatementCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',2);
require(msg.sender == address(ethealMultisigWallet));__AssertPostCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',2);

__CoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',78);
        _;
    }


    ////////////////
    // Constructor, overrides
    ////////////////

    /// @notice Constructor for Etheal Controller
    function EthealController(address _wallet) {__FunctionCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',3);

__CoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',88);
        __AssertPreCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',3);
 __StatementCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',3);
require(_wallet != address(0));__AssertPostCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',3);


__CoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',90);
         __StatementCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',4);
paused = true;
__CoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',91);
         __StatementCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',5);
ethealMultisigWallet = _wallet;
    }

    /// @dev overrides HasNoTokens#extractTokens to make it possible to extract any tokens after migration or before that any tokens except etheal
    function extractTokens(address _token, address _claimer) onlyOwner public {__FunctionCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',4);

__CoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',96);
        __AssertPreCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',4);
 __StatementCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',6);
require(newController != address(0) || _token != address(ethealToken));__AssertPostCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',4);


__CoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',98);
        super.extractTokens(_token, _claimer);
    }


    ////////////////
    // Manage crowdsale
    ////////////////

    /// @notice Set crowdsale address and transfer HEAL tokens from ethealController's SALE address
    /// @dev Crowdsale can be only set when the current crowdsale is not active and ethealToken is set
    function setCrowdsaleTransfer(address _sale, uint256 _amount) public onlyOwner {__FunctionCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',5);

__CoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',109);
        __AssertPreCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',5);
 __StatementCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',7);
require (_sale != address(0) && !isCrowdsaleOpen() && address(ethealToken) != address(0));__AssertPostCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',5);


__CoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',111);
         __StatementCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',8);
crowdsale = Crowdsale(_sale);

        // transfer HEAL tokens to crowdsale account from the account of controller
__CoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',114);
        __AssertPreCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',6);
 __StatementCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',9);
require(ethealToken.transferFrom(SALE, _sale, _amount));__AssertPostCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',6);

    }

    /// @notice Is there a not ended crowdsale?
    /// @return true if there is no crowdsale or the current crowdsale is not yet ended but started
    function isCrowdsaleOpen() public  returns (bool) {__FunctionCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',6);

__CoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',120);
         __StatementCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',10);
return address(crowdsale) != address(0) && !crowdsale.hasEnded() && crowdsale.hasStarted();
    }


    ////////////////
    // Manage grants
    ////////////////

    /// @notice Grant vesting token to an address
    function createGrant(address _beneficiary, uint256 _amount, bool _revocable, bool _advisor) public onlyOwner {__FunctionCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',7);

__CoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',130);
        __AssertPreCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',7);
 __StatementCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',11);
require(_beneficiary != address(0) && _amount > 0);__AssertPostCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',7);


        // create token grant
__CoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',133);
         __StatementCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',12);
if (_advisor) {__BranchCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',8,0);
__CoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',134);
            tokenGrants.push(new TokenVesting(_beneficiary, now, VESTING_ADVISOR_CLIFF, VESTING_ADVISOR_DURATION, _revocable));
        } else {__BranchCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',8,1);
__CoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',136);
            tokenGrants.push(new TokenVesting(_beneficiary, now, VESTING_TEAM_CLIFF, VESTING_TEAM_DURATION, _revocable));
        }

        // transfer funds to the grant
__CoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',140);
        __AssertPreCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',9);
 __StatementCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',13);
require(ethealToken.transfer(address(tokenGrants[tokenGrants.length.sub(1)]), _amount));__AssertPostCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',9);

    }

    /// @notice Transfer tokens to a grant until it is starting
    function transferToGrant(uint256 _id, uint256 _amount) public onlyOwner {__FunctionCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',8);

__CoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',145);
        __AssertPreCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',10);
 __StatementCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',14);
require(_id < tokenGrants.length && _amount > 0 && now < tokenGrants[_id].start());__AssertPostCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',10);


        // transfer funds to the grant
__CoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',148);
        __AssertPreCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',11);
 __StatementCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',15);
require(ethealToken.transfer(address(tokenGrants[_id]), _amount));__AssertPostCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',11);

    }

    /// @dev Revoking grant
    function revokeGrant(uint256 _id) public onlyOwner {__FunctionCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',9);

__CoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',153);
        __AssertPreCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',12);
 __StatementCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',16);
require(_id < tokenGrants.length);__AssertPostCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',12);


__CoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',155);
        tokenGrants[_id].revoke(ethealToken);
    }

    /// @notice Returns the token grant count
    function getGrantCount()  public returns (uint) {__FunctionCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',10);

__CoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',160);
         __StatementCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',17);
return tokenGrants.length;
    }


    ////////////////
    // BURN, handle ownership - only multsig can call these functions!
    ////////////////

    /// @notice contract can burn its own or its sale tokens
    function burn(address _where, uint256 _amount) public onlyEthealMultisig {__FunctionCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',11);

__CoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',170);
        __AssertPreCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',13);
 __StatementCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',18);
require(_where == address(this) || _where == SALE);__AssertPostCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',13);


__CoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',172);
        __AssertPreCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',14);
 __StatementCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',19);
require(ethealToken.destroyTokens(_where, _amount));__AssertPostCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',14);

    }

    /// @notice replaces controller when it was not yet replaced, only multisig can do it
    function setNewController(address _controller) public onlyEthealMultisig {__FunctionCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',12);

__CoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',177);
        __AssertPreCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',15);
 __StatementCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',20);
require(_controller != address(0) && newController == address(0));__AssertPostCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',15);


__CoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',179);
         __StatementCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',21);
newController = TokenController(_controller);
__CoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',180);
        ethealToken.changeController(_controller);
__CoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',181);
        hodlerReward.transferOwnership(_controller);

        // send eth
__CoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',184);
         __StatementCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',22);
uint256 _stake = this.balance;
__CoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',185);
         __StatementCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',23);
if (_stake > 0)
            {__BranchCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',16,0);__CoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',186);
_controller.transfer(_stake);}else { __BranchCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',16,1);}


        // send tokens
__CoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',189);
         __StatementCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',24);
_stake = ethealToken.balanceOf(this);
__CoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',190);
         __StatementCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',25);
if (_stake > 0)
            {__BranchCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',17,0);__CoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',191);
ethealToken.transfer(_controller, _stake);}else { __BranchCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',17,1);}

    }

    /// @notice Set new multisig wallet, to make it upgradable.
    function setNewMultisig(address _wallet) public onlyEthealMultisig {__FunctionCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',13);

__CoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',196);
        __AssertPreCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',18);
 __StatementCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',26);
require(_wallet != address(0));__AssertPostCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',18);


__CoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',198);
         __StatementCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',27);
ethealMultisigWallet = _wallet;
    }


    ////////////////
    // When PAUSED
    ////////////////

    /// @notice set the token, if no hodler provided then creates a hodler reward contract
    function setEthealToken(address _token, address _hodler) public onlyOwner whenPaused {__FunctionCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',14);

__CoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',208);
        __AssertPreCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',19);
 __StatementCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',28);
require(_token != address(0));__AssertPostCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',19);


__CoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',210);
         __StatementCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',29);
ethealToken = ERC20MiniMe(_token);

        
__CoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',213);
         __StatementCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',30);
if (_hodler != address(0)) {__BranchCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',20,0);
            // set hodler reward contract if provided
__CoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',215);
             __StatementCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',31);
hodlerReward = Hodler(_hodler);
        } else { __StatementCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',32);
__BranchCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',20,1);if (hodlerReward == address(0)) {__BranchCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',21,0);
            // create hodler reward contract if not yet created
__CoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',218);
             __StatementCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',33);
hodlerReward = new Hodler(TOKEN_HODL_3M, TOKEN_HODL_6M, TOKEN_HODL_9M);
        }else { __BranchCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',21,1);}
}

        // MINT tokens if not minted yet
__CoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',222);
         __StatementCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',34);
if (ethealToken.totalSupply() == 0) {__BranchCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',22,0);
            // sale
__CoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',224);
            ethealToken.generateTokens(SALE, TOKEN_SALE1_PRE.add(TOKEN_SALE1_NORMAL).add(TOKEN_SALE2).add(TOKEN_SALE3));
            // hodler reward
__CoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',226);
            ethealToken.generateTokens(address(hodlerReward), TOKEN_HODL_3M.add(TOKEN_HODL_6M).add(TOKEN_HODL_9M));
            // bounty + referral
__CoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',228);
            ethealToken.generateTokens(owner, TOKEN_BOUNTY.add(TOKEN_REFERRAL));
            // community fund
__CoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',230);
            ethealToken.generateTokens(address(ethealMultisigWallet), TOKEN_COMMUNITY);
            // team -> grantable
__CoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',232);
            ethealToken.generateTokens(address(this), TOKEN_FOUNDERS.add(TOKEN_TEAM));
            // investors
__CoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',234);
            ethealToken.generateTokens(INVESTOR1, TOKEN_INVESTORS.div(3).mul(2));
__CoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',235);
            ethealToken.generateTokens(INVESTOR2, TOKEN_INVESTORS.div(3));
        }else { __BranchCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',22,1);}

    }


    ////////////////
    // Proxy for Hodler contract
    ////////////////
    
    /// @notice Proxy call for setting hodler start time
    function setHodlerTime(uint256 _time) public onlyCrowdsale {__FunctionCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',15);

__CoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',246);
        hodlerReward.setHodlerTime(_time);
    }

    /// @notice Proxy call for adding hodler stake
    function addHodlerStake(address _beneficiary, uint256 _stake) public onlyCrowdsale {__FunctionCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',16);

__CoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',251);
        hodlerReward.addHodlerStake(_beneficiary, _stake);
    }

    /// @notice Proxy call for setting hodler stake
    function setHodlerStake(address _beneficiary, uint256 _stake) public onlyCrowdsale {__FunctionCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',17);

__CoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',256);
        hodlerReward.setHodlerStake(_beneficiary, _stake);
    }


    ////////////////
    // MiniMe Controller functions
    ////////////////

    /// @notice No eth payment to the token contract
    function proxyPayment(address _owner) payable public returns (bool) {__FunctionCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',18);

__CoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',266);
         __StatementCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',35);
revert();
    }

    /// @notice Before transfers are enabled for everyone, only this and the crowdsale contract is allowed to distribute HEAL
    function onTransfer(address _from, address _to, uint256 _amount) public returns (bool) {__FunctionCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',19);

        // moving any funds makes hodl participation invalid
__CoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',272);
        hodlerReward.invalidate(_from);

__CoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',274);
         __StatementCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',36);
return !paused || _from == address(this) || _to == address(this) || _from == address(crowdsale) || _to == address(crowdsale);
    }

    function onApprove(address _owner, address _spender, uint256 _amount) public returns (bool) {__FunctionCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',20);

__CoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',278);
         __StatementCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',37);
return !paused;
    }

    /// @notice Retrieve mistakenly sent tokens (other than the etheal token) from the token contract 
    function claimTokenTokens(address _token) public onlyOwner {__FunctionCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',21);

__CoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',283);
        __AssertPreCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',23);
 __StatementCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',38);
require(_token != address(ethealToken));__AssertPostCoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',23);


__CoverageEthealController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealController.sol',285);
        ethealToken.claimTokens(_token);
    }
}