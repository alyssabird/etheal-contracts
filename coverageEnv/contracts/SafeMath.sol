pragma solidity ^0.4.17;


/**
 * @title SafeMath
 * @dev Math operations with safety checks that throw on error
 */
library SafeMath {event __CoverageSafeMath(string fileName, uint256 lineNumber);
event __FunctionCoverageSafeMath(string fileName, uint256 fnId);
event __StatementCoverageSafeMath(string fileName, uint256 statementId);
event __BranchCoverageSafeMath(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageSafeMath(string fileName, uint256 branchId);
event __AssertPostCoverageSafeMath(string fileName, uint256 branchId);

  function mul(uint256 a, uint256 b) internal  returns (uint256) {__FunctionCoverageSafeMath('/Users/tikonoff/projects/etheal-contracts/contracts/SafeMath.sol',1);

__CoverageSafeMath('/Users/tikonoff/projects/etheal-contracts/contracts/SafeMath.sol',10);
     __StatementCoverageSafeMath('/Users/tikonoff/projects/etheal-contracts/contracts/SafeMath.sol',1);
uint256 c = a * b;
__CoverageSafeMath('/Users/tikonoff/projects/etheal-contracts/contracts/SafeMath.sol',11);
    __AssertPreCoverageSafeMath('/Users/tikonoff/projects/etheal-contracts/contracts/SafeMath.sol',1);
 __StatementCoverageSafeMath('/Users/tikonoff/projects/etheal-contracts/contracts/SafeMath.sol',2);
assert(a == 0 || c / a == b);__AssertPostCoverageSafeMath('/Users/tikonoff/projects/etheal-contracts/contracts/SafeMath.sol',1);

__CoverageSafeMath('/Users/tikonoff/projects/etheal-contracts/contracts/SafeMath.sol',12);
     __StatementCoverageSafeMath('/Users/tikonoff/projects/etheal-contracts/contracts/SafeMath.sol',3);
return c;
  }

  function div(uint256 a, uint256 b) internal  returns (uint256) {__FunctionCoverageSafeMath('/Users/tikonoff/projects/etheal-contracts/contracts/SafeMath.sol',2);

    // assert(b > 0); // Solidity automatically throws when dividing by 0
__CoverageSafeMath('/Users/tikonoff/projects/etheal-contracts/contracts/SafeMath.sol',17);
     __StatementCoverageSafeMath('/Users/tikonoff/projects/etheal-contracts/contracts/SafeMath.sol',4);
uint256 c = a / b;
    // assert(a == b * c + a % b); // There is no case in which this doesn't hold
__CoverageSafeMath('/Users/tikonoff/projects/etheal-contracts/contracts/SafeMath.sol',19);
     __StatementCoverageSafeMath('/Users/tikonoff/projects/etheal-contracts/contracts/SafeMath.sol',5);
return c;
  }

  function sub(uint256 a, uint256 b) internal  returns (uint256) {__FunctionCoverageSafeMath('/Users/tikonoff/projects/etheal-contracts/contracts/SafeMath.sol',3);

__CoverageSafeMath('/Users/tikonoff/projects/etheal-contracts/contracts/SafeMath.sol',23);
    __AssertPreCoverageSafeMath('/Users/tikonoff/projects/etheal-contracts/contracts/SafeMath.sol',2);
 __StatementCoverageSafeMath('/Users/tikonoff/projects/etheal-contracts/contracts/SafeMath.sol',6);
assert(b <= a);__AssertPostCoverageSafeMath('/Users/tikonoff/projects/etheal-contracts/contracts/SafeMath.sol',2);

__CoverageSafeMath('/Users/tikonoff/projects/etheal-contracts/contracts/SafeMath.sol',24);
     __StatementCoverageSafeMath('/Users/tikonoff/projects/etheal-contracts/contracts/SafeMath.sol',7);
return a - b;
  }

  function add(uint256 a, uint256 b) internal  returns (uint256) {__FunctionCoverageSafeMath('/Users/tikonoff/projects/etheal-contracts/contracts/SafeMath.sol',4);

__CoverageSafeMath('/Users/tikonoff/projects/etheal-contracts/contracts/SafeMath.sol',28);
     __StatementCoverageSafeMath('/Users/tikonoff/projects/etheal-contracts/contracts/SafeMath.sol',8);
uint256 c = a + b;
__CoverageSafeMath('/Users/tikonoff/projects/etheal-contracts/contracts/SafeMath.sol',29);
    __AssertPreCoverageSafeMath('/Users/tikonoff/projects/etheal-contracts/contracts/SafeMath.sol',3);
 __StatementCoverageSafeMath('/Users/tikonoff/projects/etheal-contracts/contracts/SafeMath.sol',9);
assert(c >= a);__AssertPostCoverageSafeMath('/Users/tikonoff/projects/etheal-contracts/contracts/SafeMath.sol',3);

__CoverageSafeMath('/Users/tikonoff/projects/etheal-contracts/contracts/SafeMath.sol',30);
     __StatementCoverageSafeMath('/Users/tikonoff/projects/etheal-contracts/contracts/SafeMath.sol',10);
return c;
  }
}