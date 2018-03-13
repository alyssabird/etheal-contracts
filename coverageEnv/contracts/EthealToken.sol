pragma solidity ^0.4.17;

import "./MiniMeToken.sol";

/**
 * @title EthealToken
 * @dev Basic MiniMe token
 */
contract EthealToken is MiniMeToken {event __CoverageEthealToken(string fileName, uint256 lineNumber);
event __FunctionCoverageEthealToken(string fileName, uint256 fnId);
event __StatementCoverageEthealToken(string fileName, uint256 statementId);
event __BranchCoverageEthealToken(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageEthealToken(string fileName, uint256 branchId);
event __AssertPostCoverageEthealToken(string fileName, uint256 branchId);

    function EthealToken(address _controller, address _tokenFactory) 
        MiniMeToken(
            _tokenFactory,
            0x0,                // no parent token
            0,                  // no snapshot block number from parent
            "Etheal Token",     // Token name
            18,                 // Decimals
            "HEAL",             // Symbol
            true                // Enable transfers
        )
    {__FunctionCoverageEthealToken('/Users/tikonoff/projects/etheal-contracts/contracts/EthealToken.sol',1);

__CoverageEthealToken('/Users/tikonoff/projects/etheal-contracts/contracts/EthealToken.sol',21);
         __StatementCoverageEthealToken('/Users/tikonoff/projects/etheal-contracts/contracts/EthealToken.sol',1);
changeController(_controller);
    }
}