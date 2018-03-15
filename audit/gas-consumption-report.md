# Gas consumption report
performed by Blockchain Labs, March 15, 2018


```
  Contract: NormalSale
    creating a valid crowdsale
      ✓ should fail with zero rate (771802 gas)
      ✓ should fail with zero cap (872315 gas)
      ✓ should fail with greater softCap than cap (913194 gas)
      ✓ should fail with zero controller (891520 gas)
      ✓ should fail with zero wallet (770748 gas)
    modify parameters
      ✓ should set valid mincontribution (13695 gas)
      ✓ should fail to set mincintribution from other address than deployer (22383 gas)
      ✓ should set valid caps (39297 gas)
      ✓ should fail setting zero cap (23891 gas)
      ✓ should fail setting greater softCap than cap (24275 gas)
      ✓ should fail setting cap by other than deployer (24249 gas)
      ✓ should set valid times (32744 gas)
      ✓ should fail to set invalid times (22725 gas)
      ✓ should fail to set times by other than deployer (22699 gas)
      ✓ should set valid rate (27343 gas)
      ✓ should fail to set invalid rate (22208 gas)
      ✓ should fail to set rate by other than deployer (22313 gas)
      ✓ should set valid promo token controller (28488 gas)
      ✓ should fail to set invalid promo token controller (23106 gas)
      ✓ should fail to set promo token controller by other than deployer (23072 gas)
      ✓ should set valid whitelist (34219 gas)
      ✓ should set threshold only for invalid whitelist address (27640 gas)
      ✓ should fail to set whitelist by other than deployer (23816 gas)
      ✓ should set valid deposit (28902 gas)
      ✓ should fail to set deposit by other than deployer (23584 gas)
    ending
      ✓ should be ended after end time
      ✓ should be ended after soft cap reached (232034 gas)
      ✓ should not end sooner if softCap is not reached (162258 gas)
      ✓ should be ended after cap reached (233773 gas)
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
      ✓ should get the name right
      ✓ should get the symbol right
      ✓ should get the decimals right
      ✓ should not be able to send ether to controller since no payable function (21046 gas)
      ✓ should be able to extract token from controller by owner (313863 gas)
      ✓ should not be able to extract token from controller by other than owner (190669 gas)
      ✓ should be able to set new crowdsale (28726 gas)
      ✓ should be able to set zero as new crowdsale (13723 gas)
      ✓ should not be able to set new crowdsale by other than owner (23408 gas)
      ✓ everyone with at least 0.1 ether should have 911 promo token
      ✓ sending someone 0.1 ether should have 911 promo token (24000 gas)
      ✓ sending someone less than 0.1 ether should have 0 promo token (21060 gas)
      ✓ addresses with less than 0.1 ether should have 0 promo token
      ✓ should be able to notify and log events (25813 gas)
      ✓ should be able to notify to many (29207 gas)
      ✓ should not be able to distribute by other than owner (23774 gas)
      ✓ should be fail to set promo bonus by any address than owner or PromoController (25032 gas)
      ✓ should be fail to set pormo bonus with 0 value (24991 gas)
      ✓ should fail to set promo bonus if crowdsale is 0 (109047 gas)
      ✓ should fail to set promo bonus if value is 0 (25477 gas)
      ✓ should fail to set promo bonus for unsuccessful transfer (24266 gas)
      ✓ should fail to set promo bonus for transferFrom with 0 value (78282 gas)
      ✓ should set promo bonus for transferFrom (172814 gas)
      ✓ should fail to set promo bonus for transferFrom which is too high (83099 gas)
      ✓ should set promo bonus by owner (45728 gas)
      ✓ should set easter egg promo bonus by owner (45718 gas)
      ✓ should set bonus by sending to 0x1 (120009 gas)
      ✓ should set bonus by sending to PromoToken (121321 gas)
      ✓ should set bonus by sending to Crowdsale (121680 gas)
      ✓ should not set bonus by sending to other address than 0x0, PromoToken or Crowdsale (95926 gas)
      ✓ should set bonus only once even though sent twice (165269 gas)
      ✓ should override smaller extra bonus (150494 gas)
      ✓ should not override larger extra bonus (145342 gas)
      ✓ should be able to kill (13585 gas)
      ✓ should fail to kill by other than the owner (21897 gas)
    deposit
      ✓ should fail for initiating with 0x0 sale address (578330 gas)
      ✓ should fail deposit without whitelist (2157429 gas)
      ✓ should fail deposit after sale end (28438 gas)
      ✓ should fail deposit for zero address (27926 gas)
      ✓ should fail deposit with zero value (29228 gas)
      ✓ should set new sale address (28594 gas)
      ✓ should fail to set new sale address by other than owner (23276 gas)
      ✓ should set new whitelist address (28660 gas)
      ✓ should fail to set new whitelist address by other than owner (23342 gas)
      ✓ should be able to extract token (318369 gas)
      ✓ should not be able to extract token before end (195343 gas)
      ✓ should not be able to extract token after end if there are pending transactions (354823 gas)
      ✓ should not be able to extract token from controller by other than owner (190704 gas)
      ✓ should be able to deposit through payable fallback (159930 gas)
      ✓ should forward fallback deposit if whitelisted (346558 gas)
      ✓ should forward fallback deposit if below the limit (310275 gas)
      ✓ should get the same bonus for fallback deposit if forwarded later (385654 gas)
      ✓ should be able to deposit (162699 gas)
      ✓ should forward deposit if whitelisted (349327 gas)
      ✓ should forward deposit if below the limit (313044 gas)
      ✓ should forward deposit if offchain signed (329729 gas)
      ✓ should fail to forward if cleared (341195 gas)
      ✓ should fail to forward non existent transaction (27719 gas)
      ✓ should fail to forward transaction without signature (234487 gas)
      ✓ should get the same bonus for deposit if forwarded later (388423 gas)
      ✓ should forward many transactions (597675 gas)
      ✓ should forward investor transactions if whitelisted (602318 gas)
      ✓ should forward investor transactions if offchain signed (593709 gas)
      ✓ should fail for non existent transaction (26537 gas)
      ✓ should fail for non existent transaction (27195 gas)
      ✓ should refund transaction after end (194938 gas)
      ✓ should fail to refund an already forwarded item (189236 gas)
      ✓ should fail to refund an already refunded item (221477 gas)
      ✓ should refund many transactions after end (349864 gas)
      ✓ should refund investor transactions after end (352840 gas)
      ✓ should list both cleared and non-cleared transactions (497026 gas)
      ✓ should list cleared transactions (497026 gas)
      ✓ should list non-cleared transactions (497026 gas)
      ✓ should list no transactions (497026 gas)
    payments to crowdsale
      ✓ should reject payments smaller than min contribution (53444 gas)
      ✓ should reject zero payments (28232 gas)
      ✓ should reject payments for 0x0 address (23274 gas)
      ✓ should fail to call depositEth if not deposit address (23474 gas)
      ✓ should accept payments before start (282546 gas)
      ✓ should accept payments after start (284410 gas)
*** BUY TOKENS: 165288 gas used.
      ✓ should measure buyTokens tx costs (165288 gas)
      ✓ should reject payments after end (49256 gas)
      ✓ should reject payments outside cap (256834 gas)
      ✓ should refund payments that exceed cap (385517 gas)
      ✓ should reject depositOffchain other initiated by owner (25497 gas)
      ✓ should reject depositOffchain with 0x0 address (24651 gas)
      ✓ should depositOffchain (158615 gas)
    low-level purchase
      ✓ should log purchase (162258 gas)
    hight-level purchase
      ✓ should log purchase (165288 gas)
      ✓ should give back how much one can contribute
      ✓ should fail when contribution amount is queried for 0x0
      ✓ should give proper contributor count for zero
      ✓ should give proper contributor count for two (285576 gas)
      ✓ should list both pending and claimed contributors (285576 gas)
      ✓ should list pending contributors (722945 gas)
      ✓ should list claimed contributors (722945 gas)
      ✓ should list no contributors (722945 gas)
    claim token
      ✓ should deny claim token before finish (44354 gas)
      ✓ should allow claim token after finish below softCap (677914 gas)
      ✓ should allow claim token after finish reaching soft cap (677578 gas)
      ✓ should correctly distribute among multiple participants when buying on separate days (911271 gas)
      ✓ should send back excess tokens to controllers SALE address (465050 gas)
      ✓ should allow token transfer after controller unpaused (835328 gas)
    hodl
      ✓ controller should own hodler
      ✓ should not allow to add hodler stake for anyone (71214 gas)
      ✓ should set hodl stake based on contribution (652219 gas)
      ✓ should set hodl stake based on multiple contributions (716979 gas)
      ✓ should invalidate hodl stake after transfer (788697 gas)
      ✓ should not invalidate hodl stake if receiving transfer, too early claim for 3 month reward (1088900 gas)
      ✓ should not invalidate hodl stake if receiving transfer, distribute 3 month reward properly (1229633 gas)
      ✓ should not invalidate hodl stake if receiving transfer, distribute 6 month reward properly (1367966 gas)
      ✓ should not invalidate hodl stake if receiving transfer, distribute 9 month reward properly (1408795 gas)
      ✓ should not distribute hodl to two participants when called too early (970234 gas)
      ✓ should correctly distribute 3 month hodl reward to two participants (1193978 gas)
      ✓ should correctly distribute 6 month hodl reward to two participants (1408591 gas)
      ✓ should correctly distribute 9 month hodl reward to two participants (1455574 gas)
      ✓ should correctly distribute 9 month hodl reward to two participants if it has excess token (1550791 gas)

·-----------------------------------------------------------------------------------------|-----------------------------------·
│                                           Gas                                           ·  Block limit: 17592186044415 gas  │
·······················································|··································|····································
│  Methods                                             ·           21 gwei/gas            ·          604.14 usd/eth           │
························|······························|··········|···········|···········|··················|·················
│  Contract             ·  Method                      ·  Min     ·  Max      ·  Avg      ·  # calls         ·  usd (avg)     │
························|······························|··········|···········|···········|··················|·················
│  EthealController     ·  burn                        ·       -  ·        -  ·        -  ·               0  ·             -  │
························|······························|··········|···········|···········|··················|·················
│  EthealController     ·  claimTokenTokens            ·       -  ·        -  ·        -  ·               0  ·             -  │
························|······························|··········|···········|···········|··················|·················
│  EthealController     ·  createGrant                 ·       -  ·        -  ·        -  ·               0  ·             -  │
························|······························|··········|···········|···········|··················|·················
│  EthealController     ·  revokeGrant                 ·       -  ·        -  ·        -  ·               0  ·             -  │
························|······························|··········|···········|···········|··················|·················
│  EthealController     ·  setCrowdsaleTransfer        ·       -  ·        -  ·        -  ·               0  ·             -  │
························|······························|··········|···········|···········|··················|·················
│  EthealController     ·  setEthealToken              ·       -  ·        -  ·        -  ·               0  ·             -  │
························|······························|··········|···········|···········|··················|·················
│  EthealController     ·  setNewController            ·       -  ·        -  ·        -  ·               0  ·             -  │
························|······························|··········|···········|···········|··················|·················
│  EthealController     ·  setNewMultisig              ·       -  ·        -  ·        -  ·               0  ·             -  │
························|······························|··········|···········|···········|··················|·················
│  EthealController     ·  transferToGrant             ·       -  ·        -  ·        -  ·               0  ·             -  │
························|······························|··········|···········|···········|··················|·················
│  EthealDeposit        ·  deposit                     ·   24466  ·   329729  ·   175924  ·              32  ·          2.23  │
························|······························|··········|···········|···········|··················|·················
│  EthealDeposit        ·  forwardInvestorTransaction  ·  261535  ·   298311  ·   279923  ·               2  ·          3.55  │
························|······························|··········|···········|···········|··················|·················
│  EthealDeposit        ·  forwardManyTransaction      ·       -  ·        -  ·   256892  ·               1  ·          3.26  │
························|······························|··········|···········|···········|··················|·················
│  EthealDeposit        ·  forwardTransaction          ·   27719  ·   180339  ·    97667  ·               5  ·          1.24  │
························|······························|··········|···········|···········|··················|·················
│  EthealDeposit        ·  refundInvestor              ·       -  ·        -  ·    57442  ·               1  ·          0.73  │
························|······························|··········|···········|···········|··················|·················
│  EthealDeposit        ·  refundManyTransaction       ·   27195  ·    54466  ·    40831  ·               2  ·          0.52  │
························|······························|··········|···········|···········|··················|·················
│  EthealDeposit        ·  refundTransaction           ·   26537  ·    32239  ·    28818  ·               5  ·          0.37  │
························|······························|··········|···········|···········|··················|·················
│  EthealDeposit        ·  setSale                     ·   23276  ·    28594  ·    25935  ·               2  ·          0.33  │
························|······························|··········|···········|···········|··················|·················
│  EthealDeposit        ·  setWhitelist                ·   23342  ·    28660  ·    26001  ·               2  ·          0.33  │
························|······························|··········|···········|···········|··················|·················
│  EthealNormalSale     ·  buyTokens                   ·       -  ·        -  ·        -  ·               0  ·             -  │
························|······························|··········|···········|···········|··················|·················
│  EthealNormalSale     ·  claimManyTokenFor           ·  167512  ·   276582  ·   242487  ·              15  ·          3.08  │
························|······························|··········|···········|···········|··················|·················
│  EthealNormalSale     ·  depositOffchain             ·   24651  ·   158615  ·    69588  ·               3  ·          0.88  │
························|······························|··········|···········|···········|··················|·················
│  EthealNormalSale     ·  setBonusExtra               ·   22380  ·    43814  ·    36866  ·               6  ·          0.47  │
························|······························|··········|···········|···········|··················|·················
│  EthealNormalSale     ·  setCaps                     ·   23891  ·    39297  ·    27928  ·               4  ·          0.35  │
························|······························|··········|···········|···········|··················|·················
│  EthealNormalSale     ·  setDeposit                  ·   23584  ·    28902  ·    26243  ·               2  ·          0.33  │
························|······························|··········|···········|···········|··················|·················
│  EthealNormalSale     ·  setManyBonusExtra           ·       -  ·        -  ·    66774  ·               1  ·          0.85  │
························|······························|··········|···········|···········|··················|·················
│  EthealNormalSale     ·  setPromoTokenController     ·   23072  ·    28488  ·    24889  ·               3  ·          0.32  │
························|······························|··········|···········|···········|··················|·················
│  EthealNormalSale     ·  setWhitelist                ·   23816  ·    34219  ·    28558  ·               3  ·          0.36  │
························|······························|··········|···········|···········|··················|·················
│  EthealPreSale        ·  claimRefundFor              ·       -  ·        -  ·        -  ·               0  ·             -  │
························|······························|··········|···········|···········|··················|·················
│  EthealPreSale        ·  claimRefundsFor             ·       -  ·        -  ·        -  ·               0  ·             -  │
························|······························|··········|···········|···········|··················|·················
│  EthealPreSale        ·  claimToken                  ·   22177  ·   165328  ·    85953  ·               9  ·          1.09  │
························|······························|··········|···········|···········|··················|·················
│  EthealPreSale        ·  claimTokenFor               ·       -  ·        -  ·        -  ·               0  ·             -  │
························|······························|··········|···········|···········|··················|·················
│  EthealPreSale        ·  claimTokensFor              ·       -  ·        -  ·        -  ·               0  ·             -  │
························|······························|··········|···········|···········|··················|·················
│  EthealPreSale        ·  extractVaultTokens          ·       -  ·        -  ·        -  ·               0  ·             -  │
························|······························|··········|···········|···········|··················|·················
│  EthealPreSale        ·  setCaps                     ·       -  ·        -  ·        -  ·               0  ·             -  │
························|······························|··········|···········|···········|··················|·················
│  EthealPreSale        ·  setMaxGas                   ·       -  ·        -  ·        -  ·               0  ·             -  │
························|······························|··········|···········|···········|··················|·················
│  EthealPreSale        ·  setMinContribution          ·   13695  ·    22383  ·    18039  ·               2  ·          0.23  │
························|······························|··········|···········|···········|··················|·················
│  EthealPreSale        ·  setRate                     ·   22208  ·    27343  ·    23955  ·               3  ·          0.30  │
························|······························|··········|···········|···········|··················|·················
│  EthealPreSale        ·  setTimes                    ·   22699  ·    32744  ·    26056  ·               3  ·          0.33  │
························|······························|··········|···········|···········|··················|·················
│  EthealPreSale        ·  setWhitelist                ·       -  ·        -  ·        -  ·               0  ·             -  │
························|······························|··········|···········|···········|··················|·················
│  EthealPromoToken     ·  kill                        ·   13585  ·    21897  ·    17741  ·               2  ·          0.23  │
························|······························|··········|···········|···········|··················|·················
│  EthealPromoToken     ·  massNotify                  ·   23774  ·    29207  ·    26265  ·               3  ·          0.33  │
························|······························|··········|···········|···········|··················|·················
│  EthealPromoToken     ·  setCrowdsale                ·   13723  ·    28726  ·    18661  ·               5  ·          0.24  │
························|······························|··········|···········|···········|··················|·················
│  EthealWhitelist      ·  setManyWhitelist            ·   20011  ·    70086  ·    63764  ·              15  ·          0.81  │
························|······························|··········|···········|···········|··················|·················
│  EthealWhitelist      ·  setSigner                   ·   22097  ·    28695  ·    26292  ·               5  ·          0.33  │
························|······························|··········|···········|···········|··················|·················
│  EthealWhitelist      ·  setWhitelist                ·   15321  ·    45385  ·    42381  ·              25  ·          0.54  │
························|······························|··········|···········|···········|··················|·················
│  Hodler               ·  claimHodlReward             ·       -  ·        -  ·        -  ·               0  ·             -  │
························|······························|··········|···········|···········|··················|·················
│  Hodler               ·  claimHodlRewardFor          ·       -  ·        -  ·        -  ·               0  ·             -  │
························|······························|··········|···········|···········|··················|·················
│  Hodler               ·  claimHodlRewardsFor         ·   27397  ·   292247  ·   189423  ·              14  ·          2.40  │
························|······························|··········|···········|···········|··················|·················
│  Hodler               ·  invalidate                  ·       -  ·        -  ·        -  ·               0  ·             -  │
························|······························|··········|···········|···········|··················|·················
│  Hodler               ·  updateAndGetHodlTotalValue  ·       -  ·        -  ·        -  ·               0  ·             -  │
························|······························|··········|···········|···········|··················|·················
│  iEthealSale          ·  depositEth                  ·       -  ·        -  ·    23474  ·               1  ·          0.30  │
························|······························|··········|···········|···········|··················|·················
│  iEthealSale          ·  depositOffchain             ·       -  ·        -  ·        -  ·               0  ·             -  │
························|······························|··········|···········|···········|··················|·················
│  iEthealSale          ·  setPromoBonus               ·   24991  ·    45728  ·    35367  ·               4  ·          0.45  │
························|······························|··········|···········|···········|··················|·················
│  MiniMeToken          ·  approve                     ·       -  ·        -  ·    45291  ·               3  ·          0.57  │
························|······························|··········|···········|···········|··················|·················
│  MiniMeToken          ·  approveAndCall              ·       -  ·        -  ·        -  ·               0  ·             -  │
························|······························|··········|···········|···········|··················|·················
│  MiniMeToken          ·  changeController            ·       -  ·        -  ·        -  ·               0  ·             -  │
························|······························|··········|···········|···········|··················|·················
│  MiniMeToken          ·  claimTokens                 ·       -  ·        -  ·        -  ·               0  ·             -  │
························|······························|··········|···········|···········|··················|·················
│  MiniMeToken          ·  createCloneToken            ·       -  ·        -  ·        -  ·               0  ·             -  │
························|······························|··········|···········|···········|··················|·················
│  MiniMeToken          ·  destroyTokens               ·       -  ·        -  ·        -  ·               0  ·             -  │
························|······························|··········|···········|···········|··················|·················
│  MiniMeToken          ·  enableTransfers             ·       -  ·        -  ·        -  ·               0  ·             -  │
························|······························|··········|···········|···········|··················|·················
│  MiniMeToken          ·  generateTokens              ·       -  ·        -  ·        -  ·               0  ·             -  │
························|······························|··········|···········|···········|··················|·················
│  MiniMeToken          ·  transfer                    ·   24266  ·   137344  ·   107510  ·              25  ·          1.36  │
························|······························|··········|···········|···········|··················|·················
│  MiniMeToken          ·  transferFrom                ·   24085  ·   127523  ·    61533  ·               3  ·          0.78  │
························|······························|··········|···········|···········|··················|·················
│  Pausable             ·  pause                       ·       -  ·        -  ·        -  ·               0  ·             -  │
························|······························|··········|···········|···········|··················|·················
│  Pausable             ·  unpause                     ·       -  ·        -  ·    28331  ·              17  ·          0.36  │
························|······························|··········|···········|···········|··················|·················
│  RefundableCrowdsale  ·  buyTokens                   ·   23274  ·   165288  ·   116992  ·              18  ·          1.48  │
························|······························|··········|···········|···········|··················|·················
│  RefundableCrowdsale  ·  claimRefund                 ·       -  ·        -  ·        -  ·               0  ·             -  │
························|······························|··········|···········|···········|··················|·················
│  RefundableCrowdsale  ·  finalize                    ·       -  ·        -  ·   254857  ·              20  ·          3.23  │
························|······························|··········|···········|···········|··················|·················
│  RefundVault          ·  close                       ·       -  ·        -  ·        -  ·               0  ·             -  │
························|······························|··········|···········|···········|··················|·················
│  RefundVault          ·  deposit                     ·       -  ·        -  ·        -  ·               0  ·             -  │
························|······························|··········|···········|···········|··················|·················
│  RefundVault          ·  enableRefunds               ·       -  ·        -  ·        -  ·               0  ·             -  │
························|······························|··········|···········|···········|··················|·················
│  RefundVault          ·  extractTokens               ·   24994  ·   152758  ·    68309  ·               6  ·          0.87  │
························|······························|··········|···········|···········|··················|·················
│  RefundVault          ·  refund                      ·       -  ·        -  ·        -  ·               0  ·             -  │
························|······························|··········|···········|···········|··················|·················
│  TokenController      ·  addHodlerStake              ·       -  ·        -  ·    23738  ·               3  ·          0.30  │
························|······························|··········|···········|···········|··················|·················
│  TokenController      ·  onApprove                   ·       -  ·        -  ·        -  ·               0  ·             -  │
························|······························|··········|···········|···········|··················|·················
│  TokenController      ·  onTransfer                  ·       -  ·        -  ·        -  ·               0  ·             -  │
························|······························|··········|···········|···········|··················|·················
│  TokenController      ·  proxyPayment                ·       -  ·        -  ·        -  ·               0  ·             -  │
························|······························|··········|···········|···········|··················|·················
│  TokenController      ·  setHodlerStake              ·       -  ·        -  ·        -  ·               0  ·             -  │
························|······························|··········|···········|···········|··················|·················
│  TokenController      ·  setHodlerTime               ·       -  ·        -  ·        -  ·               0  ·             -  │
························|······························|··········|···········|···········|··················|·················
│  TokenVesting         ·  release                     ·       -  ·        -  ·        -  ·               0  ·             -  │
························|······························|··········|···········|···········|··················|·················
│  TokenVesting         ·  revoke                      ·       -  ·        -  ·        -  ·               0  ·             -  │
························|······························|··········|···········|···········|··················|·················
│  TokenVesting         ·  transferOwnership           ·       -  ·        -  ·        -  ·               0  ·             -  │
························|······························|··········|···········|···········|··················|·················
│  Deployments                                         ·                                  ·  % of limit      ·                │
·······················································|··········|···········|···········|··················|·················
│  AbstractVirtualToken                                ·  173188  ·  4187789  ·  1826318  ·             0 %  ·         23.17  │
·------------------------------------------------------|----------|-----------|-----------|------------------|----------------·

  228 passing (32m)
```

<br>

## Summary  
Upon finalization of the contracts to be used by Etheal, the contracts were assessed on the gas usage of each function to ensure there aren't any unforeseen issues with exceeding the block size GasLimit.

<br>
