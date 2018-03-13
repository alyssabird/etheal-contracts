pragma solidity ^0.4.17;


import "./Ownable.sol";


/**
 * @title Pausable
 * @dev Base contract which allows children to implement an emergency stop mechanism.
 */
contract Pausable is Ownable {event __CoveragePausable(string fileName, uint256 lineNumber);
event __FunctionCoveragePausable(string fileName, uint256 fnId);
event __StatementCoveragePausable(string fileName, uint256 statementId);
event __BranchCoveragePausable(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoveragePausable(string fileName, uint256 branchId);
event __AssertPostCoveragePausable(string fileName, uint256 branchId);

  event Pause();
  event Unpause();

  bool public paused = false;


  /**
   * @dev Modifier to make a function callable only when the contract is not paused.
   */
  modifier whenNotPaused() {__FunctionCoveragePausable('/Users/tikonoff/projects/etheal-contracts/contracts/Pausable.sol',1);

__CoveragePausable('/Users/tikonoff/projects/etheal-contracts/contracts/Pausable.sol',22);
    __AssertPreCoveragePausable('/Users/tikonoff/projects/etheal-contracts/contracts/Pausable.sol',1);
 __StatementCoveragePausable('/Users/tikonoff/projects/etheal-contracts/contracts/Pausable.sol',1);
require(!paused);__AssertPostCoveragePausable('/Users/tikonoff/projects/etheal-contracts/contracts/Pausable.sol',1);

__CoveragePausable('/Users/tikonoff/projects/etheal-contracts/contracts/Pausable.sol',23);
    _;
  }

  /**
   * @dev Modifier to make a function callable only when the contract is paused.
   */
  modifier whenPaused() {__FunctionCoveragePausable('/Users/tikonoff/projects/etheal-contracts/contracts/Pausable.sol',2);

__CoveragePausable('/Users/tikonoff/projects/etheal-contracts/contracts/Pausable.sol',30);
    __AssertPreCoveragePausable('/Users/tikonoff/projects/etheal-contracts/contracts/Pausable.sol',2);
 __StatementCoveragePausable('/Users/tikonoff/projects/etheal-contracts/contracts/Pausable.sol',2);
require(paused);__AssertPostCoveragePausable('/Users/tikonoff/projects/etheal-contracts/contracts/Pausable.sol',2);

__CoveragePausable('/Users/tikonoff/projects/etheal-contracts/contracts/Pausable.sol',31);
    _;
  }

  /**
   * @dev called by the owner to pause, triggers stopped state
   */
  function pause() onlyOwner whenNotPaused public {__FunctionCoveragePausable('/Users/tikonoff/projects/etheal-contracts/contracts/Pausable.sol',3);

__CoveragePausable('/Users/tikonoff/projects/etheal-contracts/contracts/Pausable.sol',38);
     __StatementCoveragePausable('/Users/tikonoff/projects/etheal-contracts/contracts/Pausable.sol',3);
paused = true;
__CoveragePausable('/Users/tikonoff/projects/etheal-contracts/contracts/Pausable.sol',39);
     __StatementCoveragePausable('/Users/tikonoff/projects/etheal-contracts/contracts/Pausable.sol',4);
Pause();
  }

  /**
   * @dev called by the owner to unpause, returns to normal state
   */
  function unpause() onlyOwner whenPaused public {__FunctionCoveragePausable('/Users/tikonoff/projects/etheal-contracts/contracts/Pausable.sol',4);

__CoveragePausable('/Users/tikonoff/projects/etheal-contracts/contracts/Pausable.sol',46);
     __StatementCoveragePausable('/Users/tikonoff/projects/etheal-contracts/contracts/Pausable.sol',5);
paused = false;
__CoveragePausable('/Users/tikonoff/projects/etheal-contracts/contracts/Pausable.sol',47);
     __StatementCoveragePausable('/Users/tikonoff/projects/etheal-contracts/contracts/Pausable.sol',6);
Unpause();
  }
}