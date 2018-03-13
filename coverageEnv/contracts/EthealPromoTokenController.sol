pragma solidity ^0.4.17;

import "./SafeMath.sol";
import "./ERC20MiniMe.sol";
import "./TokenController.sol";
import "./HasNoTokens.sol";
import "./Pausable.sol";
import "./iEthealSale.sol";

/**
 * @title EthealPromoToken
 * @author thesved
 * @notice Controller of the Etheal PROMO Token
 */
contract EthealPromoTokenController is Pausable, HasNoTokens {event __CoverageEthealPromoTokenController(string fileName, uint256 lineNumber);
event __FunctionCoverageEthealPromoTokenController(string fileName, uint256 fnId);
event __StatementCoverageEthealPromoTokenController(string fileName, uint256 statementId);
event __BranchCoverageEthealPromoTokenController(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageEthealPromoTokenController(string fileName, uint256 branchId);
event __AssertPostCoverageEthealPromoTokenController(string fileName, uint256 branchId);

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
    function extractTokens(address _token, address _claimer) onlyOwner public {__FunctionCoverageEthealPromoTokenController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPromoTokenController.sol',1);

__CoverageEthealPromoTokenController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPromoTokenController.sol',34);
        super.extractTokens(_token, _claimer);
    }


    ////////////////
    // Handle ownership - only for owner
    ////////////////

    /// @notice replaces controller when it was not yet replaced, only multisig can do it
    function setNewController(address _controller) public onlyOwner {__FunctionCoverageEthealPromoTokenController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPromoTokenController.sol',2);

__CoverageEthealPromoTokenController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPromoTokenController.sol',44);
        __AssertPreCoverageEthealPromoTokenController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPromoTokenController.sol',1);
 __StatementCoverageEthealPromoTokenController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPromoTokenController.sol',1);
require(_controller != address(0) && newController == address(0));__AssertPostCoverageEthealPromoTokenController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPromoTokenController.sol',1);


__CoverageEthealPromoTokenController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPromoTokenController.sol',46);
         __StatementCoverageEthealPromoTokenController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPromoTokenController.sol',2);
newController = TokenController(_controller);
__CoverageEthealPromoTokenController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPromoTokenController.sol',47);
        ethealPromoToken.changeController(_controller);

        // send eth
__CoverageEthealPromoTokenController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPromoTokenController.sol',50);
         __StatementCoverageEthealPromoTokenController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPromoTokenController.sol',3);
uint256 _stake = this.balance;
__CoverageEthealPromoTokenController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPromoTokenController.sol',51);
         __StatementCoverageEthealPromoTokenController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPromoTokenController.sol',4);
if (_stake > 0) {__BranchCoverageEthealPromoTokenController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPromoTokenController.sol',2,0);
__CoverageEthealPromoTokenController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPromoTokenController.sol',52);
            _controller.transfer(_stake);
        }else { __BranchCoverageEthealPromoTokenController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPromoTokenController.sol',2,1);}


        // send tokens
__CoverageEthealPromoTokenController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPromoTokenController.sol',56);
         __StatementCoverageEthealPromoTokenController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPromoTokenController.sol',5);
_stake = ethealPromoToken.balanceOf(this);
__CoverageEthealPromoTokenController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPromoTokenController.sol',57);
         __StatementCoverageEthealPromoTokenController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPromoTokenController.sol',6);
if (_stake > 0) {__BranchCoverageEthealPromoTokenController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPromoTokenController.sol',3,0);
__CoverageEthealPromoTokenController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPromoTokenController.sol',58);
            ethealPromoToken.transfer(_controller, _stake);
        }else { __BranchCoverageEthealPromoTokenController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPromoTokenController.sol',3,1);}

    }

    /// @notice set the crowdsale contract: we will set the bonus on this contract
    function setCrowdsale(address _crowdsale) public onlyOwner {__FunctionCoverageEthealPromoTokenController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPromoTokenController.sol',3);

__CoverageEthealPromoTokenController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPromoTokenController.sol',64);
        __AssertPreCoverageEthealPromoTokenController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPromoTokenController.sol',4);
 __StatementCoverageEthealPromoTokenController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPromoTokenController.sol',7);
require(_crowdsale != address(0));__AssertPostCoverageEthealPromoTokenController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPromoTokenController.sol',4);


__CoverageEthealPromoTokenController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPromoTokenController.sol',66);
         __StatementCoverageEthealPromoTokenController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPromoTokenController.sol',8);
crowdsale = iEthealSale(_crowdsale);
    }

    /// @notice set the token
    function setPromoToken(address _token) public onlyOwner {__FunctionCoverageEthealPromoTokenController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPromoTokenController.sol',4);

__CoverageEthealPromoTokenController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPromoTokenController.sol',71);
        __AssertPreCoverageEthealPromoTokenController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPromoTokenController.sol',5);
 __StatementCoverageEthealPromoTokenController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPromoTokenController.sol',9);
require(_token != address(0));__AssertPostCoverageEthealPromoTokenController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPromoTokenController.sol',5);


__CoverageEthealPromoTokenController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPromoTokenController.sol',73);
         __StatementCoverageEthealPromoTokenController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPromoTokenController.sol',10);
ethealPromoToken = ERC20MiniMe(_token);
    }


    ////////////////
    // Distribute tokens
    ////////////////

    /// @notice Distribute promo token
    function distributeToken(address _to, uint256 _amount) public onlyOwner {__FunctionCoverageEthealPromoTokenController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPromoTokenController.sol',5);

__CoverageEthealPromoTokenController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPromoTokenController.sol',83);
         __StatementCoverageEthealPromoTokenController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPromoTokenController.sol',11);
distributeTokenInternal(_to, _amount);
    }

    /// @notice Distribute promo token for multiple addresses
    function distributeManyToken(address[] _to, uint256 _amount) external onlyOwner {__FunctionCoverageEthealPromoTokenController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPromoTokenController.sol',6);

__CoverageEthealPromoTokenController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPromoTokenController.sol',88);
         __StatementCoverageEthealPromoTokenController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPromoTokenController.sol',12);
for (uint256 i=0; i<_to.length; i++) {
__CoverageEthealPromoTokenController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPromoTokenController.sol',89);
             __StatementCoverageEthealPromoTokenController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPromoTokenController.sol',13);
distributeTokenInternal(_to[i], _amount);
        }
    }

    /// @notice Internal function for generation, no check for faster mass action
    function distributeTokenInternal(address _to, uint256 _amount) internal {__FunctionCoverageEthealPromoTokenController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPromoTokenController.sol',7);

__CoverageEthealPromoTokenController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPromoTokenController.sol',95);
        ethealPromoToken.generateTokens(_to, _amount);
    }

    /// @notice burn promo token
    function burnToken(address _where, uint256 _amount) public onlyOwner {__FunctionCoverageEthealPromoTokenController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPromoTokenController.sol',8);

__CoverageEthealPromoTokenController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPromoTokenController.sol',100);
        __AssertPreCoverageEthealPromoTokenController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPromoTokenController.sol',6);
 __StatementCoverageEthealPromoTokenController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPromoTokenController.sol',14);
require(ethealPromoToken.destroyTokens(_where, _amount));__AssertPostCoverageEthealPromoTokenController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPromoTokenController.sol',6);

    }

    /// @notice burn promo token on multiple addresses
    function burnManyToken(address[] _where, uint256 _amount) external onlyOwner {__FunctionCoverageEthealPromoTokenController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPromoTokenController.sol',9);

__CoverageEthealPromoTokenController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPromoTokenController.sol',105);
         __StatementCoverageEthealPromoTokenController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPromoTokenController.sol',15);
for (uint256 i=0; i<_where.length; i++) {
__CoverageEthealPromoTokenController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPromoTokenController.sol',106);
             __StatementCoverageEthealPromoTokenController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPromoTokenController.sol',16);
burnToken(_where[i], _amount);
        }
    }


    ////////////////
    // MiniMe Controller functions
    ////////////////

    /// @notice No eth payment to the token contract
    function proxyPayment(address) payable public returns (bool) {__FunctionCoverageEthealPromoTokenController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPromoTokenController.sol',10);

__CoverageEthealPromoTokenController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPromoTokenController.sol',117);
         __StatementCoverageEthealPromoTokenController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPromoTokenController.sol',17);
revert();
    }

    /// @notice If promo token is sent back, set promo bonus for the _from address
    function onTransfer(address _from, address _to, uint256 _amount) public returns (bool) {__FunctionCoverageEthealPromoTokenController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPromoTokenController.sol',11);

__CoverageEthealPromoTokenController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPromoTokenController.sol',122);
         __StatementCoverageEthealPromoTokenController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPromoTokenController.sol',18);
if (!paused && _amount > 0 && crowdsale != address(0) && (_to == address(1) || _to == address(this) || _to == address(crowdsale))) {__BranchCoverageEthealPromoTokenController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPromoTokenController.sol',7,0);
__CoverageEthealPromoTokenController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPromoTokenController.sol',123);
            crowdsale.setPromoBonus(_from);
        }else { __BranchCoverageEthealPromoTokenController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPromoTokenController.sol',7,1);}


__CoverageEthealPromoTokenController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPromoTokenController.sol',126);
         __StatementCoverageEthealPromoTokenController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPromoTokenController.sol',19);
return !paused;
    }

    function onApprove(address, address, uint256) public returns (bool) {__FunctionCoverageEthealPromoTokenController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPromoTokenController.sol',12);

__CoverageEthealPromoTokenController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPromoTokenController.sol',130);
         __StatementCoverageEthealPromoTokenController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPromoTokenController.sol',20);
return !paused;
    }

    /// @notice Retrieve mistakenly sent tokens (other than the etheal token) from the token contract 
    function claimTokenTokens(address _token) public onlyOwner {__FunctionCoverageEthealPromoTokenController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPromoTokenController.sol',13);

__CoverageEthealPromoTokenController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPromoTokenController.sol',135);
        __AssertPreCoverageEthealPromoTokenController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPromoTokenController.sol',8);
 __StatementCoverageEthealPromoTokenController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPromoTokenController.sol',21);
require(_token != address(ethealPromoToken));__AssertPostCoverageEthealPromoTokenController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPromoTokenController.sol',8);


__CoverageEthealPromoTokenController('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPromoTokenController.sol',137);
        ethealPromoToken.claimTokens(_token);
    }
}