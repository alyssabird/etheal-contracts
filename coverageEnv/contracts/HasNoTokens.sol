pragma solidity ^0.4.17;

import "./Ownable.sol";
import "./ERC20.sol";

/**
 * @title claim accidentally sent tokens
 */
contract HasNoTokens is Ownable {event __CoverageHasNoTokens(string fileName, uint256 lineNumber);
event __FunctionCoverageHasNoTokens(string fileName, uint256 fnId);
event __StatementCoverageHasNoTokens(string fileName, uint256 statementId);
event __BranchCoverageHasNoTokens(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageHasNoTokens(string fileName, uint256 branchId);
event __AssertPostCoverageHasNoTokens(string fileName, uint256 branchId);

    event ExtractedTokens(address indexed _token, address indexed _claimer, uint _amount);

    /// @notice This method can be used to extract mistakenly
    ///  sent tokens to this contract.
    /// @param _token The address of the token contract that you want to recover
    ///  set to 0 in case you want to extract ether.
    /// @param _claimer Address that tokens will be send to
    function extractTokens(address _token, address _claimer) onlyOwner public {__FunctionCoverageHasNoTokens('/Users/tikonoff/projects/etheal-contracts/contracts/HasNoTokens.sol',1);

__CoverageHasNoTokens('/Users/tikonoff/projects/etheal-contracts/contracts/HasNoTokens.sol',18);
         __StatementCoverageHasNoTokens('/Users/tikonoff/projects/etheal-contracts/contracts/HasNoTokens.sol',1);
if (_token == 0x0) {__BranchCoverageHasNoTokens('/Users/tikonoff/projects/etheal-contracts/contracts/HasNoTokens.sol',1,0);
__CoverageHasNoTokens('/Users/tikonoff/projects/etheal-contracts/contracts/HasNoTokens.sol',19);
            _claimer.transfer(this.balance);
__CoverageHasNoTokens('/Users/tikonoff/projects/etheal-contracts/contracts/HasNoTokens.sol',20);
             __StatementCoverageHasNoTokens('/Users/tikonoff/projects/etheal-contracts/contracts/HasNoTokens.sol',2);
return;
        }else { __BranchCoverageHasNoTokens('/Users/tikonoff/projects/etheal-contracts/contracts/HasNoTokens.sol',1,1);}


__CoverageHasNoTokens('/Users/tikonoff/projects/etheal-contracts/contracts/HasNoTokens.sol',23);
         __StatementCoverageHasNoTokens('/Users/tikonoff/projects/etheal-contracts/contracts/HasNoTokens.sol',3);
ERC20 token = ERC20(_token);
__CoverageHasNoTokens('/Users/tikonoff/projects/etheal-contracts/contracts/HasNoTokens.sol',24);
         __StatementCoverageHasNoTokens('/Users/tikonoff/projects/etheal-contracts/contracts/HasNoTokens.sol',4);
uint balance = token.balanceOf(this);
__CoverageHasNoTokens('/Users/tikonoff/projects/etheal-contracts/contracts/HasNoTokens.sol',25);
        token.transfer(_claimer, balance);
__CoverageHasNoTokens('/Users/tikonoff/projects/etheal-contracts/contracts/HasNoTokens.sol',26);
         __StatementCoverageHasNoTokens('/Users/tikonoff/projects/etheal-contracts/contracts/HasNoTokens.sol',5);
ExtractedTokens(_token, _claimer, balance);
    }
}