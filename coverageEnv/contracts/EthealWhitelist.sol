pragma solidity ^0.4.17;

import "./Ownable.sol";
import "./ECRecovery.sol";

/**
 * @title EthealWhitelist
 * @author thesved
 * @notice EthealWhitelist contract which handles KYC
 */
contract EthealWhitelist is Ownable {event __CoverageEthealWhitelist(string fileName, uint256 lineNumber);
event __FunctionCoverageEthealWhitelist(string fileName, uint256 fnId);
event __StatementCoverageEthealWhitelist(string fileName, uint256 statementId);
event __BranchCoverageEthealWhitelist(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageEthealWhitelist(string fileName, uint256 branchId);
event __AssertPostCoverageEthealWhitelist(string fileName, uint256 branchId);

    using ECRecovery for bytes32;

    // signer address for offchain whitelist signing
    address public signer;

    // storing whitelisted addresses
    mapping(address => bool) public isWhitelisted;

    event WhitelistSet(address indexed _address, bool _state);

    ////////////////
    // Constructor
    ////////////////
    function EthealWhitelist(address _signer) {__FunctionCoverageEthealWhitelist('/Users/tikonoff/projects/etheal-contracts/contracts/EthealWhitelist.sol',1);

__CoverageEthealWhitelist('/Users/tikonoff/projects/etheal-contracts/contracts/EthealWhitelist.sol',26);
        __AssertPreCoverageEthealWhitelist('/Users/tikonoff/projects/etheal-contracts/contracts/EthealWhitelist.sol',1);
 __StatementCoverageEthealWhitelist('/Users/tikonoff/projects/etheal-contracts/contracts/EthealWhitelist.sol',1);
require(_signer != address(0));__AssertPostCoverageEthealWhitelist('/Users/tikonoff/projects/etheal-contracts/contracts/EthealWhitelist.sol',1);


__CoverageEthealWhitelist('/Users/tikonoff/projects/etheal-contracts/contracts/EthealWhitelist.sol',28);
         __StatementCoverageEthealWhitelist('/Users/tikonoff/projects/etheal-contracts/contracts/EthealWhitelist.sol',2);
signer = _signer;
    }

    /// @notice set signing address after deployment
    function setSigner(address _signer) public onlyOwner {__FunctionCoverageEthealWhitelist('/Users/tikonoff/projects/etheal-contracts/contracts/EthealWhitelist.sol',2);

__CoverageEthealWhitelist('/Users/tikonoff/projects/etheal-contracts/contracts/EthealWhitelist.sol',33);
        __AssertPreCoverageEthealWhitelist('/Users/tikonoff/projects/etheal-contracts/contracts/EthealWhitelist.sol',2);
 __StatementCoverageEthealWhitelist('/Users/tikonoff/projects/etheal-contracts/contracts/EthealWhitelist.sol',3);
require(_signer != address(0));__AssertPostCoverageEthealWhitelist('/Users/tikonoff/projects/etheal-contracts/contracts/EthealWhitelist.sol',2);


__CoverageEthealWhitelist('/Users/tikonoff/projects/etheal-contracts/contracts/EthealWhitelist.sol',35);
         __StatementCoverageEthealWhitelist('/Users/tikonoff/projects/etheal-contracts/contracts/EthealWhitelist.sol',4);
signer = _signer;
    }

    ////////////////
    // Whitelisting: only owner
    ////////////////

    /// @notice Set whitelist state for an address.
    function setWhitelist(address _addr, bool _state) public onlyOwner {__FunctionCoverageEthealWhitelist('/Users/tikonoff/projects/etheal-contracts/contracts/EthealWhitelist.sol',3);

__CoverageEthealWhitelist('/Users/tikonoff/projects/etheal-contracts/contracts/EthealWhitelist.sol',44);
        __AssertPreCoverageEthealWhitelist('/Users/tikonoff/projects/etheal-contracts/contracts/EthealWhitelist.sol',3);
 __StatementCoverageEthealWhitelist('/Users/tikonoff/projects/etheal-contracts/contracts/EthealWhitelist.sol',5);
require(_addr != address(0));__AssertPostCoverageEthealWhitelist('/Users/tikonoff/projects/etheal-contracts/contracts/EthealWhitelist.sol',3);

__CoverageEthealWhitelist('/Users/tikonoff/projects/etheal-contracts/contracts/EthealWhitelist.sol',45);
         __StatementCoverageEthealWhitelist('/Users/tikonoff/projects/etheal-contracts/contracts/EthealWhitelist.sol',6);
isWhitelisted[_addr] = _state;
__CoverageEthealWhitelist('/Users/tikonoff/projects/etheal-contracts/contracts/EthealWhitelist.sol',46);
         __StatementCoverageEthealWhitelist('/Users/tikonoff/projects/etheal-contracts/contracts/EthealWhitelist.sol',7);
WhitelistSet(_addr, _state);
    }

    /// @notice Set whitelist state for multiple addresses
    function setManyWhitelist(address[] _addr, bool _state) public onlyOwner {__FunctionCoverageEthealWhitelist('/Users/tikonoff/projects/etheal-contracts/contracts/EthealWhitelist.sol',4);

__CoverageEthealWhitelist('/Users/tikonoff/projects/etheal-contracts/contracts/EthealWhitelist.sol',51);
         __StatementCoverageEthealWhitelist('/Users/tikonoff/projects/etheal-contracts/contracts/EthealWhitelist.sol',8);
for (uint256 i = 0; i < _addr.length; i++) {
__CoverageEthealWhitelist('/Users/tikonoff/projects/etheal-contracts/contracts/EthealWhitelist.sol',52);
             __StatementCoverageEthealWhitelist('/Users/tikonoff/projects/etheal-contracts/contracts/EthealWhitelist.sol',9);
setWhitelist(_addr[i], _state);
        }
    }

    /// @notice offchain whitelist check
    function isOffchainWhitelisted(address _addr, bytes _sig) public  returns (bool) {__FunctionCoverageEthealWhitelist('/Users/tikonoff/projects/etheal-contracts/contracts/EthealWhitelist.sol',5);

__CoverageEthealWhitelist('/Users/tikonoff/projects/etheal-contracts/contracts/EthealWhitelist.sol',58);
         __StatementCoverageEthealWhitelist('/Users/tikonoff/projects/etheal-contracts/contracts/EthealWhitelist.sol',10);
bytes32 hash = keccak256("\x19Ethereum Signed Message:\n20",_addr);
__CoverageEthealWhitelist('/Users/tikonoff/projects/etheal-contracts/contracts/EthealWhitelist.sol',59);
         __StatementCoverageEthealWhitelist('/Users/tikonoff/projects/etheal-contracts/contracts/EthealWhitelist.sol',11);
return hash.recover(_sig) == signer;
    }
}