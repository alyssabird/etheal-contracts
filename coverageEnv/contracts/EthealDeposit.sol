pragma solidity ^0.4.17;

import './SafeMath.sol';
import './Ownable.sol';
import './HasNoTokens.sol';
import './EthealWhitelist.sol';
import './iEthealSale.sol';

/**
 * @title EthealDeposit
 * @author thesved
 * @dev This contract is used for storing funds while doing Whitelist
 */
contract EthealDeposit is Ownable, HasNoTokens {event __CoverageEthealDeposit(string fileName, uint256 lineNumber);
event __FunctionCoverageEthealDeposit(string fileName, uint256 fnId);
event __StatementCoverageEthealDeposit(string fileName, uint256 statementId);
event __BranchCoverageEthealDeposit(string fileName, uint256 branchId, uint256 locationIdx);
event __AssertPreCoverageEthealDeposit(string fileName, uint256 branchId);
event __AssertPostCoverageEthealDeposit(string fileName, uint256 branchId);

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
    function EthealDeposit(address _sale, address _whitelist) {__FunctionCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',1);

__CoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',45);
        __AssertPreCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',1);
 __StatementCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',1);
require(_sale != address(0));__AssertPostCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',1);

__CoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',46);
         __StatementCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',2);
sale = iEthealSale(_sale);
__CoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',47);
         __StatementCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',3);
whitelist = EthealWhitelist(_whitelist);
    }

    /// @notice Set sale contract address
    function setSale(address _sale) public onlyOwner {__FunctionCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',2);

__CoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',52);
         __StatementCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',4);
sale = iEthealSale(_sale);
    }

    /// @notice Set whitelist contract address
    function setWhitelist(address _whitelist) public onlyOwner {__FunctionCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',3);

__CoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',57);
         __StatementCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',5);
whitelist = EthealWhitelist(_whitelist);
    }

    /// @dev Override HasNoTokens#extractTokens to not be able to extract tokens until saleEnd and everyone got their funds back
    function extractTokens(address _token, address _claimer) public onlyOwner saleEnded {__FunctionCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',4);

__CoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',62);
        __AssertPreCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',2);
 __StatementCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',6);
require(pendingCount == 0);__AssertPostCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',2);


__CoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',64);
        super.extractTokens(_token, _claimer);
    }


    ////////////////
    // Deposit, forward, refund
    ////////////////

    modifier whitelistSet() {__FunctionCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',5);

__CoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',73);
        __AssertPreCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',3);
 __StatementCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',7);
require(address(whitelist) != address(0));__AssertPostCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',3);

__CoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',74);
        _;
    }

    modifier saleNotEnded() {__FunctionCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',6);

__CoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',78);
        __AssertPreCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',4);
 __StatementCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',8);
require(address(sale) != address(0) && !sale.hasEnded());__AssertPostCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',4);

__CoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',79);
        _;
    }

    modifier saleEnded() {__FunctionCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',7);

__CoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',83);
        __AssertPreCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',5);
 __StatementCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',9);
require(address(sale) != address(0) && sale.hasEnded());__AssertPostCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',5);

__CoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',84);
        _;
    }

    /// @notice payable fallback calls the deposit function
    function() public payable {__FunctionCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',8);

__CoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',89);
         __StatementCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',10);
deposit(msg.sender, "");
    }

    /// @notice depositing for investor, return transaction Id
    /// @param _investor address of investor
    /// @param _whitelistSign offchain whitelist signiture for address, optional
    function deposit(address _investor, bytes _whitelistSign) public payable whitelistSet saleNotEnded returns (uint256) {__FunctionCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',9);

__CoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',96);
        __AssertPreCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',6);
 __StatementCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',11);
require(_investor != address(0));__AssertPostCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',6);

__CoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',97);
        __AssertPreCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',7);
 __StatementCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',12);
require(msg.value > 0);__AssertPostCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',7);


__CoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',99);
         __StatementCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',13);
uint256 transactionId = addTransaction(_investor, msg.value);

        // forward transaction automatically if whitelist is okay, so the transaction doesnt revert
__CoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',102);
         __StatementCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',14);
if (whitelist.isWhitelisted(_investor) 
            || whitelist.isOffchainWhitelisted(_investor, _whitelistSign) 
            || sale.whitelistThreshold() >= sale.stakes(_investor).add(msg.value)
        ) {__BranchCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',8,0);
__CoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',106);
             __StatementCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',15);
forwardTransactionInternal(transactionId, _whitelistSign);
        }else { __BranchCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',8,1);}


__CoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',109);
         __StatementCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',16);
return transactionId;
    }

    /// @notice forwarding a transaction
    function forwardTransaction(uint256 _id, bytes _whitelistSign) public whitelistSet saleNotEnded {__FunctionCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',10);

__CoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',114);
        __AssertPreCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',9);
 __StatementCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',17);
require(forwardTransactionInternal(_id, _whitelistSign));__AssertPostCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',9);

    }

    /// @notice forwarding multiple transactions: check whitelist
    function forwardManyTransaction(uint256[] _ids) public whitelistSet saleNotEnded {__FunctionCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',11);

__CoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',119);
         __StatementCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',18);
uint256 _threshold = sale.whitelistThreshold();

__CoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',121);
         __StatementCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',19);
for (uint256 i=0; i<_ids.length; i++) {
            // only forward if it is within threshold or whitelisted, so the transaction doesnt revert
__CoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',123);
             __StatementCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',20);
if ( whitelist.isWhitelisted(transactions[_ids[i]].beneficiary) 
                || _threshold >= sale.stakes(transactions[_ids[i]].beneficiary).add(transactions[_ids[i]].amount )
            ) {__BranchCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',10,0);
__CoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',126);
                 __StatementCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',21);
forwardTransactionInternal(_ids[i],"");
            }else { __BranchCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',10,1);}

        }
    }

    /// @notice forwarding transactions for an investor
    function forwardInvestorTransaction(address _investor, bytes _whitelistSign) public whitelistSet saleNotEnded {__FunctionCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',12);

__CoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',133);
         __StatementCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',22);
bool _whitelisted = whitelist.isWhitelisted(_investor) || whitelist.isOffchainWhitelisted(_investor, _whitelistSign);
__CoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',134);
         __StatementCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',23);
uint256 _amount = sale.stakes(_investor);
__CoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',135);
         __StatementCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',24);
uint256 _threshold = sale.whitelistThreshold();

__CoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',137);
         __StatementCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',25);
for (uint256 i=0; i<addressTransactions[_investor].length; i++) {
__CoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',138);
             __StatementCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',26);
_amount = _amount.add(transactions[ addressTransactions[_investor][i] ].amount);
            // only forward if it is within threshold or whitelisted, so the transaction doesnt revert
__CoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',140);
             __StatementCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',27);
if (_whitelisted || _threshold >= _amount) {__BranchCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',11,0);
__CoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',141);
                 __StatementCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',28);
forwardTransactionInternal(addressTransactions[_investor][i], _whitelistSign);
            }else { __BranchCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',11,1);}

        }
    }

    /// @notice refunding a transaction
    function refundTransaction(uint256 _id) public saleEnded {__FunctionCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',13);

__CoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',148);
        __AssertPreCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',12);
 __StatementCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',29);
require(refundTransactionInternal(_id));__AssertPostCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',12);

    }

    /// @notice refunding multiple transactions
    function refundManyTransaction(uint256[] _ids) public saleEnded {__FunctionCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',14);

__CoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',153);
         __StatementCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',30);
for (uint256 i=0; i<_ids.length; i++) {
__CoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',154);
             __StatementCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',31);
refundTransactionInternal(_ids[i]);
        }
    }

    /// @notice refunding an investor
    function refundInvestor(address _investor) public saleEnded {__FunctionCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',15);

__CoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',160);
         __StatementCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',32);
for (uint256 i=0; i<addressTransactions[_investor].length; i++) {
__CoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',161);
             __StatementCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',33);
refundTransactionInternal(addressTransactions[_investor][i]);
        }
    }


    ////////////////
    // Internal functions
    ////////////////

    /// @notice add transaction and returns its id
    function addTransaction(address _investor, uint256 _amount) internal returns (uint256) {__FunctionCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',16);

__CoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',172);
         __StatementCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',34);
uint256 transactionId = transactionCount;

        // save transaction
__CoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',175);
         __StatementCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',35);
transactions[transactionId] = Deposit({
            amount: _amount,
            beneficiary: _investor,
            time: uint64(now),
            cleared : false
        });

        // save transactionId for investor address
__CoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',183);
        addressTransactions[_investor].push(transactionId);

__CoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',185);
         __StatementCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',36);
transactionCount = transactionCount.add(1);
__CoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',186);
         __StatementCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',37);
pendingCount = pendingCount.add(1);
__CoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',187);
         __StatementCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',38);
Deposited(_investor,_amount);

__CoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',189);
         __StatementCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',39);
return transactionId;
    }

    /// @notice Forwarding a transaction, internal function, doesn't check sale status for speed up mass actions.
    /// @return whether forward was successful or not
    function forwardTransactionInternal(uint256 _id, bytes memory _whitelistSign) internal returns (bool) {__FunctionCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',17);

__CoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',195);
        __AssertPreCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',13);
 __StatementCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',40);
require(_id < transactionCount);__AssertPostCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',13);


        // if already cleared then return false
__CoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',198);
         __StatementCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',41);
if (transactions[_id].cleared) {__BranchCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',14,0);
__CoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',199);
             __StatementCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',42);
return false;
        }else { __BranchCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',14,1);}


        // fixing bytes data to argument call data: data -> {data position}{data length}data
__CoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',203);
         __StatementCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',43);
bytes memory _whitelistCall = bytesToArgument(_whitelistSign, 96);

        // forwarding transaction to sale contract
__CoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',206);
         __StatementCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',44);
if (! sale.call.value(transactions[_id].amount)(bytes4(keccak256('depositEth(address,uint256,bytes)')), transactions[_id].beneficiary, uint256(transactions[_id].time), _whitelistCall) ) {__BranchCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',15,0);
__CoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',207);
             __StatementCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',45);
return false;
        }else { __BranchCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',15,1);}

__CoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',209);
         __StatementCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',46);
transactions[_id].cleared = true;

__CoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',211);
         __StatementCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',47);
pendingCount = pendingCount.sub(1);
__CoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',212);
         __StatementCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',48);
Forwarded(transactions[_id].beneficiary, transactions[_id].amount, _id);

__CoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',214);
         __StatementCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',49);
return true;
    }

    /// @dev Fixing low level call for providing signature information: create proper padding for bytes information
    function bytesToArgument(bytes memory _sign, uint256 _position) internal  returns (bytes memory c) {__FunctionCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',18);

__CoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',219);
         __StatementCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',50);
uint256 signLength = _sign.length;
__CoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',220);
         __StatementCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',51);
uint256 totalLength = signLength.add(64);
__CoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',221);
         __StatementCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',52);
uint256 loopMax = signLength.add(31).div(32);
__CoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',222);
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
    function refundTransactionInternal(uint256 _id) internal returns (bool) {__FunctionCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',19);

__CoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',235);
        __AssertPreCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',16);
 __StatementCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',53);
require(_id < transactionCount);__AssertPostCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',16);


        // if already cleared then return false
__CoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',238);
         __StatementCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',54);
if (transactions[_id].cleared) {__BranchCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',17,0);
__CoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',239);
             __StatementCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',55);
return false;
        }else { __BranchCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',17,1);}


        // sending back funds
__CoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',243);
         __StatementCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',56);
transactions[_id].cleared = true;
__CoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',244);
        transactions[_id].beneficiary.transfer(transactions[_id].amount);

__CoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',246);
         __StatementCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',57);
pendingCount = pendingCount.sub(1);
__CoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',247);
         __StatementCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',58);
Refunded(transactions[_id].beneficiary, transactions[_id].amount, _id);

__CoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',249);
         __StatementCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',59);
return true;
    }


    ////////////////
    // External functions
    ////////////////

    /// @notice gives back transaction ids based on filtering
    function getTransactionIds(uint256 from, uint256 to, bool _cleared, bool _nonCleared)  external returns (uint256[] ids) {__FunctionCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',20);

__CoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',259);
         __StatementCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',60);
uint256 i = 0;
__CoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',260);
         __StatementCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',61);
uint256 results = 0;
__CoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',261);
         __StatementCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',62);
uint256[] memory _ids = new uint256[](transactionCount);

        // search in contributors
__CoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',264);
         __StatementCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',63);
for (i = 0; i < transactionCount; i++) {
__CoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',265);
             __StatementCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',64);
if (_cleared && transactions[i].cleared || _nonCleared && !transactions[i].cleared) {__BranchCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',18,0);
__CoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',266);
                 __StatementCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',65);
_ids[results] = i;
__CoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',267);
                results++;
            }else { __BranchCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',18,1);}

        }

__CoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',271);
         __StatementCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',66);
ids = new uint256[](results);
__CoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',272);
         __StatementCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',67);
for (i = from; i <= to && i < results; i++) {
__CoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',273);
             __StatementCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',68);
ids[i] = _ids[i];
        }

__CoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',276);
         __StatementCoverageEthealDeposit('/Users/tikonoff/projects/etheal-contracts/contracts/EthealDeposit.sol',69);
return ids;
    }
}