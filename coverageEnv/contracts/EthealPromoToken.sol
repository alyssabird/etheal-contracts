pragma solidity ^0.4.17;

import "./MiniMeToken.sol";

/**
 * @title EthealToken
 * @dev Basic MiniMe token
 */
contract EthealPromoToken is MiniMeToken {event __CoverageEthealPromoToken(string fileName, uint256 lineNumber);
event __FunctionCoverageEthealPromoToken(string fileName, uint256 fnId);
event __StatementCoverageEthealPromoToken(string fileName, uint256 statementId);
event __BranchCoverageEthealPromoToken(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageEthealPromoToken(string fileName, uint256 branchId);
event __AssertPostCoverageEthealPromoToken(string fileName, uint256 branchId);

    function EthealPromoToken(address _controller, address _tokenFactory) 
        MiniMeToken(
            _tokenFactory,
            0x0,                // no parent token
            0,                  // no snapshot block number from parent
            "Etheal PROMO Token",     // Token name
            18,                 // Decimals
            "HealP",             // Symbol
            true                // Enable transfers
        )
    {__FunctionCoverageEthealPromoToken('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPromoToken.sol',1);

__CoverageEthealPromoToken('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPromoToken.sol',21);
         __StatementCoverageEthealPromoToken('/Users/tikonoff/projects/etheal-contracts/contracts/EthealPromoToken.sol',1);
changeController(_controller);
    }
}