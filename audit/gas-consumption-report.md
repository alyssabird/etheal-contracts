# Gas consumption report
performed by Blockchain Labs, March 13, 2018


```

  Contract: NormalSale
    creating a valid crowdsale
      ✓ should fail with zero rate (765466 gas)
      ✓ should fail with zero cap (865979 gas)
      ✓ should fail with greater softCap than cap (906858 gas)
      ✓ should fail with zero controller (885184 gas)
      ✓ should fail with zero wallet (764412 gas)
    modify parameters
      ✓ should set valid mincontribution (13695 gas)
      ✓ should fail to set mincintribution from other address than deployer (22383 gas)
      ✓ should set valid caps (39319 gas)
      ✓ should fail setting zero cap (23913 gas)
      ✓ should fail setting greater softCap than cap (24297 gas)
      ✓ should fail setting cap by other than deployer (24271 gas)
      ✓ should set valid times (32744 gas)
      ✓ should fail to set invalid times (22725 gas)
      ✓ should fail to set times by other than deployer (22699 gas)
      ✓ should set valid rate (27343 gas)
      ✓ should fail to set invalid rate (22208 gas)
      ✓ should fail to set rate by other than deployer (22313 gas)
      ✓ should set valid promo token controller (28510 gas)
      ✓ should fail to set invalid promo token controller (23128 gas)
      ✓ should fail to set promo token controller by other than deployer (23094 gas)
      ✓ should set valid whitelist (34219 gas)
      ✓ should set threshold only for invalid whitelist address (27640 gas)
      ✓ should fail to set whitelist by other than deployer (23816 gas)
      ✓ should set valid deposit (28902 gas)
      ✓ should fail to set deposit by other than deployer (23584 gas)
    ending
      ✓ should be ended after end time
      ✓ should be ended after soft cap reached (232966 gas)
      ✓ should not end sooner if softCap is not reached (162258 gas)
      ✓ should be ended after cap reached (232841 gas)
    whitelist
      ✓ should fail for 0 initial signer (175338 gas)
      ✓ should be able to set new signer (28695 gas)
      ✓ should fail to set zero address signer (22097 gas)
      ✓ should fail to set new signer by other than deployer (23279 gas)
      ✓ should be able to set new whitelist (45385 gas)
      ✓ should be able to remove whitelist (60706 gas)
      ✓ should fail to set whitelist to address 0x0 (22279 gas)
      ✓ should fail to set new whitelist by other than deployer (23461 gas)
      ✓ should be able to set many new whitelist (70086 gas)
      ✓ should be able to set many new whitelist to false (90097 gas)
      ✓ should fail to set many new whitelist by other than deployer (25324 gas)
      ✓ should return false for checking offline signature for empty string
      ✓ should return false for checking offline signature for invalid signature
      ✓ should return true for checking valid offline signature
      ✓ should return true for checking valid offline signature by any account
      ✓ should return false for checking old offline signature after changing signer (28695 gas)
      ✓ should return true for checking new offline signature after changing signer (28695 gas)
    bonus
      ✓ should give the biggest bonus before sale
      ✓ should give the biggest bonus now
      ✓ should sale day now 0 before sale
      ✓ should sale hour now 0 before sale
      ✓ should calculate bonus for first 0.5 hour: 130
      ✓ should calculate bonus for first 1.5 hour: 125
      ✓ should calculate bonus for first 2.5 hour: 125
      ✓ should calculate bonus for first 3.5 hour: 125
      ✓ should calculate bonus for first 4.5 hour: 125
      ✓ should calculate bonus for first 5.5 hour: 120
      ✓ should calculate bonus for first 6.5 hour: 120
      ✓ should calculate bonus for first 7.5 hour: 120
      ✓ should calculate bonus for first 8.5 hour: 118
      ✓ should calculate bonus for first 9.5 hour: 118
      ✓ should calculate bonus for first 10.5 hour: 118
      ✓ should calculate bonus for first 11.5 hour: 118
      ✓ should calculate bonus for first 12.5 hour: 118
      ✓ should calculate bonus for first 13.5 hour: 118
      ✓ should calculate bonus for first 14.5 hour: 118
      ✓ should calculate bonus for first 15.5 hour: 118
      ✓ should calculate bonus for first 16.5 hour: 118
      ✓ should calculate bonus for first 17.5 hour: 118
      ✓ should calculate bonus for first 18.5 hour: 118
      ✓ should calculate bonus for first 19.5 hour: 118
      ✓ should calculate bonus for first 20.5 hour: 118
      ✓ should calculate bonus for first 21.5 hour: 118
      ✓ should calculate bonus for first 22.5 hour: 118
      ✓ should calculate bonus for first 23.5 hour: 118
      ✓ should calculate bonus for day 2.5: 116
      ✓ should calculate bonus for day 3.5: 115
      ✓ should calculate bonus for day 4.5: 114
      ✓ should calculate bonus for day 5.5: 114
      ✓ should calculate bonus for day 6.5: 113
      ✓ should calculate bonus for day 7.5: 113
      ✓ should calculate bonus for day 8.5: 112
      ✓ should calculate bonus for day 9.5: 112
      ✓ should calculate bonus for day 10.5: 111
      ✓ should calculate bonus for day 11.5: 111
      ✓ should calculate bonus for day 12.5: 110
      ✓ should calculate bonus for day 13.5: 110
      ✓ should calculate bonus for day 14.5: 108
      ✓ should calculate bonus for day 15.5: 108
      ✓ should calculate bonus for day 16.5: 107
      ✓ should calculate bonus for day 17.5: 107
      ✓ should calculate bonus for day 18.5: 106
      ✓ should calculate bonus for day 19.5: 106
      ✓ should calculate bonus for day 20.5: 105
      ✓ should calculate bonus for day 21.5: 105
      ✓ should calculate bonus for day 22.5: 104
      ✓ should calculate bonus for day 23.5: 104
      ✓ should calculate bonus for day 24.5: 103
      ✓ should calculate bonus for day 25.5: 103
      ✓ should calculate bonus for day 26.5: 102
      ✓ should calculate bonus for day 27.5: 102
      ✓ should calculate bonus for day 28.5: 100
      ✓ should calculate bonus for day 29.5: 100
      ✓ should give no bonus above below 10 eth
      ✓ should give bonus above 10 eth
      ✓ should give bonus above 100 eth
      ✓ should give no individual bonus if its not set
      ✓ should fail setting extra bonus for address 0x0 (22380 gas)
      ✓ should give individial bonus if set (43814 gas)
      ✓ should fail for setting individual bonus other than the deployer (23562 gas)
      ✓ should give multiple individial bonus if set (66774 gas)
      ✓ should combine individual, time and size based bonuses (43814 gas)
    promo token
      ✓ should not be able to send ether to controller since no payable function (21046 gas)
      ✓ should be able to extract token from controller by owner (314249 gas)
      ✓ should not be able to extract token from controller by other than owner (190704 gas)
      ✓ should not be able to send ether to promo token contract (31565 gas)
      ✓ should be able to extract token from promo token by owner (316088 gas)
      ✓ should not be able to extract promo token from promo token (23850 gas)
      ✓ should not be able to extract token from promo token by other than owner (189215 gas)
      ✓ should be able to set new controller (1056715 gas)
      ✓ should not be able to set new controller by other than owner (1024258 gas)
      ✓ should not be able to set zero new controller (22277 gas)
      ✓ should not be able to set new controller when it is already done (1080555 gas)
      ✓ should be able to set new crowdsale (28802 gas)
      ✓ should not be able to set zero as new crowdsale (22204 gas)
      ✓ should not be able to set new crowdsale by other than owner (23386 gas)
      ✓ should be able to set new PromoToken (28692 gas)
      ✓ shoul failt to set 0 as new PromoToken (22094 gas)
      ✓ should not be able to set new PromoToken by other than owner (23276 gas)
      ✓ should be able to distribute (113447 gas)
      ✓ should be able to distribute to many (171859 gas)
      ✓ should not be able to distribute by other than owner (23838 gas)
      ✓ should be set bonus by owner (44958 gas)
      ✓ should be fail to set by any address than owner or PromoController (24432 gas)
      ✓ should fail to transfer when it is paused (172421 gas)
      ✓ should be set bonus by sending to 0x1 (240242 gas)
      ✓ should be set bonus by sending to PromoController (241618 gas)
      ✓ should be set bonus by sending to Crowdsale (241913 gas)
      ✓ should be set bonus only once even though sent twice (337890 gas)
      ✓ should override smaller extra bonus (270727 gas)
      ✓ should not override larger extra bonus (265580 gas)
      ✓ should not be able to burn what is not there (27746 gas)
      ✓ should be able to burn (202287 gas)
      ✓ should be able to burn at many addresses (307292 gas)
      ✓ should not be able to burn by other than owner (137527 gas)
      ✓ should approve if not paused (34708 gas)
      ✓ should disapprove if paused (55947 gas)
      ✓ should not be paused by other than owner (21985 gas)
    deposit
      ✓ should fail for initiating with 0x0 sale address (578394 gas)
      ✓ should fail deposit without whitelist (2157493 gas)
      ✓ should fail deposit after sale end (28460 gas)
      ✓ should fail deposit for zero address (27948 gas)
      ✓ should fail deposit with zero value (29250 gas)
      ✓ should set new sale address (28594 gas)
      ✓ should fail to set new sale address by other than owner (23276 gas)
      ✓ should set new whitelist address (28660 gas)
      ✓ should fail to set new whitelist address by other than owner (23342 gas)
      ✓ should be able to extract token (318455 gas)
      ✓ should not be able to extract token before end (195365 gas)
      ✓ should not be able to extract token after end if there are pending transactions (354889 gas)
      ✓ should not be able to extract token from controller by other than owner (190704 gas)
      ✓ should be able to deposit through payable fallback (159974 gas)
      ✓ should forward fallback deposit if whitelisted (346580 gas)
      ✓ should forward fallback deposit if below the limit (310319 gas)
      ✓ should get the same bonus for fallback deposit if forwarded later (385720 gas)
      ✓ should be able to deposit (162743 gas)
      ✓ should forward deposit if whitelisted (349349 gas)
      ✓ should forward deposit if below the limit (313088 gas)
      ✓ should forward deposit if offchain signed (329751 gas)
      ✓ should fail to forward if cleared (341261 gas)
      ✓ should fail to forward non existent transaction (27741 gas)
      ✓ should fail to forward transaction without signature (234553 gas)
      ✓ should get the same bonus for deposit if forwarded later (388489 gas)
      ✓ should forward many transactions (597807 gas)
      ✓ should forward investor transactions if whitelisted (602450 gas)
      ✓ should forward investor transactions if offchain signed (593841 gas)
      ✓ should fail for non existent transaction (26559 gas)
      ✓ should refund transaction after end (195004 gas)
      ✓ should fail to refund an already forwarded item (189302 gas)
      ✓ should fail to refund an already refunded item (221565 gas)
      ✓ should refund many transactions after end (349974 gas)
      ✓ should refund investor transactions after end (352950 gas)
      ✓ should list both cleared and non-cleared transactions (497092 gas)
      ✓ should list cleared transactions (497092 gas)
      ✓ should list non-cleared transactions (497092 gas)
      ✓ should list no transactions (497092 gas)
    payments to crowdsale
      ✓ should reject payments smaller than min contribution (53466 gas)
      ✓ should reject zero payments (28254 gas)
      ✓ should reject payments for 0x0 address (23296 gas)
      ✓ should fail to call depositEth if not deposit address (23474 gas)
      ✓ should accept payments before start (282568 gas)
      ✓ should accept payments after start (282568 gas)
*** BUY TOKENS: 165310 gas used.
      ✓ should measure buyTokens tx costs (165310 gas)
      ✓ should reject payments after end (49278 gas)
      ✓ should reject payments outside cap (256834 gas)
      ✓ should refund payments that exceed cap (385517 gas)
      ✓ should reject depositOffchain other initiated by owner (25497 gas)
      ✓ should reject depositOffchain with 0x0 address (24651 gas)
      ✓ should depositOffchain (158615 gas)
    low-level purchase
      ✓ should log purchase (162258 gas)
    hight-level purchase
      ✓ should log purchase (165310 gas)
      ✓ should give back how much one can contribute
      ✓ should fail when contribution amount is queried for 0x0
      ✓ should give proper contributor count for zero
      ✓ should give proper contributor count for two (285620 gas)
      ✓ should list both pending and claimed contributors (285620 gas)
      ✓ should list pending contributors (722989 gas)
      ✓ should list claimed contributors (722989 gas)
      ✓ should list no contributors (722989 gas)
    claim token
      ✓ should deny claim token before finish (44354 gas)
      ✓ should allow claim token after finish below softCap (677914 gas)
      ✓ should allow claim token after finish reaching soft cap (677578 gas)
      ✓ should correctly distribute among multiple participants when buying on separate days (910339 gas)
      ✓ should send back excess tokens to controllers SALE address (465050 gas)
      ✓ should allow token transfer after controller unpaused (835328 gas)
    hodl
      ✓ controller should own hodler
      ✓ should not allow to add hodler stake for anyone (71214 gas)
      ✓ should set hodl stake based on contribution (652219 gas)
      ✓ should set hodl stake based on multiple contributions (716047 gas)
      ✓ should invalidate hodl stake after transfer (788697 gas)
      ✓ should not invalidate hodl stake if receiving transfer, too early claim for 3 month reward (1088900 gas)
      ✓ should not invalidate hodl stake if receiving transfer, distribute 3 month reward properly (1231497 gas)
      ✓ should not invalidate hodl stake if receiving transfer, distribute 6 month reward properly (1367966 gas)
      ✓ should not invalidate hodl stake if receiving transfer, distribute 9 month reward properly (1408795 gas)
      ✓ should not distribute hodl to two participants when called too early (968370 gas)
      ✓ should correctly distribute 3 month hodl reward to two participants (1193978 gas)
      ✓ should correctly distribute 6 month hodl reward to two participants (1407659 gas)
      ✓ should correctly distribute 9 month hodl reward to two participants (1456506 gas)
      ✓ should correctly distribute 9 month hodl reward to two participants if it has excess token (1550791 gas)

·------------------------------------------------------------------------------------------------|-----------------------------------·
│                                              Gas                                               ·  Block limit: 17592186044415 gas  │
······························································|··································|····································
│  Methods                                                    ·           21 gwei/gas            ·          694.77 usd/eth           │
·······························|······························|··········|···········|···········|··················|·················
│  Contract                    ·  Method                      ·  Min     ·  Max      ·  Avg      ·  # calls         ·  usd (avg)     │
·······························|······························|··········|···········|···········|··················|·················
│  EthealController            ·  burn                        ·       -  ·        -  ·        -  ·               0  ·             -  │
·······························|······························|··········|···········|···········|··················|·················
│  EthealController            ·  createGrant                 ·       -  ·        -  ·        -  ·               0  ·             -  │
·······························|······························|··········|···········|···········|··················|·················
│  EthealController            ·  revokeGrant                 ·       -  ·        -  ·        -  ·               0  ·             -  │
·······························|······························|··········|···········|···········|··················|·················
│  EthealController            ·  setCrowdsaleTransfer        ·       -  ·        -  ·        -  ·               0  ·             -  │
·······························|······························|··········|···········|···········|··················|·················
│  EthealController            ·  setEthealToken              ·       -  ·        -  ·        -  ·               0  ·             -  │
·······························|······························|··········|···········|···········|··················|·················
│  EthealController            ·  setNewMultisig              ·       -  ·        -  ·        -  ·               0  ·             -  │
·······························|······························|··········|···········|···········|··················|·················
│  EthealController            ·  transferToGrant             ·       -  ·        -  ·        -  ·               0  ·             -  │
·······························|······························|··········|···········|···········|··················|·················
│  EthealDeposit               ·  deposit                     ·   24466  ·   329751  ·   175960  ·              32  ·          2.57  │
·······························|······························|··········|···········|···········|··················|·················
│  EthealDeposit               ·  forwardInvestorTransaction  ·  261579  ·   298355  ·   279967  ·               2  ·          4.08  │
·······························|······························|··········|···········|···········|··················|·················
│  EthealDeposit               ·  forwardManyTransaction      ·       -  ·        -  ·   256936  ·               1  ·          3.75  │
·······························|······························|··········|···········|···········|··················|·················
│  EthealDeposit               ·  forwardTransaction          ·   27741  ·   180361  ·    97689  ·               5  ·          1.43  │
·······························|······························|··········|···········|···········|··················|·················
│  EthealDeposit               ·  refundInvestor              ·       -  ·        -  ·    57464  ·               1  ·          0.84  │
·······························|······························|··········|···········|···········|··················|·················
│  EthealDeposit               ·  refundManyTransaction       ·       -  ·        -  ·    54488  ·               1  ·          0.79  │
·······························|······························|··········|···········|···········|··················|·················
│  EthealDeposit               ·  refundTransaction           ·   26559  ·    32261  ·    28840  ·               5  ·          0.42  │
·······························|······························|··········|···········|···········|··················|·················
│  EthealDeposit               ·  setSale                     ·   23276  ·    28594  ·    25935  ·               2  ·          0.38  │
·······························|······························|··········|···········|···········|··················|·················
│  EthealDeposit               ·  setWhitelist                ·   23342  ·    28660  ·    26001  ·               2  ·          0.38  │
·······························|······························|··········|···········|···········|··················|·················
│  EthealNormalSale            ·  buyTokens                   ·       -  ·        -  ·        -  ·               0  ·             -  │
·······························|······························|··········|···········|···········|··················|·················
│  EthealNormalSale            ·  claimManyTokenFor           ·  167512  ·   276582  ·   242487  ·              15  ·          3.54  │
·······························|······························|··········|···········|···········|··················|·················
│  EthealNormalSale            ·  depositOffchain             ·   24651  ·   158615  ·    69588  ·               3  ·          1.02  │
·······························|······························|··········|···········|···········|··················|·················
│  EthealNormalSale            ·  setBonusExtra               ·   22380  ·    43814  ·    36866  ·               6  ·          0.54  │
·······························|······························|··········|···········|···········|··················|·················
│  EthealNormalSale            ·  setCaps                     ·   23913  ·    39319  ·    27950  ·               4  ·          0.41  │
·······························|······························|··········|···········|···········|··················|·················
│  EthealNormalSale            ·  setDeposit                  ·   23584  ·    28902  ·    26243  ·               2  ·          0.38  │
·······························|······························|··········|···········|···········|··················|·················
│  EthealNormalSale            ·  setManyBonusExtra           ·       -  ·        -  ·    66774  ·               1  ·          0.97  │
·······························|······························|··········|···········|···········|··················|·················
│  EthealNormalSale            ·  setPromoTokenController     ·   23094  ·    28510  ·    24911  ·               3  ·          0.36  │
·······························|······························|··········|···········|···········|··················|·················
│  EthealNormalSale            ·  setWhitelist                ·   23816  ·    34219  ·    28558  ·               3  ·          0.42  │
·······························|······························|··········|···········|···········|··················|·················
│  EthealPreSale               ·  claimRefundFor              ·       -  ·        -  ·        -  ·               0  ·             -  │
·······························|······························|··········|···········|···········|··················|·················
│  EthealPreSale               ·  claimRefundsFor             ·       -  ·        -  ·        -  ·               0  ·             -  │
·······························|······························|··········|···········|···········|··················|·················
│  EthealPreSale               ·  claimToken                  ·   22177  ·   165328  ·    85953  ·               9  ·          1.25  │
·······························|······························|··········|···········|···········|··················|·················
│  EthealPreSale               ·  claimTokenFor               ·       -  ·        -  ·        -  ·               0  ·             -  │
·······························|······························|··········|···········|···········|··················|·················
│  EthealPreSale               ·  claimTokensFor              ·       -  ·        -  ·        -  ·               0  ·             -  │
·······························|······························|··········|···········|···········|··················|·················
│  EthealPreSale               ·  extractVaultTokens          ·       -  ·        -  ·        -  ·               0  ·             -  │
·······························|······························|··········|···········|···········|··················|·················
│  EthealPreSale               ·  setCaps                     ·       -  ·        -  ·        -  ·               0  ·             -  │
·······························|······························|··········|···········|···········|··················|·················
│  EthealPreSale               ·  setMaxGas                   ·       -  ·        -  ·        -  ·               0  ·             -  │
·······························|······························|··········|···········|···········|··················|·················
│  EthealPreSale               ·  setMinContribution          ·   13695  ·    22383  ·    18039  ·               2  ·          0.26  │
·······························|······························|··········|···········|···········|··················|·················
│  EthealPreSale               ·  setRate                     ·   22208  ·    27343  ·    23955  ·               3  ·          0.35  │
·······························|······························|··········|···········|···········|··················|·················
│  EthealPreSale               ·  setTimes                    ·   22699  ·    32744  ·    26056  ·               3  ·          0.38  │
·······························|······························|··········|···········|···········|··················|·················
│  EthealPreSale               ·  setWhitelist                ·       -  ·        -  ·        -  ·               0  ·             -  │
·······························|······························|··········|···········|···········|··················|·················
│  EthealPromoTokenController  ·  burnManyToken               ·       -  ·        -  ·   135433  ·               1  ·          1.98  │
·······························|······························|··········|···········|···········|··················|·················
│  EthealPromoTokenController  ·  burnToken                   ·   24080  ·    88840  ·    46889  ·               3  ·          0.68  │
·······························|······························|··········|···········|···········|··················|·················
│  EthealPromoTokenController  ·  claimTokenTokens            ·   23540  ·   150413  ·    65934  ·               3  ·          0.96  │
·······························|······························|··········|···········|···········|··················|·················
│  EthealPromoTokenController  ·  distributeManyToken         ·       -  ·        -  ·   171859  ·               2  ·          2.51  │
·······························|······························|··········|···········|···········|··················|·················
│  EthealPromoTokenController  ·  distributeToken             ·   23838  ·   113447  ·   105301  ·              11  ·          1.54  │
·······························|······························|··········|···········|···········|··················|·················
│  EthealPromoTokenController  ·  setCrowdsale                ·   22204  ·    28802  ·    24797  ·               3  ·          0.36  │
·······························|······························|··········|···········|···········|··················|·················
│  EthealPromoTokenController  ·  setNewController            ·   22277  ·    55890  ·    36266  ·               5  ·          0.53  │
·······························|······························|··········|···········|···········|··················|·················
│  EthealPromoTokenController  ·  setPromoToken               ·   22094  ·    28692  ·    24687  ·               3  ·          0.36  │
·······························|······························|··········|···········|···········|··················|·················
│  EthealWhitelist             ·  setManyWhitelist            ·   20011  ·    70086  ·    63764  ·              15  ·          0.93  │
·······························|······························|··········|···········|···········|··················|·················
│  EthealWhitelist             ·  setSigner                   ·   22097  ·    28695  ·    26292  ·               5  ·          0.38  │
·······························|······························|··········|···········|···········|··················|·················
│  EthealWhitelist             ·  setWhitelist                ·   15321  ·    45385  ·    42381  ·              25  ·          0.62  │
·······························|······························|··········|···········|···········|··················|·················
│  Hodler                      ·  claimHodlReward             ·       -  ·        -  ·        -  ·               0  ·             -  │
·······························|······························|··········|···········|···········|··················|·················
│  Hodler                      ·  claimHodlRewardFor          ·       -  ·        -  ·        -  ·               0  ·             -  │
·······························|······························|··········|···········|···········|··················|·················
│  Hodler                      ·  claimHodlRewardsFor         ·   27397  ·   292247  ·   189423  ·              14  ·          2.76  │
·······························|······························|··········|···········|···········|··················|·················
│  Hodler                      ·  invalidate                  ·       -  ·        -  ·        -  ·               0  ·             -  │
·······························|······························|··········|···········|···········|··················|·················
│  Hodler                      ·  updateAndGetHodlTotalValue  ·       -  ·        -  ·        -  ·               0  ·             -  │
·······························|······························|··········|···········|···········|··················|·················
│  iEthealSale                 ·  depositEth                  ·       -  ·        -  ·    23474  ·               1  ·          0.34  │
·······························|······························|··········|···········|···········|··················|·················
│  iEthealSale                 ·  depositOffchain             ·       -  ·        -  ·        -  ·               0  ·             -  │
·······························|······························|··········|···········|···········|··················|·················
│  iEthealSale                 ·  setPromoBonus               ·   24432  ·    44958  ·    34695  ·               2  ·          0.51  │
·······························|······························|··········|···········|···········|··················|·················
│  MiniMeToken                 ·  approve                     ·   27594  ·    34708  ·    31151  ·               2  ·          0.45  │
·······························|······························|··········|···········|···········|··················|·················
│  MiniMeToken                 ·  approveAndCall              ·       -  ·        -  ·        -  ·               0  ·             -  │
·······························|······························|··········|···········|···········|··················|·················
│  MiniMeToken                 ·  changeController            ·       -  ·        -  ·        -  ·               0  ·             -  │
·······························|······························|··········|···········|···········|··················|·················
│  MiniMeToken                 ·  claimTokens                 ·       -  ·        -  ·        -  ·               0  ·             -  │
·······························|······························|··········|···········|···········|··················|·················
│  MiniMeToken                 ·  createCloneToken            ·       -  ·        -  ·        -  ·               0  ·             -  │
·······························|······························|··········|···········|···········|··················|·················
│  MiniMeToken                 ·  destroyTokens               ·       -  ·        -  ·        -  ·               0  ·             -  │
·······························|······························|··········|···········|···········|··················|·················
│  MiniMeToken                 ·  enableTransfers             ·       -  ·        -  ·        -  ·               0  ·             -  │
·······························|······························|··········|···········|···········|··················|·················
│  MiniMeToken                 ·  generateTokens              ·       -  ·        -  ·        -  ·               0  ·             -  │
·······························|······························|··········|···········|···········|··················|·················
│  MiniMeToken                 ·  transfer                    ·   30621  ·   137344  ·   118555  ·              24  ·          1.73  │
·······························|······························|··········|···········|···········|··················|·················
│  MiniMeToken                 ·  transferFrom                ·       -  ·        -  ·        -  ·               0  ·             -  │
·······························|······························|··········|···········|···········|··················|·················
│  Pausable                    ·  pause                       ·   21985  ·    28353  ·    26230  ·               3  ·          0.38  │
·······························|······························|··········|···········|···········|··················|·················
│  Pausable                    ·  unpause                     ·       -  ·        -  ·    28331  ·              19  ·          0.41  │
·······························|······························|··········|···········|···········|··················|·················
│  RefundableCrowdsale         ·  buyTokens                   ·   23296  ·   165310  ·   116962  ·              18  ·          1.71  │
·······························|······························|··········|···········|···········|··················|·················
│  RefundableCrowdsale         ·  claimRefund                 ·       -  ·        -  ·        -  ·               0  ·             -  │
·······························|······························|··········|···········|···········|··················|·················
│  RefundableCrowdsale         ·  finalize                    ·       -  ·        -  ·   254857  ·              20  ·          3.72  │
·······························|······························|··········|···········|···········|··················|·················
│  RefundVault                 ·  close                       ·       -  ·        -  ·        -  ·               0  ·             -  │
·······························|······························|··········|···········|···········|··················|·················
│  RefundVault                 ·  deposit                     ·       -  ·        -  ·        -  ·               0  ·             -  │
·······························|······························|··········|···········|···········|··················|·················
│  RefundVault                 ·  enableRefunds               ·       -  ·        -  ·        -  ·               0  ·             -  │
·······························|······························|··········|···········|···········|··················|·················
│  RefundVault                 ·  extractTokens               ·   25029  ·   152780  ·    68390  ·               6  ·          1.00  │
·······························|······························|··········|···········|···········|··················|·················
│  RefundVault                 ·  refund                      ·       -  ·        -  ·        -  ·               0  ·             -  │
·······························|······························|··········|···········|···········|··················|·················
│  TokenController             ·  addHodlerStake              ·       -  ·        -  ·    23738  ·               3  ·          0.35  │
·······························|······························|··········|···········|···········|··················|·················
│  TokenController             ·  onApprove                   ·       -  ·        -  ·        -  ·               0  ·             -  │
·······························|······························|··········|···········|···········|··················|·················
│  TokenController             ·  onTransfer                  ·       -  ·        -  ·        -  ·               0  ·             -  │
·······························|······························|··········|···········|···········|··················|·················
│  TokenController             ·  proxyPayment                ·       -  ·        -  ·        -  ·               0  ·             -  │
·······························|······························|··········|···········|···········|··················|·················
│  TokenController             ·  setHodlerStake              ·       -  ·        -  ·        -  ·               0  ·             -  │
·······························|······························|··········|···········|···········|··················|·················
│  TokenController             ·  setHodlerTime               ·       -  ·        -  ·        -  ·               0  ·             -  │
·······························|······························|··········|···········|···········|··················|·················
│  TokenVesting                ·  release                     ·       -  ·        -  ·        -  ·               0  ·             -  │
·······························|······························|··········|···········|···········|··················|·················
│  TokenVesting                ·  revoke                      ·       -  ·        -  ·        -  ·               0  ·             -  │
·······························|······························|··········|···········|···········|··················|·················
│  TokenVesting                ·  transferOwnership           ·       -  ·        -  ·        -  ·               0  ·             -  │
·······························|······························|··········|···········|···········|··················|·················
│  Deployments                                                ·                                  ·  % of limit      ·                │
······························································|··········|···········|···········|··················|·················
│  CappedCrowdsale                                            ·  173188  ·  4187789  ·  1825641  ·             0 %  ·         26.64  │
·-------------------------------------------------------------|----------|-----------|-----------|------------------|----------------·

  228 passing (41m)  
```

<br>

## Summary  
Upon finalization of the contracts to be used by Etheal, the contracts were assessed on the gas usage of each function to ensure there aren't any unforeseen issues with exceeding the block size GasLimit.

<br>
