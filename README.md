# etheal-sale
Solidity contract for [etheal](https://etheal.com) token and sale rounds

[![Build Status](https://travis-ci.org/BlockchainLabsNZ/etheal-contracts.svg?branch=master)](https://travis-ci.org/BlockchainLabsNZ/etheal-contracts) [![Coverage Status](https://coveralls.io/repos/github/BlockchainLabsNZ/etheal-contracts/badge.svg?branch=master)](https://coveralls.io/github/BlockchainLabsNZ/etheal-contracts?branch=master)

## Contract Structure

### Unique contracts
1. EthealController: controlling the Etheal MiniMeToken
2. Hodler: managing the hodler reward fund
3. EthealPreSale: managing presale
4. EthealNormalSale: managing normal sale

Please see detailed description at the bottom.

### Basic contracts
* SafeMath: basic OpenZeppelin SafeMath for safe math functions
* Wallet: basic consensys multisig wallet
* Ownable: basic OpenZeppelin Ownable contract
* Pausable: basic OpenZeppelin Pausable contract

### MiniMe contracts
* ERC20: basic ERC20 interface
* ERC20MiniMe: is an ERC20 interface for MiniMe token
* Controlled: basic Controlled contract needed for MiniMe
* MiniMeToken: basic 0.2 version of MiniMe token
* TokenController: token controller interface needed to controll the Etheal MiniMe token
* EthealToken: is a very basic MiniMe token instanciation

### Crowdsale basic contracts
* HasNoTokens: basic token to implement extraction of mistakenly sent tokens
* Crowdsale: basic OpenZeppelin Crowdsale with 3 small modifications
  * ERC20 token replaced with ERC20MiniMe token
  * Distinct tokenTransfer function to make it extensible
  * hasStarted function to know whether the crowdsale is started
* CappedCrowdsale: basic OpenZeppelin CappedCrowdsale contract
  * implementing partial refund (https://github.com/OpenZeppelin/zeppelin-solidity/pull/499)
* FinalizableCrowdsale: basic OpenZeppelin FinalizableCrowdsale contract
* RefundableCrowdsale: basic OpenZeppelin RefundableCrowdsale contract
  * with a modification to forward funds to multisig wallet after reaching the cap, thus securing the funds as soon as it makes sense
* RefundVault: basic OpenZeppelin RefunVault contract
  * with extension of HasNoTokens, to recover mistakenly sent tokens
* TokenVesting: basic OpenZeppelin TokenVesting contract

### EthealController
Controlls the EthealToken contract, the initial HEAL token distribution, handles Grants (vesting tokens for team and advisors), hodler reward and crowdsale.

It is a pausable contract, which is paused at initialization. While paused only this contract and crowdsale contracts can move funds of HEAL token.

It implements HasNoTokens to recover mistakenly sent tokens to this contract.

All the tokens it holds can be used to create and revoke grants, transfer tokens to existing but not started grants.

Tokens for future crowdsales are held at the address of 0x1, which can be only moved to a crowdsale contract. Crowdsale contracts send excess HEAL tokens back to address 0x1. If there is no active crowdsale (which has started but not ended), then it can set a new crowdsale contract and transfer tokens to it.

We have decided to handle crowdsales in separate contract to the EthealController, because there will be several rounds of sales, and the exact timing of round 2 and 3 is unknown yet.

![Token Distribution](https://etheal.com/img/illustrations/sales_chart.svg "Token Distribution")

Token distribution:
* SALE address (0x1): 43M HEAL tokens for future sales rounds
* HODLER reward contract: 10M HEAL tokens
* Deployer of contracts: 3.5M HEAL tokens for referral + bounty tokens
  * excess tokens will be sent to the HODLER reward contract
* Multisig Wallet: 20M HEAL tokens for Community Fund
* EthealController: 20.5M HEAL tokens for team, founders, advisors
  * it can be only withdrawn through grants
    * team: 4 years vesting with one year cliff
    * advisors: 6 months vesting with three months cliff
* 2 investor addresses: 3M HEAL tokens

Only the multisig wallet can burn tokens of the EthealController (which belongs to the team and advisors), or burn not yet assigned crowdsale tokens. In the future the controller may be used to burn some of its own profit.

Also the multisig wallet can replace the EthealController with a new one, which can be used for future updates. This transfers the controller rights of EthealToken and hodler reward contract to the new controller, and transfers all eth and HEAL tokens to the new controller. Previously issued and revoced grants will transfer excess HEAL tokens to the old controller, which can be retrieved after a newController is set.

It also implements proxy functions to hodler reward, which enables crowdsale contracts to set hodler stakes.

It implements proxy functions to EthealToken (MiniMe), which stops transfering HEAL tokens when EthealController is stopped, refuses ETH transfers to the EthealToken contract, invalidates hodler stakes whenever any amount of heal token is moved from an address, and helps to recover accidentally sent tokens (other than the EthealToken) to the EthealToken contract.


### Hodler
Only crowdsale contracts can interract with it, and it accepts modifications until its start time.

Implements hodler reward logic:
Keep tokens intact (can’t move any portion of it) on your wallet for 3/6/9 months after two weeks of ending the normal sale, and 10M HEAL token HODLER reward will be distributed among presale and sale HODLERs in the ratio of their intact stakes to the total amount.

* HODLER lot 3 months: 1,000,000 HEAL
* HODLER lot 6 months: 2,000,000 HEAL
* HODLER lot 9 months: 7,000,000 HEAL

Moving any portion of HEAL tokens from an address invalidates its stakes within the hodler reward.

Remaining HEAL tokens from Referral reward will be moved to hodler lot 9 months.


### EthealPreSale
It is pausable, when paused no contribution is accepted.

It is capped, reaching the cap stops the sale immediately.

It is refundable, when not reaching the goal everyone gets back their full contribution in ETH and all the HEAL tokens is transferred back to the EthealController.

It implements a softcap logic, which means after reaching the soft cap the crowdsale is closed in 120 hours.

Sending funds below the minimum contribution amount (0.1ETH) is rejected.

Sending funds above the maximum gas price (100gwei), calculates stakes on 80%. If you send 5eth with 101gwei gas price results in calculating your funds as 4eth. In case of not reaching minimum goal, 5eth is refunded. In case of reaching the goal you get 4eth * 1250 = 5000 HEAL tokens.

It implements partial refunding for the last contributor, so the user don't have to be smart, the contract is smart instead. If there is only 1 eth remained, and the last contributor send 5 eth, then 4 eth is refunded.

Before token sale start parameters can be changed: max gas price and penalty, minimum contribution, minimum goal and soft and hard caps, starting and end times, and rate.


It implements **whitelist** logic as follows:
* Whitelisted days can be defined with corresponding max stakes, and whitelisted addresses can contribute until they have stakes no bigger than the max stake defined for that day.
* After whitelist period everyone can contribute until reaching the maximum cap.
* It takes into account the max gas price penalty, eg:
  * if 10eth is the max stake for day 2 of whitelist, and you already have 6eth stakes
  * then either you can send 4eth with gas price less than or equal to 100gwei
  * or 5eth with more than 100gwei gas price, since then 5*80%=4eth stake will be credited to you
* The smartcontract is ***smart***, so the user doesn't have to. Sending excess funds results in partial refund.
  * Eg. in the previous case if you send 10 eth with lower than 100gwei gas price results in crediting 4eth stake to you and refunding 6eth.


### EthealNormalSale
Almost identical to EthealPreSale, except is has no minimum goal thus no refund. Until reaching softcap it sells tokens for 1000 HEAL/ETH, and above the softcap is sells all the 20M HEAL tokens, and everyone get HEAL tokens in proportion of their stakes to the total stakes.

There is a bonus structure, when contributing on the first day people get +40% stakes, on the second day +20% stakes, on the rest of the first week +15% stakes, on the second week +10% stakes and on the third week +5% stakes.
![Normal Sale bonus](https://etheal.com/img/illustrations/tokenbonus.svg "Normal Sale bonus")

## Deployment

### Initial deployment
1) deploy multisig wallet
2) deploy MiniMeTokenFactory
3) deploy EthealController
4) deploy EthealToken with EthealController address and MiniMeTokenFactory address
5) EthealController -> setEthealToken(EthealToken.address, 0)
  * 0 is for the Hodler reward contract address, it means the controller will create and assign to itself a new hodler contract
6) deploy PreSale -> EthealController.address
7) EthealController -> setCrowdsaleTransfer PreSale.address

