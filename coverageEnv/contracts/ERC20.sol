pragma solidity ^0.4.17;

/**
 * @title ERC20
 * @dev ERC20 interface
 */
contract ERC20 {event __CoverageERC20(string fileName, uint256 lineNumber);
event __FunctionCoverageERC20(string fileName, uint256 fnId);
event __StatementCoverageERC20(string fileName, uint256 statementId);
event __BranchCoverageERC20(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageERC20(string fileName, uint256 branchId);
event __AssertPostCoverageERC20(string fileName, uint256 branchId);

    function balanceOf(address who) public  returns (uint256);
    function transfer(address to, uint256 value) public returns (bool);
    function allowance(address owner, address spender) public  returns (uint256);
    function transferFrom(address from, address to, uint256 value) public returns (bool);
    function approve(address spender, uint256 value) public returns (bool);
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
}