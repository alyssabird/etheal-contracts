pragma solidity ^0.4.18;

// File: contracts/ECRecovery.sol

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
  function recover(bytes32 hash, bytes sig) public  returns (address) {__FunctionCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',1);

__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',19);
    bytes32 r;
__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',20);
    bytes32 s;
__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',21);
    uint8 v;

    //Check the signature length
__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',24);
     __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',1);
if (sig.length != 65) {__BranchCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',1,0);
__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',25);
       __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',2);
return (address(0));
    }else { __BranchCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',1,1);}


    // Divide the signature in r, s and v variables
__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',29);
    assembly {
      r := mload(add(sig, 32))
      s := mload(add(sig, 64))
      v := byte(0, mload(add(sig, 96)))
    }

    // Version of signature should be 27 or 28, but 0 and 1 are also possible versions
__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',36);
     __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',3);
if (v < 27) {__BranchCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',2,0);
__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',37);
       __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',4);
v += 27;
    }else { __BranchCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',2,1);}


    // If the version is correct return the signer address
__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',41);
     __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',5);
if (v != 27 && v != 28) {__BranchCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',3,0);
__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',42);
       __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',6);
return (address(0));
    } else {__BranchCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',3,1);
__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',44);
       __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',7);
return ecrecover(hash, v, r, s);
    }
  }

}

// File: contracts/Ownable.sol

/**
 * @title Ownable
 * @dev The Ownable contract has an owner address, and provides basic authorization control
 * functions, this simplifies the implementation of "user permissions".
 */
contract Ownable {event __CoverageECRecovery(string fileName, uint256 lineNumber);
event __FunctionCoverageECRecovery(string fileName, uint256 fnId);
event __StatementCoverageECRecovery(string fileName, uint256 statementId);
event __BranchCoverageECRecovery(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageECRecovery(string fileName, uint256 branchId);
event __AssertPostCoverageECRecovery(string fileName, uint256 branchId);

  address public owner;


  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);


  /**
   * @dev The Ownable constructor sets the original `owner` of the contract to the sender
   * account.
   */
  function Ownable() {__FunctionCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',2);

__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',69);
     __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',8);
owner = msg.sender;
  }


  /**
   * @dev Throws if called by any account other than the owner.
   */
  modifier onlyOwner() {__FunctionCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',3);

__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',77);
    __AssertPreCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',4);
 __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',9);
require(msg.sender == owner);__AssertPostCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',4);

__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',78);
    _;
  }


  /**
   * @dev Allows the current owner to transfer control of the contract to a newOwner.
   * @param newOwner The address to transfer ownership to.
   */
  function transferOwnership(address newOwner) onlyOwner public {__FunctionCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',4);

__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',87);
    __AssertPreCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',5);
 __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',10);
require(newOwner != address(0));__AssertPostCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',5);

__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',88);
     __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',11);
OwnershipTransferred(owner, newOwner);
__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',89);
     __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',12);
owner = newOwner;
  }

}

// File: contracts/EthealWhitelist.sol

/**
 * @title EthealWhitelist
 * @author thesved
 * @notice EthealWhitelist contract which handles KYC
 */
contract EthealWhitelist is Ownable {event __CoverageECRecovery(string fileName, uint256 lineNumber);
event __FunctionCoverageECRecovery(string fileName, uint256 fnId);
event __StatementCoverageECRecovery(string fileName, uint256 statementId);
event __BranchCoverageECRecovery(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageECRecovery(string fileName, uint256 branchId);
event __AssertPostCoverageECRecovery(string fileName, uint256 branchId);

    using ECRecovery for bytes32;

    // signer address for offchain whitelist signing
    address public signer;

    // storing whitelisted addresses
    mapping(address => bool) public isWhitelisted;

    event WhitelistSet(address indexed _address, bool _state);

    ////////////////
    // Constructor
    ////////////////
    function EthealWhitelist(address _signer) {__FunctionCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',5);

__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',116);
        __AssertPreCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',6);
 __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',13);
require(_signer != address(0));__AssertPostCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',6);


__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',118);
         __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',14);
signer = _signer;
    }

    /// @notice set signing address after deployment
    function setSigner(address _signer) public onlyOwner {__FunctionCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',6);

__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',123);
        __AssertPreCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',7);
 __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',15);
require(_signer != address(0));__AssertPostCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',7);


__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',125);
         __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',16);
signer = _signer;
    }

    ////////////////
    // Whitelisting: only owner
    ////////////////

    /// @notice Set whitelist state for an address.
    function setWhitelist(address _addr, bool _state) public onlyOwner {__FunctionCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',7);

__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',134);
        __AssertPreCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',8);
 __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',17);
require(_addr != address(0));__AssertPostCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',8);

__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',135);
         __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',18);
isWhitelisted[_addr] = _state;
__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',136);
         __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',19);
WhitelistSet(_addr, _state);
    }

    /// @notice Set whitelist state for multiple addresses
    function setManyWhitelist(address[] _addr, bool _state) public onlyOwner {__FunctionCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',8);

__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',141);
         __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',20);
for (uint256 i = 0; i < _addr.length; i++) {
__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',142);
             __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',21);
setWhitelist(_addr[i], _state);
        }
    }

    /// @notice offchain whitelist check
    function isOffchainWhitelisted(address _addr, bytes _sig) public  returns (bool) {__FunctionCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',9);

__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',148);
         __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',22);
bytes32 hash = keccak256("\x19Ethereum Signed Message:\n20",_addr);
__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',149);
         __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',23);
return hash.recover(_sig) == signer;
    }
}

// File: contracts/ERC20.sol

/**
 * @title ERC20
 * @dev ERC20 interface
 */
contract ERC20 {event __CoverageECRecovery(string fileName, uint256 lineNumber);
event __FunctionCoverageECRecovery(string fileName, uint256 fnId);
event __StatementCoverageECRecovery(string fileName, uint256 statementId);
event __BranchCoverageECRecovery(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageECRecovery(string fileName, uint256 branchId);
event __AssertPostCoverageECRecovery(string fileName, uint256 branchId);

    function balanceOf(address who) public  returns (uint256);
    function transfer(address to, uint256 value) public returns (bool);
    function allowance(address owner, address spender) public  returns (uint256);
    function transferFrom(address from, address to, uint256 value) public returns (bool);
    function approve(address spender, uint256 value) public returns (bool);
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

// File: contracts/HasNoTokens.sol

/**
 * @title claim accidentally sent tokens
 */
contract HasNoTokens is Ownable {event __CoverageECRecovery(string fileName, uint256 lineNumber);
event __FunctionCoverageECRecovery(string fileName, uint256 fnId);
event __StatementCoverageECRecovery(string fileName, uint256 statementId);
event __BranchCoverageECRecovery(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageECRecovery(string fileName, uint256 branchId);
event __AssertPostCoverageECRecovery(string fileName, uint256 branchId);

    event ExtractedTokens(address indexed _token, address indexed _claimer, uint _amount);

    /// @notice This method can be used to extract mistakenly
    ///  sent tokens to this contract.
    /// @param _token The address of the token contract that you want to recover
    ///  set to 0 in case you want to extract ether.
    /// @param _claimer Address that tokens will be send to
    function extractTokens(address _token, address _claimer) onlyOwner public {__FunctionCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',10);

__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',183);
         __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',24);
if (_token == 0x0) {__BranchCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',9,0);
__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',184);
            _claimer.transfer(this.balance);
__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',185);
             __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',25);
return;
        }else { __BranchCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',9,1);}


__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',188);
         __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',26);
ERC20 token = ERC20(_token);
__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',189);
         __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',27);
uint balance = token.balanceOf(this);
__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',190);
        token.transfer(_claimer, balance);
__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',191);
         __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',28);
ExtractedTokens(_token, _claimer, balance);
    }
}

// File: contracts/SafeMath.sol

/**
 * @title SafeMath
 * @dev Math operations with safety checks that throw on error
 */
library SafeMath {event __CoverageECRecovery(string fileName, uint256 lineNumber);
event __FunctionCoverageECRecovery(string fileName, uint256 fnId);
event __StatementCoverageECRecovery(string fileName, uint256 statementId);
event __BranchCoverageECRecovery(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageECRecovery(string fileName, uint256 branchId);
event __AssertPostCoverageECRecovery(string fileName, uint256 branchId);

  function mul(uint256 a, uint256 b) internal  returns (uint256) {__FunctionCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',11);

__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',203);
     __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',29);
uint256 c = a * b;
__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',204);
    __AssertPreCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',10);
 __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',30);
assert(a == 0 || c / a == b);__AssertPostCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',10);

__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',205);
     __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',31);
return c;
  }

  function div(uint256 a, uint256 b) internal  returns (uint256) {__FunctionCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',12);

    // assert(b > 0); // Solidity automatically throws when dividing by 0
__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',210);
     __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',32);
uint256 c = a / b;
    // assert(a == b * c + a % b); // There is no case in which this doesn't hold
__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',212);
     __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',33);
return c;
  }

  function sub(uint256 a, uint256 b) internal  returns (uint256) {__FunctionCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',13);

__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',216);
    __AssertPreCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',11);
 __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',34);
assert(b <= a);__AssertPostCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',11);

__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',217);
     __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',35);
return a - b;
  }

  function add(uint256 a, uint256 b) internal  returns (uint256) {__FunctionCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',14);

__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',221);
     __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',36);
uint256 c = a + b;
__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',222);
    __AssertPreCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',12);
 __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',37);
assert(c >= a);__AssertPostCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',12);

__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',223);
     __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',38);
return c;
  }
}

// File: contracts/iEthealSale.sol

/// @dev Crowdsale interface for Etheal Normal Sale, functions needed from outside.
contract iEthealSale {event __CoverageECRecovery(string fileName, uint256 lineNumber);
event __FunctionCoverageECRecovery(string fileName, uint256 fnId);
event __StatementCoverageECRecovery(string fileName, uint256 statementId);
event __BranchCoverageECRecovery(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageECRecovery(string fileName, uint256 branchId);
event __AssertPostCoverageECRecovery(string fileName, uint256 branchId);

    uint256 public whitelistThreshold;
    mapping (address => uint256) public stakes;
    function setPromoBonus(address _investor) public;
    function buyTokens(address _beneficiary) public payable;
    function depositEth(address _beneficiary, uint256 _time, bytes _whitelistSign) public payable;
    function depositOffchain(address _beneficiary, uint256 _amount, uint256 _time) public;
    function hasEnded() public  returns (bool);
}

// File: contracts/EthealDeposit.sol

/**
 * @title EthealDeposit
 * @author thesved
 * @dev This contract is used for storing funds while doing Whitelist
 */
contract EthealDeposit is Ownable, HasNoTokens {event __CoverageECRecovery(string fileName, uint256 lineNumber);
event __FunctionCoverageECRecovery(string fileName, uint256 fnId);
event __StatementCoverageECRecovery(string fileName, uint256 statementId);
event __BranchCoverageECRecovery(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageECRecovery(string fileName, uint256 branchId);
event __AssertPostCoverageECRecovery(string fileName, uint256 branchId);

    using SafeMath for uint256;

    // storing deposits: make sure they fit in 2 x 32 byte
    struct Deposit {
        uint256 amount;         // 32 byte
        address beneficiary;    // 20 byte
        uint64 time;            // 8 byte
        bool cleared;           // 1 bit
    }
    uint256 public transactionCount;
    uint256 public pendingCount;
    mapping (uint256 => Deposit) public transactions;    // store transactions
    mapping (address => uint256[]) public addressTransactions;  // store transaction ids for addresses
    
    // sale contract to which we forward funds
    iEthealSale public sale;
    EthealWhitelist public whitelist;

    event Deposited(address indexed beneficiary, uint256 weiAmount);
    event Refunded(address indexed beneficiary, uint256 weiAmount, uint256 id);
    event Forwarded(address indexed beneficiary, uint256 weiAmount, uint256 id);

    ////////////////
    // Constructor
    ////////////////

    /// @notice Etheal deposit constructor
    /// @param _sale address of sale contract
    /// @param _whitelist address of whitelist contract
    function EthealDeposit(address _sale, address _whitelist) {__FunctionCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',15);

__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',278);
        __AssertPreCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',13);
 __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',39);
require(_sale != address(0));__AssertPostCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',13);

__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',279);
         __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',40);
sale = iEthealSale(_sale);
__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',280);
         __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',41);
whitelist = EthealWhitelist(_whitelist);
    }

    /// @notice Set sale contract address
    function setSale(address _sale) public onlyOwner {__FunctionCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',16);

__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',285);
         __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',42);
sale = iEthealSale(_sale);
    }

    /// @notice Set whitelist contract address
    function setWhitelist(address _whitelist) public onlyOwner {__FunctionCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',17);

__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',290);
         __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',43);
whitelist = EthealWhitelist(_whitelist);
    }

    /// @dev Override HasNoTokens#extractTokens to not be able to extract tokens until saleEnd and everyone got their funds back
    function extractTokens(address _token, address _claimer) public onlyOwner saleEnded {__FunctionCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',18);

__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',295);
        __AssertPreCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',14);
 __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',44);
require(pendingCount == 0);__AssertPostCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',14);


__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',297);
        super.extractTokens(_token, _claimer);
    }


    ////////////////
    // Deposit, forward, refund
    ////////////////

    modifier whitelistSet() {__FunctionCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',19);

__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',306);
        __AssertPreCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',15);
 __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',45);
require(address(whitelist) != address(0));__AssertPostCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',15);

__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',307);
        _;
    }

    modifier saleNotEnded() {__FunctionCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',20);

__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',311);
        __AssertPreCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',16);
 __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',46);
require(address(sale) != address(0) && !sale.hasEnded());__AssertPostCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',16);

__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',312);
        _;
    }

    modifier saleEnded() {__FunctionCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',21);

__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',316);
        __AssertPreCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',17);
 __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',47);
require(address(sale) != address(0) && sale.hasEnded());__AssertPostCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',17);

__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',317);
        _;
    }

    /// @notice payable fallback calls the deposit function
    function() public payable {__FunctionCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',22);

__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',322);
         __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',48);
deposit(msg.sender, "");
    }

    /// @notice depositing for investor, return transaction Id
    /// @param _investor address of investor
    /// @param _whitelistSign offchain whitelist signiture for address, optional
    function deposit(address _investor, bytes _whitelistSign) public payable whitelistSet saleNotEnded returns (uint256) {__FunctionCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',23);

__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',329);
        __AssertPreCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',18);
 __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',49);
require(_investor != address(0));__AssertPostCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',18);

__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',330);
        __AssertPreCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',19);
 __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',50);
require(msg.value > 0);__AssertPostCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',19);


__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',332);
         __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',51);
uint256 transactionId = addTransaction(_investor, msg.value);

        // forward transaction automatically if whitelist is okay, so the transaction doesnt revert
__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',335);
         __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',52);
if (whitelist.isWhitelisted(_investor) 
            || whitelist.isOffchainWhitelisted(_investor, _whitelistSign) 
            || sale.whitelistThreshold() >= sale.stakes(_investor).add(msg.value)
        ) {__BranchCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',20,0);
__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',339);
             __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',53);
forwardTransactionInternal(transactionId, _whitelistSign);
        }else { __BranchCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',20,1);}


__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',342);
         __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',54);
return transactionId;
    }

    /// @notice forwarding a transaction
    function forwardTransaction(uint256 _id, bytes _whitelistSign) public whitelistSet saleNotEnded {__FunctionCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',24);

__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',347);
        __AssertPreCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',21);
 __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',55);
require(forwardTransactionInternal(_id, _whitelistSign));__AssertPostCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',21);

    }

    /// @notice forwarding multiple transactions: check whitelist
    function forwardManyTransaction(uint256[] _ids) public whitelistSet saleNotEnded {__FunctionCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',25);

__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',352);
         __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',56);
uint256 _threshold = sale.whitelistThreshold();

__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',354);
         __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',57);
for (uint256 i=0; i<_ids.length; i++) {
            // only forward if it is within threshold or whitelisted, so the transaction doesnt revert
__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',356);
             __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',58);
if ( whitelist.isWhitelisted(transactions[_ids[i]].beneficiary) 
                || _threshold >= sale.stakes(transactions[_ids[i]].beneficiary).add(transactions[_ids[i]].amount )
            ) {__BranchCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',22,0);
__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',359);
                 __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',59);
forwardTransactionInternal(_ids[i],"");
            }else { __BranchCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',22,1);}

        }
    }

    /// @notice forwarding transactions for an investor
    function forwardInvestorTransaction(address _investor, bytes _whitelistSign) public whitelistSet saleNotEnded {__FunctionCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',26);

__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',366);
         __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',60);
bool _whitelisted = whitelist.isWhitelisted(_investor) || whitelist.isOffchainWhitelisted(_investor, _whitelistSign);
__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',367);
         __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',61);
uint256 _amount = sale.stakes(_investor);
__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',368);
         __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',62);
uint256 _threshold = sale.whitelistThreshold();

__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',370);
         __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',63);
for (uint256 i=0; i<addressTransactions[_investor].length; i++) {
__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',371);
             __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',64);
_amount = _amount.add(transactions[ addressTransactions[_investor][i] ].amount);
            // only forward if it is within threshold or whitelisted, so the transaction doesnt revert
__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',373);
             __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',65);
if (_whitelisted || _threshold >= _amount) {__BranchCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',23,0);
__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',374);
                 __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',66);
forwardTransactionInternal(addressTransactions[_investor][i], _whitelistSign);
            }else { __BranchCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',23,1);}

        }
    }

    /// @notice refunding a transaction
    function refundTransaction(uint256 _id) public saleEnded {__FunctionCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',27);

__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',381);
        __AssertPreCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',24);
 __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',67);
require(refundTransactionInternal(_id));__AssertPostCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',24);

    }

    /// @notice refunding multiple transactions
    function refundManyTransaction(uint256[] _ids) public saleEnded {__FunctionCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',28);

__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',386);
         __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',68);
for (uint256 i=0; i<_ids.length; i++) {
__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',387);
             __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',69);
refundTransactionInternal(_ids[i]);
        }
    }

    /// @notice refunding an investor
    function refundInvestor(address _investor) public saleEnded {__FunctionCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',29);

__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',393);
         __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',70);
for (uint256 i=0; i<addressTransactions[_investor].length; i++) {
__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',394);
             __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',71);
refundTransactionInternal(addressTransactions[_investor][i]);
        }
    }


    ////////////////
    // Internal functions
    ////////////////

    /// @notice add transaction and returns its id
    function addTransaction(address _investor, uint256 _amount) internal returns (uint256) {__FunctionCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',30);

__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',405);
         __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',72);
uint256 transactionId = transactionCount;

        // save transaction
__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',408);
         __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',73);
transactions[transactionId] = Deposit({
            amount: _amount,
            beneficiary: _investor,
            time: uint64(now),
            cleared : false
        });

        // save transactionId for investor address
__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',416);
        addressTransactions[_investor].push(transactionId);

__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',418);
         __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',74);
transactionCount = transactionCount.add(1);
__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',419);
         __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',75);
pendingCount = pendingCount.add(1);
__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',420);
         __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',76);
Deposited(_investor,_amount);

__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',422);
         __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',77);
return transactionId;
    }

    /// @notice Forwarding a transaction, internal function, doesn't check sale status for speed up mass actions.
    /// @return whether forward was successful or not
    function forwardTransactionInternal(uint256 _id, bytes memory _whitelistSign) internal returns (bool) {__FunctionCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',31);

__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',428);
        __AssertPreCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',25);
 __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',78);
require(_id < transactionCount);__AssertPostCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',25);


        // if already cleared then return false
__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',431);
         __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',79);
if (transactions[_id].cleared) {__BranchCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',26,0);
__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',432);
             __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',80);
return false;
        }else { __BranchCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',26,1);}


        // fixing bytes data to argument call data: data -> {data position}{data length}data
__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',436);
         __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',81);
bytes memory _whitelistCall = bytesToArgument(_whitelistSign, 96);

        // forwarding transaction to sale contract
__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',439);
         __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',82);
if (! sale.call.value(transactions[_id].amount)(bytes4(keccak256('depositEth(address,uint256,bytes)')), transactions[_id].beneficiary, uint256(transactions[_id].time), _whitelistCall) ) {__BranchCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',27,0);
__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',440);
             __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',83);
return false;
        }else { __BranchCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',27,1);}

__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',442);
         __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',84);
transactions[_id].cleared = true;

__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',444);
         __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',85);
pendingCount = pendingCount.sub(1);
__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',445);
         __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',86);
Forwarded(transactions[_id].beneficiary, transactions[_id].amount, _id);

__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',447);
         __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',87);
return true;
    }

    /// @dev Fixing low level call for providing signature information: create proper padding for bytes information
    function bytesToArgument(bytes memory _sign, uint256 _position) internal  returns (bytes memory c) {__FunctionCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',32);

__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',452);
         __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',88);
uint256 signLength = _sign.length;
__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',453);
         __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',89);
uint256 totalLength = signLength.add(64);
__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',454);
         __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',90);
uint256 loopMax = signLength.add(31).div(32);
__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',455);
        assembly {
            let m := mload(0x40)
            mstore(m, totalLength)          // store the total length
            mstore(add(m,32), _position)    // where does the data start
            mstore(add(m,64), signLength)   // store the length of signature
            for {  let i := 0 } lt(i, loopMax) { i := add(1, i) } { mstore(add(m, mul(32, add(3, i))), mload(add(_sign, mul(32, add(1, i))))) }
            mstore(0x40, add(m, add(32, totalLength)))
            c := m
        }
    }

    /// @notice Send back non-cleared transactions after sale is over, not checking status for speeding up mass actions
    function refundTransactionInternal(uint256 _id) internal returns (bool) {__FunctionCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',33);

__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',468);
        __AssertPreCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',28);
 __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',91);
require(_id < transactionCount);__AssertPostCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',28);


        // if already cleared then return false
__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',471);
         __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',92);
if (transactions[_id].cleared) {__BranchCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',29,0);
__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',472);
             __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',93);
return false;
        }else { __BranchCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',29,1);}


        // sending back funds
__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',476);
         __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',94);
transactions[_id].cleared = true;
__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',477);
        transactions[_id].beneficiary.transfer(transactions[_id].amount);

__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',479);
         __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',95);
pendingCount = pendingCount.sub(1);
__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',480);
         __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',96);
Refunded(transactions[_id].beneficiary, transactions[_id].amount, _id);

__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',482);
         __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',97);
return true;
    }


    ////////////////
    // External functions
    ////////////////

    /// @notice gives back transaction ids based on filtering
    function getTransactionIds(uint256 from, uint256 to, bool _cleared, bool _nonCleared)  external returns (uint256[] ids) {__FunctionCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',34);

__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',492);
         __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',98);
uint256 i = 0;
__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',493);
         __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',99);
uint256 results = 0;
__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',494);
         __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',100);
uint256[] memory _ids = new uint256[](transactionCount);

        // search in contributors
__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',497);
         __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',101);
for (i = 0; i < transactionCount; i++) {
__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',498);
             __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',102);
if (_cleared && transactions[i].cleared || _nonCleared && !transactions[i].cleared) {__BranchCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',30,0);
__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',499);
                 __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',103);
_ids[results] = i;
__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',500);
                results++;
            }else { __BranchCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',30,1);}

        }

__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',504);
         __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',104);
ids = new uint256[](results);
__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',505);
         __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',105);
for (i = from; i <= to && i < results; i++) {
__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',506);
             __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',106);
ids[i] = _ids[i];
        }

__CoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',509);
         __StatementCoverageECRecovery('/Users/tikonoff/projects/etheal-contracts/contracts/flattened/FlattenedEthealDeposit.sol',107);
return ids;
    }
}
