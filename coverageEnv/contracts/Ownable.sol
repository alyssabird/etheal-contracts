pragma solidity ^0.4.17;


/**
 * @title Ownable
 * @dev The Ownable contract has an owner address, and provides basic authorization control
 * functions, this simplifies the implementation of "user permissions".
 */
contract Ownable {event __CoverageOwnable(string fileName, uint256 lineNumber);
event __FunctionCoverageOwnable(string fileName, uint256 fnId);
event __StatementCoverageOwnable(string fileName, uint256 statementId);
event __BranchCoverageOwnable(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageOwnable(string fileName, uint256 branchId);
event __AssertPostCoverageOwnable(string fileName, uint256 branchId);

  address public owner;


  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);


  /**
   * @dev The Ownable constructor sets the original `owner` of the contract to the sender
   * account.
   */
  function Ownable() {__FunctionCoverageOwnable('/Users/tikonoff/projects/etheal-contracts/contracts/Ownable.sol',1);

__CoverageOwnable('/Users/tikonoff/projects/etheal-contracts/contracts/Ownable.sol',21);
     __StatementCoverageOwnable('/Users/tikonoff/projects/etheal-contracts/contracts/Ownable.sol',1);
owner = msg.sender;
  }


  /**
   * @dev Throws if called by any account other than the owner.
   */
  modifier onlyOwner() {__FunctionCoverageOwnable('/Users/tikonoff/projects/etheal-contracts/contracts/Ownable.sol',2);

__CoverageOwnable('/Users/tikonoff/projects/etheal-contracts/contracts/Ownable.sol',29);
    __AssertPreCoverageOwnable('/Users/tikonoff/projects/etheal-contracts/contracts/Ownable.sol',1);
 __StatementCoverageOwnable('/Users/tikonoff/projects/etheal-contracts/contracts/Ownable.sol',2);
require(msg.sender == owner);__AssertPostCoverageOwnable('/Users/tikonoff/projects/etheal-contracts/contracts/Ownable.sol',1);

__CoverageOwnable('/Users/tikonoff/projects/etheal-contracts/contracts/Ownable.sol',30);
    _;
  }


  /**
   * @dev Allows the current owner to transfer control of the contract to a newOwner.
   * @param newOwner The address to transfer ownership to.
   */
  function transferOwnership(address newOwner) onlyOwner public {__FunctionCoverageOwnable('/Users/tikonoff/projects/etheal-contracts/contracts/Ownable.sol',3);

__CoverageOwnable('/Users/tikonoff/projects/etheal-contracts/contracts/Ownable.sol',39);
    __AssertPreCoverageOwnable('/Users/tikonoff/projects/etheal-contracts/contracts/Ownable.sol',2);
 __StatementCoverageOwnable('/Users/tikonoff/projects/etheal-contracts/contracts/Ownable.sol',3);
require(newOwner != address(0));__AssertPostCoverageOwnable('/Users/tikonoff/projects/etheal-contracts/contracts/Ownable.sol',2);

__CoverageOwnable('/Users/tikonoff/projects/etheal-contracts/contracts/Ownable.sol',40);
     __StatementCoverageOwnable('/Users/tikonoff/projects/etheal-contracts/contracts/Ownable.sol',4);
OwnershipTransferred(owner, newOwner);
__CoverageOwnable('/Users/tikonoff/projects/etheal-contracts/contracts/Ownable.sol',41);
     __StatementCoverageOwnable('/Users/tikonoff/projects/etheal-contracts/contracts/Ownable.sol',5);
owner = newOwner;
  }

}