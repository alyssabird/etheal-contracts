# Test results and gas usage

[![Build Status](https://travis-ci.org/BlockchainLabsNZ/etheal-contracts.svg?branch=master)](https://travis-ci.org/BlockchainLabsNZ/etheal-contracts) [![Coverage Status](https://coveralls.io/repos/github/BlockchainLabsNZ/etheal-contracts/badge.svg?branch=master)](https://coveralls.io/github/BlockchainLabsNZ/etheal-contracts?branch=master)

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
