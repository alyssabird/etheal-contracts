# Gas consumption report
performed by Blockchain Labs, March 15, 2018

```
  Contract: NormalSale
    creating a valid crowdsale
      √ should fail with zero rate (773026 gas)
      √ should fail with zero cap (873539 gas)
      √ should fail with greater softCap than cap (914354 gas)
      √ should fail with zero controller (892744 gas)
      √ should fail with zero wallet (771972 gas)
    modify parameters
      √ should set valid mincontribution (13695 gas)
      √ should fail to set mincintribution from other address than deployer (22383 gas)
      √ should set valid caps (39297 gas)
      √ should fail setting zero cap (23891 gas)
      √ should fail setting greater softCap than cap (24275 gas)
      √ should fail setting cap by other than deployer (24249 gas)
      √ should set valid times (33770 gas)
      √ should fail to set times after end time (23081 gas)
      √ should fail to set invalid times (22725 gas)
      √ should fail to set times by other than deployer (22699 gas)
      √ should set valid rate (27343 gas)
      √ should fail to set invalid rate (22208 gas)
      √ should fail to set rate by other than deployer (22313 gas)
      √ should set valid promo token controller (28488 gas)
      √ should fail to set invalid promo token controller (23106 gas)
      √ should fail to set promo token controller by other than deployer (23072 gas)
      √ should set valid whitelist (34219 gas)
      √ should set threshold only for invalid whitelist address (27640 gas)
      √ should fail to set whitelist by other than deployer (23816 gas)
      √ should set valid deposit (28902 gas)
      √ should fail to set deposit by other than deployer (23584 gas)
    ending
      √ should be ended after end time
      √ should be ended after soft cap reached (233160 gas)
      √ should not end sooner if softCap is not reached (162452 gas)
      √ should be ended after cap reached (233967 gas)
    whitelist
      √ should fail for 0 initial signer (175338 gas)
      √ should be able to set new signer (28695 gas)
      √ should fail to set zero address signer (22097 gas)
      √ should fail to set new signer by other than deployer (23279 gas)
      √ should be able to set new whitelist (45385 gas)
      √ should be able to remove whitelist (60706 gas)
      √ should fail to set whitelist to address 0x0 (22279 gas)
      √ should fail to set new whitelist by other than deployer (23461 gas)
      √ should be able to set many new whitelist (70086 gas)
      √ should be able to set many new whitelist to false (90097 gas)
      √ should fail to set many new whitelist by other than deployer (25324 gas)
      √ should return false for checking offline signature for empty string
      √ should return false for checking offline signature for invalid signature
      √ should return true for checking valid offline signature
      √ should return true for checking valid offline signature by any account
      √ should return false for checking old offline signature after changing signer (28695 gas)
      √ should return true for checking new offline signature after changing signer (28695 gas)
    bonus
      √ should give the biggest bonus before sale
      √ should give the biggest bonus now
      √ should sale day now 0 before sale
      √ should sale hour now 0 before sale
      √ should calculate bonus for first 0.5 hour: 130
      √ should calculate bonus for first 1.5 hour: 125
      √ should calculate bonus for first 2.5 hour: 125
      √ should calculate bonus for first 3.5 hour: 125
      √ should calculate bonus for first 4.5 hour: 125
      √ should calculate bonus for first 5.5 hour: 120
      √ should calculate bonus for first 6.5 hour: 120
      √ should calculate bonus for first 7.5 hour: 120
      √ should calculate bonus for first 8.5 hour: 118
      √ should calculate bonus for first 9.5 hour: 118
      √ should calculate bonus for first 10.5 hour: 118
      √ should calculate bonus for first 11.5 hour: 118
      √ should calculate bonus for first 12.5 hour: 118
      √ should calculate bonus for first 13.5 hour: 118
      √ should calculate bonus for first 14.5 hour: 118
      √ should calculate bonus for first 15.5 hour: 118
      √ should calculate bonus for first 16.5 hour: 118
      √ should calculate bonus for first 17.5 hour: 118
      √ should calculate bonus for first 18.5 hour: 118
      √ should calculate bonus for first 19.5 hour: 118
      √ should calculate bonus for first 20.5 hour: 118
      √ should calculate bonus for first 21.5 hour: 118
      √ should calculate bonus for first 22.5 hour: 118
      √ should calculate bonus for first 23.5 hour: 118
      √ should calculate bonus for day 2.5: 116
      √ should calculate bonus for day 3.5: 115
      √ should calculate bonus for day 4.5: 114
      √ should calculate bonus for day 5.5: 114
      √ should calculate bonus for day 6.5: 113
      √ should calculate bonus for day 7.5: 113
      √ should calculate bonus for day 8.5: 112
      √ should calculate bonus for day 9.5: 112
      √ should calculate bonus for day 10.5: 111
      √ should calculate bonus for day 11.5: 111
      √ should calculate bonus for day 12.5: 110
      √ should calculate bonus for day 13.5: 110
      √ should calculate bonus for day 14.5: 108
      √ should calculate bonus for day 15.5: 108
      √ should calculate bonus for day 16.5: 107
      √ should calculate bonus for day 17.5: 107
      √ should calculate bonus for day 18.5: 106
      √ should calculate bonus for day 19.5: 106
      √ should calculate bonus for day 20.5: 105
      √ should calculate bonus for day 21.5: 105
      √ should calculate bonus for day 22.5: 104
      √ should calculate bonus for day 23.5: 104
      √ should calculate bonus for day 24.5: 103
      √ should calculate bonus for day 25.5: 103
      √ should calculate bonus for day 26.5: 102
      √ should calculate bonus for day 27.5: 102
      √ should calculate bonus for day 28.5: 100
      √ should calculate bonus for day 29.5: 100
      √ should give no bonus above below 10 eth
      √ should give bonus above 10 eth
      √ should give bonus above 100 eth
      √ should give no individual bonus if its not set
      √ should fail setting extra bonus for address 0x0 (22380 gas)
      √ should give individial bonus if set (43814 gas)
      √ should fail for setting individual bonus other than the deployer (23562 gas)
      √ should give multiple individial bonus if set (66774 gas)
      √ should combine individual, time and size based bonuses (43814 gas)
    promo token
      √ should get the name right
      √ should get the symbol right
      √ should get the decimals right
      √ should not be able to send ether to controller since no payable function (21046 gas)
      √ should be able to extract token from controller by owner (313863 gas)
      √ should not be able to extract token from controller by other than owner (190669 gas)
      √ should be able to set new crowdsale (28726 gas)
      √ should be able to set zero as new crowdsale (13723 gas)
      √ should not be able to set new crowdsale by other than owner (23408 gas)
      √ everyone with at least 0.1 ether should have 911 promo token
      √ sending someone 0.1 ether should have 911 promo token (24000 gas)
      √ sending someone less than 0.1 ether should have 0 promo token (21060 gas)
      √ addresses with less than 0.1 ether should have 0 promo token
      √ should be able to notify and log events (25813 gas)
      √ should be able to notify to many (29207 gas)
      √ should not be able to distribute by other than owner (23774 gas)
      √ should be fail to set promo bonus by any address than owner or PromoController (25032 gas)
      √ should be fail to set pormo bonus with 0 value (24991 gas)
      √ should fail to set promo bonus if crowdsale is 0 (109047 gas)
      √ should fail to set promo bonus if value is 0 (25477 gas)
      √ should fail to set promo bonus for unsuccessful transfer (24266 gas)
      √ should fail to set promo bonus for transferFrom with 0 value (78282 gas)
      √ should set promo bonus for transferFrom (172814 gas)
      √ should fail to set promo bonus for transferFrom which is too high (83099 gas)
      √ should set promo bonus by owner (45728 gas)
      √ should set easter egg promo bonus by owner (45718 gas)
      √ should set bonus by sending to 0x1 (120009 gas)
      √ should set bonus by sending to PromoToken (121385 gas)
      √ should set bonus by sending to Crowdsale (121680 gas)
      √ should not set bonus by sending to other address than 0x0, PromoToken or Crowdsale (95926 gas)
      √ should set bonus only once even though sent twice (165269 gas)
      √ should override smaller extra bonus (150494 gas)
      √ should not override larger extra bonus (145342 gas)
      √ should be able to kill (13585 gas)
      √ should fail to kill by other than the owner (21897 gas)
    deposit
      √ should fail for initiating with 0x0 sale address (585622 gas)
      √ should fail deposit without whitelist (2186942 gas)
      √ should fail deposit after sale end (28438 gas)
      √ should fail deposit for zero address (27926 gas)
      √ should fail deposit with zero value (29228 gas)
      √ should fail deposit below min contribution (32464 gas)
      √ should succeed with min contribution (317468 gas)
      √ should be able to deposit at min contribution (317468 gas)
      √ should set new sale address (28594 gas)
      √ should fail to set new sale address by other than owner (23276 gas)
      √ should set new whitelist address (28660 gas)
      √ should fail to set new whitelist address by other than owner (23342 gas)
      √ should be able to extract token (318433 gas)
      √ should not be able to extract token before end (195343 gas)
      √ should not be able to extract token after end if there are pending transactions (357995 gas)
      √ should not be able to extract token from controller by other than owner (190704 gas)
      √ should be able to deposit through payable fallback (163166 gas)
      √ should forward fallback deposit if whitelisted (349988 gas)
      √ should forward fallback deposit if below the limit (313705 gas)
      √ should get the same bonus for fallback deposit if forwarded later (389084 gas)
      √ should be able to deposit (165935 gas)
      √ should forward deposit if whitelisted (352757 gas)
      √ should forward deposit if below the limit (316474 gas)
      √ should forward deposit if offchain signed (333159 gas)
      √ should fail to forward if cleared (344625 gas)
      √ should fail to forward non existent transaction (27719 gas)
      √ should fail to forward transaction without signature (258015 gas)
      √ should get the same bonus for deposit if forwarded later (391853 gas)
      √ should forward many transactions (604535 gas)
      √ should not forward not whitelisted transactions when forwarding many transactions (570903 gas)
      √ should forward investor transactions if whitelisted (609178 gas)
      √ should forward investor transactions only below threshold if not whitelisted (513448 gas)
      √ should not forward investor transactions if not whitelisted (210504 gas)
      √ should forward investor transactions if offchain signed (600569 gas)
      √ should fail for non existent transaction (26537 gas)
      √ should fail for non existent transaction (27195 gas)
      √ should refund transaction after end (198174 gas)
      √ should fail to refund an already forwarded item (192472 gas)
      √ should fail to refund an already refunded item (224713 gas)
      √ should refund many transactions after end (356336 gas)
      √ should refund investor transactions after end (359312 gas)
      √ should list both cleared and non-cleared transactions (503692 gas)
      √ should list cleared transactions (503692 gas)
      √ should list non-cleared transactions (503692 gas)
      √ should list no transactions (503692 gas)
    payments to crowdsale
      √ should reject payments smaller than min contribution (53444 gas)
      √ should reject zero payments (28232 gas)
      √ should reject payments for 0x0 address (23274 gas)
      √ should fail to call depositEth if not deposit address (23474 gas)
      √ should accept payments before start (282934 gas)
      √ should accept payments after start (284798 gas)
*** BUY TOKENS: 165482 gas used.
      √ should measure buyTokens tx costs (165482 gas)
      √ should reject payments after end (49256 gas)
      √ should reject payments outside cap (257028 gas)
      √ should refund payments that exceed cap (385905 gas)
      √ should reject depositOffchain other initiated by owner (25497 gas)
      √ should reject depositOffchain with 0x0 address (24651 gas)
      √ should depositOffchain (158809 gas)
    low-level purchase
      √ should log purchase (162452 gas)
      √ should log multiple purchases (279904 gas)
    hight-level purchase
      √ should log purchase (165482 gas)
      √ should give back how much one can contribute
      √ should fail when contribution amount is queried for 0x0
      √ should give proper contributor count for zero
      √ should give proper contributor count for two (285964 gas)
      √ should list both pending and claimed contributors (285964 gas)
      √ should list pending contributors (723333 gas)
      √ should list claimed contributors (723333 gas)
      √ should list no contributors (723333 gas)
    claim token
      √ should deny claim token before finish (44354 gas)
      √ should allow claim token after finish below softCap (678108 gas)
      √ should allow claim token after finish reaching soft cap (677772 gas)
      √ should correctly distribute among multiple participants when buying on separate days (910727 gas)
      √ should send back excess tokens to controllers SALE address (465244 gas)
      √ should allow token transfer after controller unpaused (835522 gas)
    hodl
      √ controller should own hodler
      √ should not allow to add hodler stake for anyone (71214 gas)
      √ should set hodl stake based on contribution (653345 gas)
      √ should set hodl stake based on multiple contributions (718299 gas)
      √ should invalidate hodl stake after transfer (788891 gas)
      √ should not invalidate hodl stake if receiving transfer, too early claim for 3 month reward (1091152 gas)
      √ should not invalidate hodl stake if receiving transfer, distribute 3 month reward properly (1230021 gas)
      √ should not invalidate hodl stake if receiving transfer, distribute 6 month reward properly (1368354 gas)
      √ should not invalidate hodl stake if receiving transfer, distribute 9 month reward properly (1411047 gas)
      √ should not distribute hodl to two participants when called too early (970622 gas)
      √ should correctly distribute 3 month hodl reward to two participants (1195298 gas)
      √ should correctly distribute 6 month hodl reward to two participants (1409911 gas)
      √ should correctly distribute 9 month hodl reward to two participants (1457826 gas)
      √ should correctly distribute 9 month hodl reward to two participants if it has excess token (1551179 gas)


·-----------------------------------------------------------------------------------------|----------------------------------·
│                                           Gas                                           ·  Block limit: 1099511627775 gas  │
·······················································|··································|···································
│  Methods                                             ·           21 gwei/gas            ·          556.75 usd/eth          │
························|······························|··········|···········|···········|·················|·················
│  Contract             ·  Method                      ·  Min     ·  Max      ·  Avg      ·  # calls        ·  usd (avg)     │
························|······························|··········|···········|···········|·················|·················
│  EthealController     ·  burn                        ·       -  ·        -  ·        -  ·              0  ·             -  │
························|······························|··········|···········|···········|·················|·················
│  EthealController     ·  claimTokenTokens            ·       -  ·        -  ·        -  ·              0  ·             -  │
························|······························|··········|···········|···········|·················|·················
│  EthealController     ·  createGrant                 ·       -  ·        -  ·        -  ·              0  ·             -  │
························|······························|··········|···········|···········|·················|·················
│  EthealController     ·  revokeGrant                 ·       -  ·        -  ·        -  ·              0  ·             -  │
························|······························|··········|···········|···········|·················|·················
│  EthealController     ·  setCrowdsaleTransfer        ·       -  ·        -  ·        -  ·              0  ·             -  │
························|······························|··········|···········|···········|·················|·················
│  EthealController     ·  setEthealToken              ·       -  ·        -  ·        -  ·              0  ·             -  │
························|······························|··········|···········|···········|·················|·················
│  EthealController     ·  setNewController            ·       -  ·        -  ·        -  ·              0  ·             -  │
························|······························|··········|···········|···········|·················|·················
│  EthealController     ·  setNewMultisig              ·       -  ·        -  ·        -  ·              0  ·             -  │
························|······························|··········|···········|···········|·················|·················
│  EthealController     ·  transferToGrant             ·       -  ·        -  ·        -  ·              0  ·             -  │
························|······························|··········|···········|···········|·················|·················
│  EthealDeposit        ·  deposit                     ·   24466  ·   333159  ·   183483  ·             40  ·          2.15  │
························|······························|··········|···········|···········|·················|·················
│  EthealDeposit        ·  forwardInvestorTransaction  ·   44569  ·   298699  ·   162808  ·              4  ·          1.90  │
························|······························|··········|···········|···········|·················|·················
│  EthealDeposit        ·  forwardManyTransaction      ·  208648  ·   257280  ·   232964  ·              2  ·          2.72  │
························|······························|··········|···········|···········|·················|·················
│  EthealDeposit        ·  forwardTransaction          ·   27719  ·   180533  ·   101803  ·              5  ·          1.19  │
························|······························|··········|···········|···········|·················|·················
│  EthealDeposit        ·  refundInvestor              ·       -  ·        -  ·    57442  ·              1  ·          0.67  │
························|······························|··········|···········|···········|·················|·················
│  EthealDeposit        ·  refundManyTransaction       ·   27195  ·    54466  ·    40831  ·              2  ·          0.48  │
························|······························|··········|···········|···········|·················|·················
│  EthealDeposit        ·  refundTransaction           ·   26537  ·    32239  ·    28818  ·              5  ·          0.34  │
························|······························|··········|···········|···········|·················|·················
│  EthealDeposit        ·  setSale                     ·   23276  ·    28594  ·    25935  ·              2  ·          0.30  │
························|······························|··········|···········|···········|·················|·················
│  EthealDeposit        ·  setWhitelist                ·   23342  ·    28660  ·    26001  ·              2  ·          0.30  │
························|······························|··········|···········|···········|·················|·················
│  EthealNormalSale     ·  buyTokens                   ·       -  ·        -  ·        -  ·              0  ·             -  │
························|······························|··········|···········|···········|·················|·················
│  EthealNormalSale     ·  claimManyTokenFor           ·  167512  ·   276582  ·   242487  ·             15  ·          2.84  │
························|······························|··········|···········|···········|·················|·················
│  EthealNormalSale     ·  depositOffchain             ·   24651  ·   158809  ·    69652  ·              3  ·          0.81  │
························|······························|··········|···········|···········|·················|·················
│  EthealNormalSale     ·  setBonusExtra               ·   22380  ·    43814  ·    36866  ·              6  ·          0.43  │
························|······························|··········|···········|···········|·················|·················
│  EthealNormalSale     ·  setCaps                     ·   23891  ·    39297  ·    27928  ·              4  ·          0.33  │
························|······························|··········|···········|···········|·················|·················
│  EthealNormalSale     ·  setDeposit                  ·   23584  ·    28902  ·    26243  ·              2  ·          0.31  │
························|······························|··········|···········|···········|·················|·················
│  EthealNormalSale     ·  setManyBonusExtra           ·       -  ·        -  ·    66774  ·              1  ·          0.78  │
························|······························|··········|···········|···········|·················|·················
│  EthealNormalSale     ·  setPromoTokenController     ·   23072  ·    28488  ·    24889  ·              3  ·          0.29  │
························|······························|··········|···········|···········|·················|·················
│  EthealNormalSale     ·  setWhitelist                ·   23816  ·    34219  ·    28558  ·              3  ·          0.33  │
························|······························|··········|···········|···········|·················|·················
│  EthealPreSale        ·  claimRefundFor              ·       -  ·        -  ·        -  ·              0  ·             -  │
························|······························|··········|···········|···········|·················|·················
│  EthealPreSale        ·  claimRefundsFor             ·       -  ·        -  ·        -  ·              0  ·             -  │
························|······························|··········|···········|···········|·················|·················
│  EthealPreSale        ·  claimToken                  ·   22177  ·   165328  ·    85953  ·              9  ·          1.00  │
························|······························|··········|···········|···········|·················|·················
│  EthealPreSale        ·  claimTokenFor               ·       -  ·        -  ·        -  ·              0  ·             -  │
························|······························|··········|···········|···········|·················|·················
│  EthealPreSale        ·  claimTokensFor              ·       -  ·        -  ·        -  ·              0  ·             -  │
························|······························|··········|···········|···········|·················|·················
│  EthealPreSale        ·  extractVaultTokens          ·       -  ·        -  ·        -  ·              0  ·             -  │
························|······························|··········|···········|···········|·················|·················
│  EthealPreSale        ·  setCaps                     ·       -  ·        -  ·        -  ·              0  ·             -  │
························|······························|··········|···········|···········|·················|·················
│  EthealPreSale        ·  setMaxGas                   ·       -  ·        -  ·        -  ·              0  ·             -  │
························|······························|··········|···········|···········|·················|·················
│  EthealPreSale        ·  setMinContribution          ·   13695  ·    22383  ·    18039  ·              2  ·          0.21  │
························|······························|··········|···········|···········|·················|·················
│  EthealPreSale        ·  setRate                     ·   22208  ·    27343  ·    23955  ·              3  ·          0.28  │
························|······························|··········|···········|···········|·················|·················
│  EthealPreSale        ·  setTimes                    ·   22699  ·    33770  ·    25569  ·              4  ·          0.30  │
························|······························|··········|···········|···········|·················|·················
│  EthealPreSale        ·  setWhitelist                ·       -  ·        -  ·        -  ·              0  ·             -  │
························|······························|··········|···········|···········|·················|·················
│  EthealPromoToken     ·  kill                        ·   13585  ·    21897  ·    17741  ·              2  ·          0.21  │
························|······························|··········|···········|···········|·················|·················
│  EthealPromoToken     ·  massNotify                  ·   23774  ·    29207  ·    26265  ·              3  ·          0.31  │
························|······························|··········|···········|···········|·················|·················
│  EthealPromoToken     ·  setCrowdsale                ·   13723  ·    28726  ·    18661  ·              5  ·          0.22  │
························|······························|··········|···········|···········|·················|·················
│  EthealWhitelist      ·  setManyWhitelist            ·   20011  ·    70086  ·    63764  ·             15  ·          0.75  │
························|······························|··········|···········|···········|·················|·················
│  EthealWhitelist      ·  setSigner                   ·   22097  ·    28695  ·    26292  ·              5  ·          0.31  │
························|······························|··········|···········|···········|·················|·················
│  EthealWhitelist      ·  setWhitelist                ·   15321  ·    45385  ·    42497  ·             26  ·          0.50  │
························|······························|··········|···········|···········|·················|·················
│  Hodler               ·  claimHodlReward             ·       -  ·        -  ·        -  ·              0  ·             -  │
························|······························|··········|···········|···········|·················|·················
│  Hodler               ·  claimHodlRewardFor          ·       -  ·        -  ·        -  ·              0  ·             -  │
························|······························|··········|···········|···········|·················|·················
│  Hodler               ·  claimHodlRewardsFor         ·   27397  ·   292247  ·   189423  ·             14  ·          2.21  │
························|······························|··········|···········|···········|·················|·················
│  Hodler               ·  invalidate                  ·       -  ·        -  ·        -  ·              0  ·             -  │
························|······························|··········|···········|···········|·················|·················
│  Hodler               ·  updateAndGetHodlTotalValue  ·       -  ·        -  ·        -  ·              0  ·             -  │
························|······························|··········|···········|···········|·················|·················
│  iEthealSale          ·  depositEth                  ·       -  ·        -  ·    23474  ·              1  ·          0.27  │
························|······························|··········|···········|···········|·················|·················
│  iEthealSale          ·  depositOffchain             ·       -  ·        -  ·        -  ·              0  ·             -  │
························|······························|··········|···········|···········|·················|·················
│  iEthealSale          ·  setPromoBonus               ·   24991  ·    45728  ·    35367  ·              4  ·          0.41  │
························|······························|··········|···········|···········|·················|·················
│  MiniMeToken          ·  approve                     ·       -  ·        -  ·    45291  ·              3  ·          0.53  │
························|······························|··········|···········|···········|·················|·················
│  MiniMeToken          ·  approveAndCall              ·       -  ·        -  ·        -  ·              0  ·             -  │
························|······························|··········|···········|···········|·················|·················
│  MiniMeToken          ·  changeController            ·       -  ·        -  ·        -  ·              0  ·             -  │
························|······························|··········|···········|···········|·················|·················
│  MiniMeToken          ·  claimTokens                 ·       -  ·        -  ·        -  ·              0  ·             -  │
························|······························|··········|···········|···········|·················|·················
│  MiniMeToken          ·  createCloneToken            ·       -  ·        -  ·        -  ·              0  ·             -  │
························|······························|··········|···········|···········|·················|·················
│  MiniMeToken          ·  destroyTokens               ·       -  ·        -  ·        -  ·              0  ·             -  │
························|······························|··········|···········|···········|·················|·················
│  MiniMeToken          ·  enableTransfers             ·       -  ·        -  ·        -  ·              0  ·             -  │
························|······························|··········|···········|···········|·················|·················
│  MiniMeToken          ·  generateTokens              ·       -  ·        -  ·        -  ·              0  ·             -  │
························|······························|··········|···········|···········|·················|·················
│  MiniMeToken          ·  transfer                    ·   24266  ·   137344  ·   107513  ·             25  ·          1.26  │
························|······························|··········|···········|···········|·················|·················
│  MiniMeToken          ·  transferFrom                ·   24085  ·   127523  ·    61533  ·              3  ·          0.72  │
························|······························|··········|···········|···········|·················|·················
│  Pausable             ·  pause                       ·       -  ·        -  ·        -  ·              0  ·             -  │
························|······························|··········|···········|···········|·················|·················
│  Pausable             ·  unpause                     ·       -  ·        -  ·    28331  ·             17  ·          0.33  │
························|······························|··········|···········|···········|·················|·················
│  RefundableCrowdsale  ·  buyTokens                   ·   23274  ·   165482  ·   117143  ·             18  ·          1.37  │
························|······························|··········|···········|···········|·················|·················
│  RefundableCrowdsale  ·  claimRefund                 ·       -  ·        -  ·        -  ·              0  ·             -  │
························|······························|··········|···········|···········|·················|·················
│  RefundableCrowdsale  ·  finalize                    ·       -  ·        -  ·   254857  ·             20  ·          2.98  │
························|······························|··········|···········|···········|·················|·················
│  RefundVault          ·  close                       ·       -  ·        -  ·        -  ·              0  ·             -  │
························|······························|··········|···········|···········|·················|·················
│  RefundVault          ·  deposit                     ·       -  ·        -  ·        -  ·              0  ·             -  │
························|······························|··········|···········|···········|·················|·················
│  RefundVault          ·  enableRefunds               ·       -  ·        -  ·        -  ·              0  ·             -  │
························|······························|··········|···········|···········|·················|·················
│  RefundVault          ·  extractTokens               ·   24994  ·   152758  ·    68309  ·              6  ·          0.80  │
························|······························|··········|···········|···········|·················|·················
│  RefundVault          ·  refund                      ·       -  ·        -  ·        -  ·              0  ·             -  │
························|······························|··········|···········|···········|·················|·················
│  TokenController      ·  addHodlerStake              ·       -  ·        -  ·    23738  ·              3  ·          0.28  │
························|······························|··········|···········|···········|·················|·················
│  TokenController      ·  onApprove                   ·       -  ·        -  ·        -  ·              0  ·             -  │
························|······························|··········|···········|···········|·················|·················
│  TokenController      ·  onTransfer                  ·       -  ·        -  ·        -  ·              0  ·             -  │
························|······························|··········|···········|···········|·················|·················
│  TokenController      ·  proxyPayment                ·       -  ·        -  ·        -  ·              0  ·             -  │
························|······························|··········|···········|···········|·················|·················
│  TokenController      ·  setHodlerStake              ·       -  ·        -  ·        -  ·              0  ·             -  │
························|······························|··········|···········|···········|·················|·················
│  TokenController      ·  setHodlerTime               ·       -  ·        -  ·        -  ·              0  ·             -  │
························|······························|··········|···········|···········|·················|·················
│  TokenVesting         ·  release                     ·       -  ·        -  ·        -  ·              0  ·             -  │
························|······························|··········|···········|···········|·················|·················
│  TokenVesting         ·  revoke                      ·       -  ·        -  ·        -  ·              0  ·             -  │
························|······························|··········|···········|···········|·················|·················
│  TokenVesting         ·  transferOwnership           ·       -  ·        -  ·        -  ·              0  ·             -  │
························|······························|··········|···········|···········|·················|·················
│  Deployments                                         ·                                  ·  % of limit     ·                │
·······················································|··········|···········|···········|·················|·················
│  AbstractVirtualToken                                ·  173124  ·  4187725  ·  1830872  ·            0 %  ·         21.41  │
·------------------------------------------------------|----------|-----------|-----------|-----------------|----------------·

  236 passing

```

<br>

## Summary  
Upon finalization of the contracts to be used by Etheal, the contracts were assessed on the gas usage of each function to ensure there aren't any unforeseen issues with exceeding the block size GasLimit.

<br>
