pragma solidity ^0.4.17;

contract Controlled {event __CoverageControlled(string fileName, uint256 lineNumber);
event __FunctionCoverageControlled(string fileName, uint256 fnId);
event __StatementCoverageControlled(string fileName, uint256 statementId);
event __BranchCoverageControlled(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageControlled(string fileName, uint256 branchId);
event __AssertPostCoverageControlled(string fileName, uint256 branchId);

    /// @notice The address of the controller is the only address that can call
    ///  a function with this modifier
    modifier onlyController {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/Controlled.sol',1);
 __AssertPreCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/Controlled.sol',1);
 __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/Controlled.sol',1);
require(msg.sender == controller);__AssertPostCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/Controlled.sol',1);
 _; }

    address public controller;

    function Controlled() public {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/Controlled.sol',2);
  __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/Controlled.sol',2);
controller = msg.sender;}

    /// @notice Changes the controller of the contract
    /// @param _newController The new controller of the contract
    function changeController(address _newController) public onlyController {__FunctionCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/Controlled.sol',3);

__CoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/Controlled.sol',15);
         __StatementCoverageControlled('/Users/tikonoff/projects/etheal-contracts/contracts/Controlled.sol',3);
controller = _newController;
    }
}