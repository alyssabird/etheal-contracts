pragma solidity ^0.4.17;

import './ERC20MiniMe.sol';
import './Ownable.sol';
import './SafeMath.sol';

/**
 * @title TokenVesting
 * @dev A token holder contract that can release its token balance gradually like a
 * typical vesting scheme, with a cliff and vesting period. Optionally revocable by the
 * owner.
 */
contract TokenVesting is Ownable {event __CoverageTokenVesting(string fileName, uint256 lineNumber);
event __FunctionCoverageTokenVesting(string fileName, uint256 fnId);
event __StatementCoverageTokenVesting(string fileName, uint256 statementId);
event __BranchCoverageTokenVesting(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageTokenVesting(string fileName, uint256 branchId);
event __AssertPostCoverageTokenVesting(string fileName, uint256 branchId);

  using SafeMath for uint256;

  event Released(uint256 amount);
  event Revoked();

  // beneficiary of tokens after they are released
  address public beneficiary;

  uint256 public cliff;
  uint256 public start;
  uint256 public duration;

  bool public revocable;

  mapping (address => uint256) public released;
  mapping (address => bool) public revoked;

  /**
   * @dev Creates a vesting contract that vests its balance of any ERC20 token to the
   * _beneficiary, gradually in a linear fashion until _start + _duration. By then all
   * of the balance will have vested.
   * @param _beneficiary address of the beneficiary to whom vested tokens are transferred
   * @param _cliff duration in seconds of the cliff in which tokens will begin to vest
   * @param _duration duration in seconds of the period in which the tokens will vest
   * @param _revocable whether the vesting is revocable or not
   */
  function TokenVesting(address _beneficiary, uint256 _start, uint256 _cliff, uint256 _duration, bool _revocable) {__FunctionCoverageTokenVesting('/Users/tikonoff/projects/etheal-contracts/contracts/TokenVesting.sol',1);

__CoverageTokenVesting('/Users/tikonoff/projects/etheal-contracts/contracts/TokenVesting.sol',41);
    __AssertPreCoverageTokenVesting('/Users/tikonoff/projects/etheal-contracts/contracts/TokenVesting.sol',1);
 __StatementCoverageTokenVesting('/Users/tikonoff/projects/etheal-contracts/contracts/TokenVesting.sol',1);
require(_beneficiary != address(0));__AssertPostCoverageTokenVesting('/Users/tikonoff/projects/etheal-contracts/contracts/TokenVesting.sol',1);

__CoverageTokenVesting('/Users/tikonoff/projects/etheal-contracts/contracts/TokenVesting.sol',42);
    __AssertPreCoverageTokenVesting('/Users/tikonoff/projects/etheal-contracts/contracts/TokenVesting.sol',2);
 __StatementCoverageTokenVesting('/Users/tikonoff/projects/etheal-contracts/contracts/TokenVesting.sol',2);
require(_cliff <= _duration);__AssertPostCoverageTokenVesting('/Users/tikonoff/projects/etheal-contracts/contracts/TokenVesting.sol',2);


__CoverageTokenVesting('/Users/tikonoff/projects/etheal-contracts/contracts/TokenVesting.sol',44);
     __StatementCoverageTokenVesting('/Users/tikonoff/projects/etheal-contracts/contracts/TokenVesting.sol',3);
beneficiary = _beneficiary;
__CoverageTokenVesting('/Users/tikonoff/projects/etheal-contracts/contracts/TokenVesting.sol',45);
     __StatementCoverageTokenVesting('/Users/tikonoff/projects/etheal-contracts/contracts/TokenVesting.sol',4);
revocable = _revocable;
__CoverageTokenVesting('/Users/tikonoff/projects/etheal-contracts/contracts/TokenVesting.sol',46);
     __StatementCoverageTokenVesting('/Users/tikonoff/projects/etheal-contracts/contracts/TokenVesting.sol',5);
duration = _duration;
__CoverageTokenVesting('/Users/tikonoff/projects/etheal-contracts/contracts/TokenVesting.sol',47);
     __StatementCoverageTokenVesting('/Users/tikonoff/projects/etheal-contracts/contracts/TokenVesting.sol',6);
cliff = _start.add(_cliff);
__CoverageTokenVesting('/Users/tikonoff/projects/etheal-contracts/contracts/TokenVesting.sol',48);
     __StatementCoverageTokenVesting('/Users/tikonoff/projects/etheal-contracts/contracts/TokenVesting.sol',7);
start = _start;
  }

  /**
   * @notice Transfers vested tokens to beneficiary.
   * @param token ERC20 token which is being vested
   */
  function release(ERC20MiniMe token) public {__FunctionCoverageTokenVesting('/Users/tikonoff/projects/etheal-contracts/contracts/TokenVesting.sol',2);

__CoverageTokenVesting('/Users/tikonoff/projects/etheal-contracts/contracts/TokenVesting.sol',56);
     __StatementCoverageTokenVesting('/Users/tikonoff/projects/etheal-contracts/contracts/TokenVesting.sol',8);
uint256 unreleased = releasableAmount(token);

__CoverageTokenVesting('/Users/tikonoff/projects/etheal-contracts/contracts/TokenVesting.sol',58);
    __AssertPreCoverageTokenVesting('/Users/tikonoff/projects/etheal-contracts/contracts/TokenVesting.sol',3);
 __StatementCoverageTokenVesting('/Users/tikonoff/projects/etheal-contracts/contracts/TokenVesting.sol',9);
require(unreleased > 0);__AssertPostCoverageTokenVesting('/Users/tikonoff/projects/etheal-contracts/contracts/TokenVesting.sol',3);


__CoverageTokenVesting('/Users/tikonoff/projects/etheal-contracts/contracts/TokenVesting.sol',60);
     __StatementCoverageTokenVesting('/Users/tikonoff/projects/etheal-contracts/contracts/TokenVesting.sol',10);
released[token] = released[token].add(unreleased);

__CoverageTokenVesting('/Users/tikonoff/projects/etheal-contracts/contracts/TokenVesting.sol',62);
    __AssertPreCoverageTokenVesting('/Users/tikonoff/projects/etheal-contracts/contracts/TokenVesting.sol',4);
 __StatementCoverageTokenVesting('/Users/tikonoff/projects/etheal-contracts/contracts/TokenVesting.sol',11);
require(token.transfer(beneficiary, unreleased));__AssertPostCoverageTokenVesting('/Users/tikonoff/projects/etheal-contracts/contracts/TokenVesting.sol',4);


__CoverageTokenVesting('/Users/tikonoff/projects/etheal-contracts/contracts/TokenVesting.sol',64);
     __StatementCoverageTokenVesting('/Users/tikonoff/projects/etheal-contracts/contracts/TokenVesting.sol',12);
Released(unreleased);
  }

  /**
   * @notice Allows the owner to revoke the vesting. Tokens already vested
   * remain in the contract, the rest are returned to the owner.
   * @param token ERC20MiniMe token which is being vested
   */
  function revoke(ERC20MiniMe token) public onlyOwner {__FunctionCoverageTokenVesting('/Users/tikonoff/projects/etheal-contracts/contracts/TokenVesting.sol',3);

__CoverageTokenVesting('/Users/tikonoff/projects/etheal-contracts/contracts/TokenVesting.sol',73);
    __AssertPreCoverageTokenVesting('/Users/tikonoff/projects/etheal-contracts/contracts/TokenVesting.sol',5);
 __StatementCoverageTokenVesting('/Users/tikonoff/projects/etheal-contracts/contracts/TokenVesting.sol',13);
require(revocable);__AssertPostCoverageTokenVesting('/Users/tikonoff/projects/etheal-contracts/contracts/TokenVesting.sol',5);

__CoverageTokenVesting('/Users/tikonoff/projects/etheal-contracts/contracts/TokenVesting.sol',74);
    __AssertPreCoverageTokenVesting('/Users/tikonoff/projects/etheal-contracts/contracts/TokenVesting.sol',6);
 __StatementCoverageTokenVesting('/Users/tikonoff/projects/etheal-contracts/contracts/TokenVesting.sol',14);
require(!revoked[token]);__AssertPostCoverageTokenVesting('/Users/tikonoff/projects/etheal-contracts/contracts/TokenVesting.sol',6);


__CoverageTokenVesting('/Users/tikonoff/projects/etheal-contracts/contracts/TokenVesting.sol',76);
     __StatementCoverageTokenVesting('/Users/tikonoff/projects/etheal-contracts/contracts/TokenVesting.sol',15);
uint256 balance = token.balanceOf(this);

__CoverageTokenVesting('/Users/tikonoff/projects/etheal-contracts/contracts/TokenVesting.sol',78);
     __StatementCoverageTokenVesting('/Users/tikonoff/projects/etheal-contracts/contracts/TokenVesting.sol',16);
uint256 unreleased = releasableAmount(token);
__CoverageTokenVesting('/Users/tikonoff/projects/etheal-contracts/contracts/TokenVesting.sol',79);
     __StatementCoverageTokenVesting('/Users/tikonoff/projects/etheal-contracts/contracts/TokenVesting.sol',17);
uint256 refund = balance.sub(unreleased);

__CoverageTokenVesting('/Users/tikonoff/projects/etheal-contracts/contracts/TokenVesting.sol',81);
     __StatementCoverageTokenVesting('/Users/tikonoff/projects/etheal-contracts/contracts/TokenVesting.sol',18);
revoked[token] = true;

__CoverageTokenVesting('/Users/tikonoff/projects/etheal-contracts/contracts/TokenVesting.sol',83);
    __AssertPreCoverageTokenVesting('/Users/tikonoff/projects/etheal-contracts/contracts/TokenVesting.sol',7);
 __StatementCoverageTokenVesting('/Users/tikonoff/projects/etheal-contracts/contracts/TokenVesting.sol',19);
require(token.transfer(owner, refund));__AssertPostCoverageTokenVesting('/Users/tikonoff/projects/etheal-contracts/contracts/TokenVesting.sol',7);


__CoverageTokenVesting('/Users/tikonoff/projects/etheal-contracts/contracts/TokenVesting.sol',85);
     __StatementCoverageTokenVesting('/Users/tikonoff/projects/etheal-contracts/contracts/TokenVesting.sol',20);
Revoked();
  }

  /**
   * @dev Calculates the amount that has already vested but hasn't been released yet.
   * @param token ERC20MiniMe token which is being vested
   */
  function releasableAmount(ERC20MiniMe token) public  returns (uint256) {__FunctionCoverageTokenVesting('/Users/tikonoff/projects/etheal-contracts/contracts/TokenVesting.sol',4);

__CoverageTokenVesting('/Users/tikonoff/projects/etheal-contracts/contracts/TokenVesting.sol',93);
     __StatementCoverageTokenVesting('/Users/tikonoff/projects/etheal-contracts/contracts/TokenVesting.sol',21);
return vestedAmount(token).sub(released[token]);
  }

  /**
   * @dev Calculates the amount that has already vested.
   * @param token ERC20MiniMe token which is being vested
   */
  function vestedAmount(ERC20MiniMe token) public  returns (uint256) {__FunctionCoverageTokenVesting('/Users/tikonoff/projects/etheal-contracts/contracts/TokenVesting.sol',5);

__CoverageTokenVesting('/Users/tikonoff/projects/etheal-contracts/contracts/TokenVesting.sol',101);
     __StatementCoverageTokenVesting('/Users/tikonoff/projects/etheal-contracts/contracts/TokenVesting.sol',22);
uint256 currentBalance = token.balanceOf(this);
__CoverageTokenVesting('/Users/tikonoff/projects/etheal-contracts/contracts/TokenVesting.sol',102);
     __StatementCoverageTokenVesting('/Users/tikonoff/projects/etheal-contracts/contracts/TokenVesting.sol',23);
uint256 totalBalance = currentBalance.add(released[token]);

__CoverageTokenVesting('/Users/tikonoff/projects/etheal-contracts/contracts/TokenVesting.sol',104);
     __StatementCoverageTokenVesting('/Users/tikonoff/projects/etheal-contracts/contracts/TokenVesting.sol',24);
if (now < cliff) {__BranchCoverageTokenVesting('/Users/tikonoff/projects/etheal-contracts/contracts/TokenVesting.sol',8,0);
__CoverageTokenVesting('/Users/tikonoff/projects/etheal-contracts/contracts/TokenVesting.sol',105);
       __StatementCoverageTokenVesting('/Users/tikonoff/projects/etheal-contracts/contracts/TokenVesting.sol',25);
return 0;
    } else { __StatementCoverageTokenVesting('/Users/tikonoff/projects/etheal-contracts/contracts/TokenVesting.sol',26);
__BranchCoverageTokenVesting('/Users/tikonoff/projects/etheal-contracts/contracts/TokenVesting.sol',8,1);if (now >= start.add(duration) || revoked[token]) {__BranchCoverageTokenVesting('/Users/tikonoff/projects/etheal-contracts/contracts/TokenVesting.sol',9,0);
__CoverageTokenVesting('/Users/tikonoff/projects/etheal-contracts/contracts/TokenVesting.sol',107);
       __StatementCoverageTokenVesting('/Users/tikonoff/projects/etheal-contracts/contracts/TokenVesting.sol',27);
return totalBalance;
    } else {__BranchCoverageTokenVesting('/Users/tikonoff/projects/etheal-contracts/contracts/TokenVesting.sol',9,1);
__CoverageTokenVesting('/Users/tikonoff/projects/etheal-contracts/contracts/TokenVesting.sol',109);
       __StatementCoverageTokenVesting('/Users/tikonoff/projects/etheal-contracts/contracts/TokenVesting.sol',28);
return totalBalance.mul(now.sub(start)).div(duration);
    }}
  }
}