### Deploying a new crowdsale
*only when no active crowdsale is present*
1) deploy Crowdsale with the address of EthealController
2) send funds and set address with EthealController.setCrowdsaleTransfer

### Deploying a new EthealToken fork
1) EthealToken -> createCloneToken
2) EthealController -> setEthealToken(new EthealToken.address, 0)

### Deploying a new EthealController
*multisig wallet is needed*
1) deploy new EthealController
2) new EthealController -> setEthealToken(EthealToken.address, Hodler.address)
3) old EthealController -> setNewController(new EthealController.address)


## Test results and gas usage

```
Contract: Controller
    ✓ should fail to send eth to the token (4600000 gas)
    new controller
      ✓ should fail to set new controller from other address than wallet (9200000 gas)
      ✓ should fail to set new controller to 0x0 (4600000 gas)
      ✓ should set a new controller by wallet (146535 gas)
      ✓ should fail to set a new controller twice (4734193 gas)
    new multisig
      ✓ should fail to set new multisig from other address than wallet (9200000 gas)
      ✓ should fail to set new multisig to zero (4600000 gas)
      ✓ should set a new wallet by wallet (28381 gas)
    burn
      ✓ should fail to burn from other address than wallet (9200000 gas)
      ✓ should fail to burn tokens from other than controller or SALE address (4600000 gas)
      ✓ should burn tokens from controller address (89497 gas)
      ✓ should burn tokens from SALE address (88576 gas)
    recover tokens
      ✓ should recover tokens from controller (8603353 gas)
      ✓ should recover tokens from token (8604507 gas)
    creating a valid crowdsale
      ✓ should fail with zero wallet (4600000 gas)
    token distribution
      ✓ should create a total 100M tokens
      ✓ should allocate 43M token to SALE address
      ✓ should allocate 20M token to wallet address
      ✓ should allocate 10M token to HODL address
      ✓ should allocate 20.5M token to controller address
      ✓ should allocate 3.5M token to deployer address
      ✓ should allocate 3M token to investor address
    grants
      ✓ should not be created by anybody else than deployer (23000000 gas)
      ✓ should be able to grant advisor tokens (10434552 gas)
      ✓ should be able to grant teammate tokens (10434478 gas)
      ✓ should be able to increase token grant (5486695 gas)
      ✓ should not be able to revoke non-revokable grant (5340672 gas)
      ✓ should not be able to revoke an already revoked grant (5518633 gas)
      ✓ should be able to revoke before grant start (918633 gas)
      ✓ should be able to revoke before cliff start (918633 gas)
      ✓ should be able to revoke after cliff (920227 gas)
      ✓ should all tokens remain in vesting if revoked after vesting end (818011 gas)

  Contract: NormalSale
    creating a valid crowdsale
      ✓ should fail with zero rate (4600000 gas)
      ✓ should fail with zero cap (4600000 gas)
      ✓ should fail with greater softCap than cap (4600000 gas)
      ✓ should fail with zero controller (4600000 gas)
      ✓ should fail with zero wallet (4600000 gas)
    modify before sale
      ✓ should set valid caps (39369 gas)
      ✓ should fail to set valid caps after start (4600000 gas)
      ✓ should fail setting zero cap (4600000 gas)
      ✓ should fail setting greater softCap than cap (4600000 gas)
      ✓ should set valid times (32944 gas)
      ✓ should fail to set valid times after start (4600000 gas)
      ✓ should fail to set invalid times (9200000 gas)
      ✓ should set valid rate (27510 gas)
      ✓ should fail to set valid rate after start (4600000 gas)
      ✓ should fail to set invalid rate (4600000 gas)
    ending
      ✓ should be ended after end time
      ✓ should be ended after soft cap reached (164002 gas)
      ✓ should not end sooner if softCap is not reached (142161 gas)
    accepting payments
      ✓ should reject payments before start (9200000 gas)
      ✓ should reject payments smaller than min contribution (9200000 gas)
      ✓ should accept payments after start (242154 gas)
*** BUY TOKENS: 144993 gas used.
      ✓ should measure buyTokens tx costs (144993 gas)
      ✓ should reject payments after end (9200000 gas)
      ✓ should reject payments outside cap (4764012 gas)
      ✓ should refund payments that exceed cap (269147 gas)
    bonus
      ✓ should fail to calc bonus before start
      ✓ should calc 40% bonus on first day
      ✓ should calc 20% bonus on second day
      ✓ should calc 15% bonus on rest of the first week
      ✓ should calc 10% bonus during second week
      ✓ should calc 5% bonus during third week
    high-level purchase
      ✓ should log purchase (142161 gas)
      ✓ should assign 40% bonus for first day (142161 gas)
      ✓ should assign lower stake to sender above max gas limit (142612 gas)
      ✓ should assign 20% bonus for second day (142187 gas)
      ✓ should assign 15% bonus for rest of the first week (142250 gas)
      ✓ should assign 10% bonus for second week (142313 gas)
      ✓ should assign 5% bonus for third week (142365 gas)
    low-level purchase
      ✓ should log purchase (144993 gas)
      ✓ should assign 40% bonus for first day (144993 gas)
      ✓ should assign lower stake to sender above max gas limit (145444 gas)
      ✓ should assign 20% bonus for second day (145019 gas)
      ✓ should assign 15% bonus for rest of the first week (145082 gas)
      ✓ should assign 10% bonus for second week (145145 gas)
      ✓ should assign 5% bonus for third week (145197 gas)
    claim token
      ✓ should deny claim token before finish (9200000 gas)
      ✓ should allow claim token after finish below softCap (9792492 gas)
      ✓ should allow claim token after finish reaching soft cap (9699306 gas)
      ✓ should correctly distribute among multiple participants when buying on separate days (9923159 gas)
      ✓ should calculate with max gas penalty when claiming tokens (590652 gas)
      ✓ should send back excess tokens to controller's SALE address (423143 gas)
      ✓ should allow token transfer after controller unpaused (5327338 gas)
    whitelist
      ✓ should allow to set whitelist until start (138690 gas)
      ✓ should not allow to set whitelist after start (4738690 gas)
      ✓ should allow to delete from the whitelist (156764 gas)
      ✓ should allow to modify whitelist days (151536 gas)
      ✓ should not allow unwhitelisted contribution during whitelist period (4714429 gas)
      ✓ should allow contribution during whitelist period for whitelist addresses (4957517 gas)
      ✓ should apply max gas price penalty during whitelist period (260755 gas)
      ✓ should refund excess contribution during whitelist period (267413 gas)
      ✓ should deny contribution above whitelist limit during whitelist period (4859853 gas)
    hodl
      ✓ controller should own hodler
      ✓ should not allow to add hodler stake for anyone (13800000 gas)
      ✓ should set hodl stake based on contribution (497015 gas)
      ✓ should set hodl stake based on multiple contributions (553196 gas)
      ✓ should set hodl stake and apply max gas penalty (590652 gas)
      ✓ should invalidate hodl stake after transfer (633537 gas)
      ✓ should not invalidate hodl stake if receiving transfer, too early claim for 3 month reward (888608 gas)
      ✓ should not invalidate hodl stake if receiving transfer, distribute 3 month reward properly (1029363 gas)
      ✓ should not invalidate hodl stake if receiving transfer, distribute 6 month reward properly (1167718 gas)
      ✓ should not invalidate hodl stake if receiving transfer, distribute 9 month reward properly (1208547 gas)
      ✓ should not distribute hodl to two participants when called too early (782850 gas)
      ✓ should correctly distribute 3 month hodl reward to two participants (1008502 gas)
      ✓ should correctly distribute 6 month hodl reward to two participants (1222227 gas)
      ✓ should correctly distribute 9 month hodl reward to two participants (1270142 gas)

  Contract: PreSale
    ✓ should own vault
    creating a valid crowdsale
      ✓ should fail with zero rate (4600000 gas)
      ✓ should fail with zero goal (4600000 gas)
      ✓ should fail with zero softCap (4600000 gas)
      ✓ should fail with zero cap (4600000 gas)
      ✓ should fail with greater goal than softCap (4600000 gas)
      ✓ should fail with greater softCap than cap (4600000 gas)
      ✓ should fail with zero controller (4600000 gas)
      ✓ should fail with zero wallet (4600000 gas)
    modify before sale
      ✓ should set valid caps (44647 gas)
      ✓ should fail to set valid caps after start (4600000 gas)
      ✓ should fail setting zero goal (4600000 gas)
      ✓ should fail setting zero softCap (4600000 gas)
      ✓ should fail setting zero cap (4600000 gas)
      ✓ should fail setting greater goal than softCap (4600000 gas)
      ✓ should fail setting greater softCap than cap (4600000 gas)
      ✓ should set valid times (32944 gas)
      ✓ should fail to set valid times after start (4600000 gas)
      ✓ should fail to set invalid times (9200000 gas)
      ✓ should set valid rate (27510 gas)
      ✓ should fail to set valid rate after start (4600000 gas)
      ✓ should fail to set invalid rate (4600000 gas)
    ending
      ✓ should be ended after end time
      ✓ should be ended after soft cap reached (165185 gas)
      ✓ should not end sooner if softCap is not reached (143344 gas)
    accepting payments
      ✓ should reject payments before start (9200000 gas)
      ✓ should reject payments smaller than min contribution (9200000 gas)
      ✓ should accept payments after start (288132 gas)
*** BUY TOKENS: 168026 gas used.
      ✓ should measure buyTokens tx costs (168026 gas)
      ✓ should reject payments after end (9200000 gas)
      ✓ should reject payments outside cap (4765195 gas)
      ✓ should refund payments that exceed cap (270236 gas)
    high-level purchase
      ✓ should log purchase (165106 gas)
      ✓ should assign stake to sender (165106 gas)
      ✓ should assign lower stake to sender above max gas limit (165557 gas)
      ✓ should forward funds to vault (165106 gas)
    low-level purchase
      ✓ should log purchase (168026 gas)
      ✓ should assign stakes to beneficiary (168026 gas)
      ✓ should assign lower stake to sender above max gas limit (168477 gas)
      ✓ should forward funds to vault (168026 gas)
    refund
      ✓ should deny refunds before end (9200000 gas)
      ✓ should deny refunds after end if goal was reached (4743344 gas)
      ✓ should allow refunds after end if goal was not reached (352112 gas)
      ✓ should get full refund even when max gas penalty was applied (354953 gas)
      ✓ should forward funds to wallet after end if goal was reached (336114 gas)
      ✓ should forward funds to wallet when getting at least goal amount of funds (143344 gas)
      ✓ should not forward funds until getting goal amount of funds (165106 gas)
      ✓ should be able to extract tokens from vault after sale (5427453 gas)
    claim token
      ✓ should deny claim token before end (9200000 gas)
      ✓ should deny claim token after end if goal was not reached (4765106 gas)
      ✓ should allow claim token after end if goal was reached (9779741 gas)
      ✓ should calculate with max gas penalty when claiming tokens (577835 gas)
      ✓ should send back excess tokens to controller's SALE address (336114 gas)
      ✓ should allow token transfer after controller unpaused (5315593 gas)
    whitelist
      ✓ should allow to set whitelist until start (138690 gas)
      ✓ should not allow to set whitelist after start (4738690 gas)
      ✓ should allow to delete from the whitelist (156764 gas)
      ✓ should allow to modify whitelist days (151536 gas)
      ✓ should not allow unwhitelisted contribution during whitelist period (4714429 gas)
      ✓ should allow contribution during whitelist period for whitelist addresses (5001286 gas)
      ✓ should apply max gas price penalty during whitelist period (282086 gas)
      ✓ should refund excess contribution during whitelist period (288750 gas)
      ✓ should deny contribution above whitelist limit during whitelist period (4881190 gas)
    hodl
      ✓ controller should own hodler
      ✓ should not allow to add hodler stake for anyone (13800000 gas)
      ✓ should set hodl stake based on contribution (577384 gas)
      ✓ should set hodl stake based on multiple contributions (663210 gas)
      ✓ should set hodl stake and apply max gas penalty (577835 gas)
      ✓ should invalidate hodl stake after transfer (714530 gas)
      ✓ should not invalidate hodl stake if receiving transfer and stake should remain unchanged (971288 gas)

·------------------------------------------------------------------------------------------|----------------------------·
│                                           Gas                                            ·  Block limit: 4712388 gas  │
·······················································|···································|·····························
│  Methods                                             ·            5 gwei/gas             ·       280.07 eur/eth       │
························|······························|···········|···········|···········|··············|··············
│  Contract             ·  Method                      ·  Min      ·  Max      ·  Avg      ·  # calls     ·  eur (avg)  │
························|······························|···········|···········|···········|··············|··············
│  EthealController     ·  burn                        ·    88576  ·    89497  ·    89037  ·           2  ·       0.12  │
························|······························|···········|···········|···········|··············|··············
│  EthealController     ·  claimTokenTokens            ·        -  ·        -  ·   151095  ·           1  ·       0.21  │
························|······························|···········|···········|···········|··············|··············
│  EthealController     ·  createGrant                 ·   740672  ·   755736  ·   754302  ·          11  ·       1.06  │
························|······························|···········|···········|···········|··············|··············
│  EthealController     ·  revokeGrant                 ·    62275  ·   164491  ·   143091  ·           5  ·       0.20  │
························|······························|···········|···········|···········|··············|··············
│  EthealController     ·  setCrowdsaleTransfer        ·        -  ·        -  ·        -  ·           0  ·          -  │
························|······························|···········|···········|···········|··············|··············
│  EthealController     ·  setEthealToken              ·        -  ·        -  ·  1413872  ·           2  ·       1.98  │
························|······························|···········|···········|···········|··············|··············
│  EthealController     ·  setNewController            ·   134193  ·   146535  ·   140364  ·           2  ·       0.20  │
························|······························|···········|···········|···········|··············|··············
│  EthealController     ·  setNewMultisig              ·        -  ·        -  ·    28381  ·           1  ·       0.04  │
························|······························|···········|···········|···········|··············|··············
│  EthealController     ·  transferToGrant             ·        -  ·        -  ·   130959  ·           1  ·       0.18  │
························|······························|···········|···········|···········|··············|··············
│  EthealNormalSale     ·  setCaps                     ·        -  ·        -  ·    39369  ·           1  ·       0.06  │
························|······························|···········|···········|···········|··············|··············
│  EthealPreSale        ·  claimRefundFor              ·        -  ·        -  ·        -  ·           0  ·          -  │
························|······························|···········|···········|···········|··············|··············
│  EthealPreSale        ·  claimRefundsFor             ·        -  ·        -  ·    28028  ·           1  ·       0.04  │
························|······························|···········|···········|···········|··············|··············
│  EthealPreSale        ·  claimToken                  ·   167058  ·   241270  ·   204219  ·          12  ·       0.29  │
························|······························|···········|···········|···········|··············|··············
│  EthealPreSale        ·  claimTokenFor               ·        -  ·        -  ·        -  ·           0  ·          -  │
························|······························|···········|···········|···········|··············|··············
│  EthealPreSale        ·  claimTokensFor              ·   169349  ·   352949  ·   269607  ·          14  ·       0.38  │
························|······························|···········|···········|···········|··············|··············
│  EthealPreSale        ·  extractVaultTokens          ·        -  ·        -  ·   110566  ·           1  ·       0.15  │
························|······························|···········|···········|···········|··············|··············
│  EthealPreSale        ·  setCaps                     ·        -  ·        -  ·    44647  ·           1  ·       0.06  │
························|······························|···········|···········|···········|··············|··············
│  EthealPreSale        ·  setMaxGas                   ·        -  ·        -  ·        -  ·           0  ·          -  │
························|······························|···········|···········|···········|··············|··············
│  EthealPreSale        ·  setMinContribution          ·        -  ·        -  ·        -  ·           0  ·          -  │
························|······························|···········|···········|···········|··············|··············
│  EthealPreSale        ·  setRate                     ·        -  ·        -  ·    27510  ·           2  ·       0.04  │
························|······························|···········|···········|···········|··············|··············
│  EthealPreSale        ·  setTimes                    ·        -  ·        -  ·    32944  ·           2  ·       0.05  │
························|······························|···········|···········|···········|··············|··············
│  EthealPreSale        ·  setWhitelist                ·    18074  ·   138690  ·   105257  ·          22  ·       0.15  │
························|······························|···········|···········|···········|··············|··············
│  Hodler               ·  claimHodlReward             ·        -  ·        -  ·        -  ·           0  ·          -  │
························|······························|···········|···········|···········|··············|··············
│  Hodler               ·  claimHodlRewardFor          ·        -  ·        -  ·        -  ·           0  ·          -  │
························|······························|···········|···········|···········|··············|··············
│  Hodler               ·  claimHodlRewardsFor         ·    27397  ·   292291  ·   177698  ·          12  ·       0.25  │
························|······························|···········|···········|···········|··············|··············
│  Hodler               ·  invalidate                  ·        -  ·        -  ·        -  ·           0  ·          -  │
························|······························|···········|···········|···········|··············|··············
│  Hodler               ·  updateAndGetHodlTotalValue  ·        -  ·        -  ·        -  ·           0  ·          -  │
························|······························|···········|···········|···········|··············|··············
│  MiniMeToken          ·  approve                     ·        -  ·        -  ·        -  ·           0  ·          -  │
························|······························|···········|···········|···········|··············|··············
│  MiniMeToken          ·  approveAndCall              ·        -  ·        -  ·        -  ·           0  ·          -  │
························|······························|···········|···········|···········|··············|··············
│  MiniMeToken          ·  changeController            ·        -  ·        -  ·        -  ·           0  ·          -  │
························|······························|···········|···········|···········|··············|··············
│  MiniMeToken          ·  claimTokens                 ·        -  ·        -  ·        -  ·           0  ·          -  │
························|······························|···········|···········|···········|··············|··············
│  MiniMeToken          ·  createCloneToken            ·        -  ·        -  ·        -  ·           0  ·          -  │
························|······························|···········|···········|···········|··············|··············
│  MiniMeToken          ·  destroyTokens               ·        -  ·        -  ·        -  ·           0  ·          -  │
························|······························|···········|···········|···········|··············|··············
│  MiniMeToken          ·  enableTransfers             ·        -  ·        -  ·        -  ·           0  ·          -  │
························|······························|···········|···········|···········|··············|··············
│  MiniMeToken          ·  generateTokens              ·        -  ·        -  ·        -  ·           0  ·          -  │
························|······························|···········|···········|···········|··············|··············
│  MiniMeToken          ·  transfer                    ·   108784  ·   127066  ·   117907  ·          10  ·       0.17  │
························|······························|···········|···········|···········|··············|··············
│  MiniMeToken          ·  transferFrom                ·        -  ·        -  ·        -  ·           0  ·          -  │
························|······························|···········|···········|···········|··············|··············
│  Pausable             ·  pause                       ·        -  ·        -  ·        -  ·           0  ·          -  │
························|······························|···········|···········|···········|··············|··············
│  Pausable             ·  unpause                     ·        -  ·        -  ·    28353  ·          20  ·       0.04  │
························|······························|···········|···········|···········|··············|··············
│  RefundableCrowdsale  ·  buyTokens                   ·    99993  ·   168477  ·   148298  ·          15  ·       0.21  │
························|······························|···········|···········|···········|··············|··············
│  RefundableCrowdsale  ·  claimRefund                 ·        -  ·        -  ·    25638  ·           1  ·       0.04  │
························|······························|···········|···········|···········|··············|··············
│  RefundableCrowdsale  ·  finalize                    ·   161368  ·   280982  ·   193895  ·          31  ·       0.27  │
························|······························|···········|···········|···········|··············|··············
│  RefundVault          ·  close                       ·        -  ·        -  ·        -  ·           0  ·          -  │
························|······························|···········|···········|···········|··············|··············
│  RefundVault          ·  deposit                     ·        -  ·        -  ·        -  ·           0  ·          -  │
························|······························|···········|···········|···········|··············|··············
│  RefundVault          ·  enableRefunds               ·        -  ·        -  ·        -  ·           0  ·          -  │
························|······························|···········|···········|···········|··············|··············
│  RefundVault          ·  extractTokens               ·        -  ·        -  ·   149941  ·           1  ·       0.21  │
························|······························|···········|···········|···········|··············|··············
│  RefundVault          ·  refund                      ·        -  ·        -  ·        -  ·           0  ·          -  │
························|······························|···········|···········|···········|··············|··············
│  TokenController      ·  addHodlerStake              ·        -  ·        -  ·        -  ·           0  ·          -  │
························|······························|···········|···········|···········|··············|··············
│  TokenController      ·  onApprove                   ·        -  ·        -  ·        -  ·           0  ·          -  │
························|······························|···········|···········|···········|··············|··············
│  TokenController      ·  onTransfer                  ·        -  ·        -  ·        -  ·           0  ·          -  │
························|······························|···········|···········|···········|··············|··············
│  TokenController      ·  proxyPayment                ·        -  ·        -  ·        -  ·           0  ·          -  │
························|······························|···········|···········|···········|··············|··············
│  TokenController      ·  setHodlerStake              ·        -  ·        -  ·        -  ·           0  ·          -  │
························|······························|···········|···········|···········|··············|··············
│  TokenController      ·  setHodlerTime               ·        -  ·        -  ·        -  ·           0  ·          -  │
························|······························|···········|···········|···········|··············|··············
│  TokenVesting         ·  release                     ·   140385  ·   168790  ·   154588  ·           8  ·       0.22  │
························|······························|···········|···········|···········|··············|··············
│  TokenVesting         ·  revoke                      ·        -  ·        -  ·        -  ·           0  ·          -  │
························|······························|···········|···········|···········|··············|··············
│  TokenVesting         ·  transferOwnership           ·        -  ·        -  ·        -  ·           0  ·          -  │
························|······························|···········|···········|···········|··············|··············
│  Deployments                                         ·                                   ·  % of limit  ·             │
·······················································|···········|···········|···········|··············|··············
│  CappedCrowdsale                                     ·  1909401  ·  4150066  ·  2782057  ·        59 %  ·       3.90  │
·------------------------------------------------------|-----------|-----------|-----------|--------------|-------------·

  177 passing (34m)
  ```
