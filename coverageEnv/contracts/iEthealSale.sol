pragma solidity ^0.4.17;

/// @dev Crowdsale interface for Etheal Normal Sale, functions needed from outside.
contract iEthealSale {event __CoverageiEthealSale(string fileName, uint256 lineNumber);
event __FunctionCoverageiEthealSale(string fileName, uint256 fnId);
event __StatementCoverageiEthealSale(string fileName, uint256 statementId);
event __BranchCoverageiEthealSale(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageiEthealSale(string fileName, uint256 branchId);
event __AssertPostCoverageiEthealSale(string fileName, uint256 branchId);

    uint256 public whitelistThreshold;
    mapping (address => uint256) public stakes;
    function setPromoBonus(address _investor) public;
    function buyTokens(address _beneficiary) public payable;
    function depositEth(address _beneficiary, uint256 _time, bytes _whitelistSign) public payable;
    function depositOffchain(address _beneficiary, uint256 _amount, uint256 _time) public;
    function hasEnded() public  returns (bool);
}