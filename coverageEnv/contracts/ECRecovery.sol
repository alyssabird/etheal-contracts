pragma solidity ^0.4.18;


/**
 * @title Eliptic curve signature operations
 *
 * @dev Based on https://gist.github.com/axic/5b33912c6f61ae6fd96d6c4a47afde6d
 */

library ECRecovery {event __CoverageECRecovery(string fileName, uint256 lineNumber);
event __FunctionCoverageECRecovery(string fileName, uint256 fnId);
event __StatementCoverageECRecovery(string fileName, uint256 statementId);
event __BranchCoverageECRecovery(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageECRecovery(string fileName, uint256 branchId);
event __AssertPostCoverageECRecovery(string fileName, uint256 branchId);


  /**
   * @dev Recover signer address from a message by using his signature
   * @param hash bytes32 message, the hash is the signed message. What is recovered is the signer address.
   * @param sig bytes signature, the signature is generated using web3.eth.sign()
   */
  function recover(bytes32 hash, bytes sig) public  returns (address) {__FunctionCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/ECRecovery.sol',1);

__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/ECRecovery.sol',18);
    bytes32 r;
__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/ECRecovery.sol',19);
    bytes32 s;
__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/ECRecovery.sol',20);
    uint8 v;

    //Check the signature length
__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/ECRecovery.sol',23);
     __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/ECRecovery.sol',1);
if (sig.length != 65) {__BranchCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/ECRecovery.sol',1,0);
__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/ECRecovery.sol',24);
       __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/ECRecovery.sol',2);
return (address(0));
    }else { __BranchCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/ECRecovery.sol',1,1);}


    // Divide the signature in r, s and v variables
__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/ECRecovery.sol',28);
    assembly {
      r := mload(add(sig, 32))
      s := mload(add(sig, 64))
      v := byte(0, mload(add(sig, 96)))
    }

    // Version of signature should be 27 or 28, but 0 and 1 are also possible versions
__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/ECRecovery.sol',35);
     __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/ECRecovery.sol',3);
if (v < 27) {__BranchCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/ECRecovery.sol',2,0);
__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/ECRecovery.sol',36);
       __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/ECRecovery.sol',4);
v += 27;
    }else { __BranchCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/ECRecovery.sol',2,1);}


    // If the version is correct return the signer address
__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/ECRecovery.sol',40);
     __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/ECRecovery.sol',5);
if (v != 27 && v != 28) {__BranchCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/ECRecovery.sol',3,0);
__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/ECRecovery.sol',41);
       __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/ECRecovery.sol',6);
return (address(0));
    } else {__BranchCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/ECRecovery.sol',3,1);
__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/ECRecovery.sol',43);
       __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/ECRecovery.sol',7);
return ecrecover(hash, v, r, s);
    }
  }

}