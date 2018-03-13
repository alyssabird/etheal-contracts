pragma solidity ^0.4.10;


/// @title Multisignature wallet - Allows multiple parties to agree on transactions before execution.
/// @author Stefan George - <stefan.george@consensys.net>
contract MultiSigWallet {event __CoverageMultiSigWallet(string fileName, uint256 lineNumber);
event __FunctionCoverageMultiSigWallet(string fileName, uint256 fnId);
event __StatementCoverageMultiSigWallet(string fileName, uint256 statementId);
event __BranchCoverageMultiSigWallet(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageMultiSigWallet(string fileName, uint256 branchId);
event __AssertPostCoverageMultiSigWallet(string fileName, uint256 branchId);

    uint constant public MAX_OWNER_COUNT = 50;

    event Confirmation(address indexed sender, uint indexed transactionId);
    event Revocation(address indexed sender, uint indexed transactionId);
    event Submission(uint indexed transactionId);
    event Execution(uint indexed transactionId);
    event ExecutionFailure(uint indexed transactionId);
    event Deposit(address indexed sender, uint value);
    event OwnerAddition(address indexed owner);
    event OwnerRemoval(address indexed owner);
    event RequirementChange(uint required);

    mapping (uint => Transaction) public transactions;
    mapping (uint => mapping (address => bool)) public confirmations;
    mapping (address => bool) public isOwner;
    address[] public owners;
    uint public required;
    uint public transactionCount;

    struct Transaction {
        address destination;
        uint value;
        bytes data;
        bool executed;
    }

    modifier onlyWallet() {__FunctionCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',1);

__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',34);
         __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',1);
if (msg.sender != address(this))
            { __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',2);
__BranchCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',1,0);__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',35);
throw;}else { __BranchCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',1,1);}

__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',36);
        _;
    }

    modifier ownerDoesNotExist(address owner) {__FunctionCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',2);

__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',40);
         __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',3);
if (isOwner[owner])
            { __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',4);
__BranchCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',2,0);__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',41);
throw;}else { __BranchCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',2,1);}

__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',42);
        _;
    }

    modifier ownerExists(address owner) {__FunctionCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',3);

__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',46);
         __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',5);
if (!isOwner[owner])
            { __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',6);
__BranchCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',3,0);__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',47);
throw;}else { __BranchCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',3,1);}

__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',48);
        _;
    }

    modifier transactionExists(uint transactionId) {__FunctionCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',4);

__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',52);
         __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',7);
if (transactions[transactionId].destination == 0)
            { __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',8);
__BranchCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',4,0);__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',53);
throw;}else { __BranchCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',4,1);}

__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',54);
        _;
    }

    modifier confirmed(uint transactionId, address owner) {__FunctionCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',5);

__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',58);
         __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',9);
if (!confirmations[transactionId][owner])
            { __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',10);
__BranchCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',5,0);__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',59);
throw;}else { __BranchCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',5,1);}

__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',60);
        _;
    }

    modifier notConfirmed(uint transactionId, address owner) {__FunctionCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',6);

__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',64);
         __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',11);
if (confirmations[transactionId][owner])
            { __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',12);
__BranchCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',6,0);__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',65);
throw;}else { __BranchCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',6,1);}

__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',66);
        _;
    }

    modifier notExecuted(uint transactionId) {__FunctionCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',7);

__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',70);
         __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',13);
if (transactions[transactionId].executed)
            { __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',14);
__BranchCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',7,0);__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',71);
throw;}else { __BranchCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',7,1);}

__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',72);
        _;
    }

    modifier notNull(address _address) {__FunctionCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',8);

__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',76);
         __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',15);
if (_address == 0)
            { __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',16);
__BranchCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',8,0);__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',77);
throw;}else { __BranchCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',8,1);}

__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',78);
        _;
    }

    modifier validRequirement(uint ownerCount, uint _required) {__FunctionCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',9);

__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',82);
         __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',17);
if (   ownerCount > MAX_OWNER_COUNT
            || _required > ownerCount
            || _required == 0
            || ownerCount == 0)
            { __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',18);
__BranchCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',9,0);__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',86);
throw;}else { __BranchCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',9,1);}

__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',87);
        _;
    }

    /// @dev Fallback function allows to deposit ether.
    function()
        payable
    {__FunctionCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',10);

__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',94);
         __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',19);
if (msg.value > 0)
            { __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',20);
__BranchCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',10,0);__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',95);
Deposit(msg.sender, msg.value);}else { __BranchCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',10,1);}

    }

    /*
     * Public functions
     */
    /// @dev Contract constructor sets initial owners and required number of confirmations.
    /// @param _owners List of initial owners.
    /// @param _required Number of required confirmations.
    function MultiSigWallet(address[] _owners, uint _required)
        public
        validRequirement(_owners.length, _required)
    {__FunctionCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',11);

__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',108);
         __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',21);
for (uint i=0; i<_owners.length; i++) {
__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',109);
             __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',22);
if (isOwner[_owners[i]] || _owners[i] == 0)
                { __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',23);
__BranchCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',11,0);__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',110);
throw;}else { __BranchCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',11,1);}

__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',111);
             __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',24);
isOwner[_owners[i]] = true;
        }
__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',113);
         __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',25);
owners = _owners;
__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',114);
         __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',26);
required = _required;
    }

    /// @dev Allows to add a new owner. Transaction has to be sent by wallet.
    /// @param owner Address of new owner.
    function addOwner(address owner)
        public
        onlyWallet
        ownerDoesNotExist(owner)
        notNull(owner)
        validRequirement(owners.length + 1, required)
    {__FunctionCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',12);

__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',126);
         __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',27);
isOwner[owner] = true;
__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',127);
        owners.push(owner);
__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',128);
         __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',28);
OwnerAddition(owner);
    }

    /// @dev Allows to remove an owner. Transaction has to be sent by wallet.
    /// @param owner Address of owner.
    function removeOwner(address owner)
        public
        onlyWallet
        ownerExists(owner)
    {__FunctionCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',13);

__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',138);
         __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',29);
isOwner[owner] = false;
__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',139);
         __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',30);
for (uint i=0; i<owners.length - 1; i++)
            { __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',31);
__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',140);
if (owners[i] == owner) {__BranchCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',12,0);
__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',141);
                 __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',32);
owners[i] = owners[owners.length - 1];
__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',142);
                break;
            }else { __BranchCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',12,1);}
}
__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',144);
         __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',33);
owners.length -= 1;
__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',145);
         __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',34);
if (required > owners.length)
            { __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',35);
__BranchCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',13,0);__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',146);
changeRequirement(owners.length);}else { __BranchCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',13,1);}

__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',147);
         __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',36);
OwnerRemoval(owner);
    }

    /// @dev Allows to replace an owner with a new owner. Transaction has to be sent by wallet.
    /// @param owner Address of owner to be replaced.
    /// @param owner Address of new owner.
    function replaceOwner(address owner, address newOwner)
        public
        onlyWallet
        ownerExists(owner)
        ownerDoesNotExist(newOwner)
    {__FunctionCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',14);

__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',159);
         __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',37);
for (uint i=0; i<owners.length; i++)
            { __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',38);
__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',160);
if (owners[i] == owner) {__BranchCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',14,0);
__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',161);
                 __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',39);
owners[i] = newOwner;
__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',162);
                break;
            }else { __BranchCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',14,1);}
}
__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',164);
         __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',40);
isOwner[owner] = false;
__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',165);
         __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',41);
isOwner[newOwner] = true;
__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',166);
         __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',42);
OwnerRemoval(owner);
__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',167);
         __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',43);
OwnerAddition(newOwner);
    }

    /// @dev Allows to change the number of required confirmations. Transaction has to be sent by wallet.
    /// @param _required Number of required confirmations.
    function changeRequirement(uint _required)
        public
        onlyWallet
        validRequirement(owners.length, _required)
    {__FunctionCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',15);

__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',177);
         __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',44);
required = _required;
__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',178);
         __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',45);
RequirementChange(_required);
    }

    /// @dev Allows an owner to submit and confirm a transaction.
    /// @param destination Transaction target address.
    /// @param value Transaction ether value.
    /// @param data Transaction data payload.
    /// @return Returns transaction ID.
    function submitTransaction(address destination, uint value, bytes data)
        public
        returns (uint transactionId)
    {__FunctionCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',16);

__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',190);
         __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',46);
transactionId = addTransaction(destination, value, data);
__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',191);
         __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',47);
confirmTransaction(transactionId);
    }

    /// @dev Allows an owner to confirm a transaction.
    /// @param transactionId Transaction ID.
    function confirmTransaction(uint transactionId)
        public
        ownerExists(msg.sender)
        transactionExists(transactionId)
        notConfirmed(transactionId, msg.sender)
    {__FunctionCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',17);

__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',202);
         __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',48);
confirmations[transactionId][msg.sender] = true;
__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',203);
         __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',49);
Confirmation(msg.sender, transactionId);
__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',204);
         __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',50);
executeTransaction(transactionId);
    }

    /// @dev Allows an owner to revoke a confirmation for a transaction.
    /// @param transactionId Transaction ID.
    function revokeConfirmation(uint transactionId)
        public
        ownerExists(msg.sender)
        confirmed(transactionId, msg.sender)
        notExecuted(transactionId)
    {__FunctionCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',18);

__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',215);
         __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',51);
confirmations[transactionId][msg.sender] = false;
__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',216);
         __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',52);
Revocation(msg.sender, transactionId);
    }

    /// @dev Allows anyone to execute a confirmed transaction.
    /// @param transactionId Transaction ID.
    function executeTransaction(uint transactionId)
        public
        notExecuted(transactionId)
    {__FunctionCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',19);

__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',225);
         __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',53);
if (isConfirmed(transactionId)) {__BranchCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',15,0);
__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',226);
             __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',54);
Transaction tx = transactions[transactionId];
__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',227);
             __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',55);
tx.executed = true;
__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',228);
             __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',56);
if (tx.destination.call.value(tx.value)(tx.data))
                { __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',57);
__BranchCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',16,0);__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',229);
Execution(transactionId);}
            else {__BranchCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',16,1);
__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',231);
                 __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',58);
ExecutionFailure(transactionId);
__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',232);
                 __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',59);
tx.executed = false;
            }
        }else { __BranchCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',15,1);}

    }

    /// @dev Returns the confirmation status of a transaction.
    /// @param transactionId Transaction ID.
    /// @return Confirmation status.
    function isConfirmed(uint transactionId)
        public
        
        returns (bool)
    {__FunctionCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',20);

__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',245);
         __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',60);
uint count = 0;
__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',246);
         __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',61);
for (uint i=0; i<owners.length; i++) {
__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',247);
             __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',62);
if (confirmations[transactionId][owners[i]])
                { __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',63);
__BranchCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',17,0);__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',248);
count += 1;}else { __BranchCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',17,1);}

__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',249);
             __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',64);
if (count == required)
                { __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',65);
__BranchCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',18,0);__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',250);
return true;}else { __BranchCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',18,1);}

        }
    }

    /*
     * Internal functions
     */
    /// @dev Adds a new transaction to the transaction mapping, if transaction does not exist yet.
    /// @param destination Transaction target address.
    /// @param value Transaction ether value.
    /// @param data Transaction data payload.
    /// @return Returns transaction ID.
    function addTransaction(address destination, uint value, bytes data)
        internal
        notNull(destination)
        returns (uint transactionId)
    {__FunctionCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',21);

__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',267);
         __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',66);
transactionId = transactionCount;
__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',268);
         __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',67);
transactions[transactionId] = Transaction({
            destination: destination,
            value: value,
            data: data,
            executed: false
        });
__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',274);
         __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',68);
transactionCount += 1;
__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',275);
         __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',69);
Submission(transactionId);
    }

    /*
     * Web3 call functions
     */
    /// @dev Returns number of confirmations of a transaction.
    /// @param transactionId Transaction ID.
    /// @return Number of confirmations.
    function getConfirmationCount(uint transactionId)
        public
        
        returns (uint count)
    {__FunctionCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',22);

__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',289);
         __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',70);
for (uint i=0; i<owners.length; i++)
            { __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',71);
__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',290);
if (confirmations[transactionId][owners[i]])
                { __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',72);
__BranchCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',19,0);__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',291);
count += 1;}else { __BranchCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',19,1);}
}
    }

    /// @dev Returns total number of transactions after filers are applied.
    /// @param pending Include pending transactions.
    /// @param executed Include executed transactions.
    /// @return Total number of transactions after filters are applied.
    function getTransactionCount(bool pending, bool executed)
        public
        
        returns (uint count)
    {__FunctionCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',23);

__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',303);
         __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',73);
for (uint i=0; i<transactionCount; i++)
            { __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',74);
__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',304);
if (   pending && !transactions[i].executed
                || executed && transactions[i].executed)
                { __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',75);
__BranchCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',20,0);__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',306);
count += 1;}else { __BranchCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',20,1);}
}
    }

    /// @dev Returns list of owners.
    /// @return List of owner addresses.
    function getOwners()
        public
        
        returns (address[])
    {__FunctionCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',24);

__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',316);
         __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',76);
return owners;
    }

    /// @dev Returns array with owner addresses, which confirmed transaction.
    /// @param transactionId Transaction ID.
    /// @return Returns array of owner addresses.
    function getConfirmations(uint transactionId)
        public
        
        returns (address[] _confirmations)
    {__FunctionCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',25);

__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',327);
         __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',77);
address[] memory confirmationsTemp = new address[](owners.length);
__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',328);
         __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',78);
uint count = 0;
__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',329);
        uint i;
__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',330);
         __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',79);
for (i=0; i<owners.length; i++)
            { __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',80);
__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',331);
if (confirmations[transactionId][owners[i]]) {__BranchCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',21,0);
__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',332);
                 __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',81);
confirmationsTemp[count] = owners[i];
__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',333);
                 __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',82);
count += 1;
            }else { __BranchCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',21,1);}
}
__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',335);
         __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',83);
_confirmations = new address[](count);
__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',336);
         __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',84);
for (i=0; i<count; i++)
            { __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',85);
__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',337);
_confirmations[i] = confirmationsTemp[i];}
    }

    /// @dev Returns list of transaction IDs in defined range.
    /// @param from Index start position of transaction array.
    /// @param to Index end position of transaction array.
    /// @param pending Include pending transactions.
    /// @param executed Include executed transactions.
    /// @return Returns array of transaction IDs.
    function getTransactionIds(uint from, uint to, bool pending, bool executed)
        public
        
        returns (uint[] _transactionIds)
    {__FunctionCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',26);

__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',351);
         __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',86);
uint[] memory transactionIdsTemp = new uint[](transactionCount);
__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',352);
         __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',87);
uint count = 0;
__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',353);
        uint i;
__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',354);
         __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',88);
for (i=0; i<transactionCount; i++)
            { __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',89);
__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',355);
if (   pending && !transactions[i].executed
                || executed && transactions[i].executed)
            {__BranchCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',22,0);
__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',358);
                 __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',90);
transactionIdsTemp[count] = i;
__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',359);
                 __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',91);
count += 1;
            }else { __BranchCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',22,1);}
}
__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',361);
         __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',92);
_transactionIds = new uint[](to - from);
__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',362);
         __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',93);
for (i=from; i<to; i++)
            { __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',94);
__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',363);
_transactionIds[i - from] = transactionIdsTemp[i];}
    }
}


/// @title Multisignature wallet with daily limit - Allows an owner to withdraw a daily limit without multisig.
/// @author Stefan George - <stefan.george@consensys.net>
contract MultiSigWalletWithDailyLimit is MultiSigWallet {event __CoverageMultiSigWallet(string fileName, uint256 lineNumber);
event __FunctionCoverageMultiSigWallet(string fileName, uint256 fnId);
event __StatementCoverageMultiSigWallet(string fileName, uint256 statementId);
event __BranchCoverageMultiSigWallet(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageMultiSigWallet(string fileName, uint256 branchId);
event __AssertPostCoverageMultiSigWallet(string fileName, uint256 branchId);


    event DailyLimitChange(uint dailyLimit);

    uint public dailyLimit;
    uint public lastDay;
    uint public spentToday;

    /*
     * Public functions
     */
    /// @dev Contract constructor sets initial owners, required number of confirmations and daily withdraw limit.
    /// @param _owners List of initial owners.
    /// @param _required Number of required confirmations.
    /// @param _dailyLimit Amount in wei, which can be withdrawn without confirmations on a daily basis.
    function MultiSigWalletWithDailyLimit(address[] _owners, uint _required, uint _dailyLimit)
        public
        MultiSigWallet(_owners, _required)
    {__FunctionCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',27);

__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',389);
         __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',95);
dailyLimit = _dailyLimit;
    }

    /// @dev Allows to change the daily limit. Transaction has to be sent by wallet.
    /// @param _dailyLimit Amount in wei.
    function changeDailyLimit(uint _dailyLimit)
        public
        onlyWallet
    {__FunctionCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',28);

__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',398);
         __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',96);
dailyLimit = _dailyLimit;
__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',399);
         __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',97);
DailyLimitChange(_dailyLimit);
    }

    /// @dev Allows anyone to execute a confirmed transaction or ether withdraws until daily limit is reached.
    /// @param transactionId Transaction ID.
    function executeTransaction(uint transactionId)
        public
        notExecuted(transactionId)
    {__FunctionCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',29);

__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',408);
         __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',98);
Transaction tx = transactions[transactionId];
__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',409);
         __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',99);
bool confirmed = isConfirmed(transactionId);
__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',410);
         __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',100);
if (confirmed || tx.data.length == 0 && isUnderLimit(tx.value)) {__BranchCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',23,0);
__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',411);
             __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',101);
tx.executed = true;
__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',412);
             __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',102);
if (!confirmed)
                { __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',103);
__BranchCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',24,0);__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',413);
spentToday += tx.value;}else { __BranchCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',24,1);}

__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',414);
             __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',104);
if (tx.destination.call.value(tx.value)(tx.data))
                { __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',105);
__BranchCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',25,0);__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',415);
Execution(transactionId);}
            else {__BranchCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',25,1);
__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',417);
                 __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',106);
ExecutionFailure(transactionId);
__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',418);
                 __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',107);
tx.executed = false;
__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',419);
                 __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',108);
if (!confirmed)
                    { __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',109);
__BranchCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',26,0);__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',420);
spentToday -= tx.value;}else { __BranchCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',26,1);}

            }
        }else { __BranchCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',23,1);}

    }

    /*
     * Internal functions
     */
    /// @dev Returns if amount is within daily limit and resets spentToday after one day.
    /// @param amount Amount to withdraw.
    /// @return Returns if amount is under daily limit.
    function isUnderLimit(uint amount)
        internal
        returns (bool)
    {__FunctionCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',30);

__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',435);
         __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',110);
if (now > lastDay + 24 hours) {__BranchCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',27,0);
__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',436);
             __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',111);
lastDay = now;
__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',437);
             __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',112);
spentToday = 0;
        }else { __BranchCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',27,1);}

__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',439);
         __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',113);
if (spentToday + amount > dailyLimit || spentToday + amount < spentToday)
            { __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',114);
__BranchCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',28,0);__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',440);
return false;}else { __BranchCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',28,1);}

__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',441);
         __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',115);
return true;
    }

    /*
     * Web3 call functions
     */
    /// @dev Returns maximum withdraw amount.
    /// @return Returns amount.
    function calcMaxWithdraw()
        public
        
        returns (uint)
    {__FunctionCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',31);

__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',454);
         __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',116);
if (now > lastDay + 24 hours)
            { __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',117);
__BranchCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',29,0);__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',455);
return dailyLimit;}else { __BranchCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',29,1);}

__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',456);
         __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',118);
if (dailyLimit < spentToday)
            { __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',119);
__BranchCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',30,0);__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',457);
return 0;}else { __BranchCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',30,1);}

__CoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',458);
         __StatementCoverageMultiSigWallet('/Users/tikonoff/projects/etheal-contracts/contracts/Wallet.sol',120);
return dailyLimit - spentToday;
    }
}