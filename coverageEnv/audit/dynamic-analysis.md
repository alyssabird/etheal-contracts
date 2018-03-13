# Dynamic Analysis

```

  Contract: NormalSale
    creating a valid crowdsale
      ✓ should fail with zero rate
      ✓ should fail with zero cap (39ms)
      ✓ should fail with greater softCap than cap (41ms)
      ✓ should fail with zero controller (39ms)
      ✓ should fail with zero wallet
    modify parameters
      ✓ should set valid mincontribution
      ✓ should fail to set mincintribution from other address than deployer
      ✓ should set valid caps
      ✓ should fail setting zero cap
      ✓ should fail setting greater softCap than cap
      ✓ should fail setting cap by other than deployer
      ✓ should set valid times
      ✓ should fail to set invalid times
      ✓ should fail to set times by other than deployer
      ✓ should set valid rate
      ✓ should fail to set invalid rate
      ✓ should fail to set rate by other than deployer
      ✓ should set valid promo token controller
      ✓ should fail to set invalid promo token controller
      ✓ should fail to set promo token controller by other than deployer
      ✓ should set valid whitelist (78ms)
      ✓ should set threshold only for invalid whitelist address (69ms)
      ✓ should fail to set whitelist by other than deployer
      ✓ should set valid deposit
      ✓ should fail to set deposit by other than deployer
    ending
      ✓ should be ended after end time (143ms)
      ✓ should be ended after soft cap reached (1003ms)
      ✓ should not end sooner if softCap is not reached (546ms)
      ✓ should be ended after cap reached (229ms)
    whitelist
      ✓ should fail for 0 initial signer
      ✓ should be able to set new signer
      ✓ should fail to set zero address signer
      ✓ should fail to set new signer by other than deployer
      ✓ should be able to set new whitelist (46ms)
      ✓ should be able to remove whitelist (72ms)
      ✓ should fail to set whitelist to address 0x0
      ✓ should fail to set new whitelist by other than deployer
      ✓ should be able to set many new whitelist (72ms)
      ✓ should be able to set many new whitelist to false (104ms)
      ✓ should fail to set many new whitelist by other than deployer
      ✓ should return false for checking offline signature for empty string
      ✓ should return false for checking offline signature for invalid signature
      ✓ should return true for checking valid offline signature (168ms)
      ✓ should return true for checking valid offline signature by any account (146ms)
      ✓ should return false for checking old offline signature after changing signer (166ms)
      ✓ should return true for checking new offline signature after changing signer (167ms)
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
      ✓ should fail setting extra bonus for address 0x0
      ✓ should give individial bonus if set (58ms)
      ✓ should fail for setting individual bonus other than the deployer
      ✓ should give multiple individial bonus if set (90ms)
      ✓ should combine individual, time and size based bonuses (49ms)
    promo token
      ✓ should not be able to send ether to controller since no payable function
      ✓ should be able to extract token from controller by owner (340ms)
      ✓ should not be able to extract token from controller by other than owner (177ms)
      ✓ should not be able to send ether to promo token contract
      ✓ should be able to extract token from promo token by owner (389ms)
      ✓ should not be able to extract promo token from promo token
      ✓ should not be able to extract token from promo token by other than owner (507ms)
      ✓ should be able to set new controller (205ms)
      ✓ should not be able to set new controller by other than owner (112ms)
      ✓ should not be able to set zero new controller
      ✓ should not be able to set new controller when it is already done (162ms)
      ✓ should be able to set new crowdsale (43ms)
      ✓ should not be able to set zero as new crowdsale
      ✓ should not be able to set new crowdsale by other than owner
      ✓ should be able to set new PromoToken
      ✓ shoul failt to set 0 as new PromoToken (56ms)
      ✓ should not be able to set new PromoToken by other than owner
      ✓ should be able to distribute (71ms)
      ✓ should be able to distribute to many (109ms)
      ✓ should not be able to distribute by other than owner
      ✓ should be set bonus by owner (44ms)
      ✓ should be fail to set by any address than owner or PromoController
      ✓ should fail to transfer when it is paused (116ms)
      ✓ should be set bonus by sending to 0x1 (138ms)
      ✓ should be set bonus by sending to PromoController (140ms)
      ✓ should be set bonus by sending to Crowdsale (137ms)
      ✓ should be set bonus only once even though sent twice (215ms)
      ✓ should override smaller extra bonus (224ms)
      ✓ should not override larger extra bonus (211ms)
      ✓ should not be able to burn what is not there
      ✓ should be able to burn (173ms)
      ✓ should be able to burn at many addresses (245ms)
      ✓ should not be able to burn by other than owner (114ms)
      ✓ should approve if not paused (68ms)
      ✓ should disapprove if paused (60ms)
      ✓ should not be paused by other than owner
    deposit
      ✓ should fail for initiating with 0x0 sale address
      ✓ should fail deposit without whitelist (79ms)
      ✓ should fail deposit after sale end (184ms)
      ✓ should fail deposit for zero address
      ✓ should fail deposit with zero value
      ✓ should set new sale address
      ✓ should fail to set new sale address by other than owner
      ✓ should set new whitelist address
      ✓ should fail to set new whitelist address by other than owner
      ✓ should be able to extract token (512ms)
      ✓ should not be able to extract token before end (208ms)
      ✓ should not be able to extract token after end if there are pending transactions (483ms)
      ✓ should not be able to extract token from controller by other than owner (339ms)
      ✓ should be able to deposit through payable fallback (130ms)
      ✓ should forward fallback deposit if whitelisted (224ms)
      ✓ should forward fallback deposit if below the limit (209ms)
      ✓ should get the same bonus for fallback deposit if forwarded later (390ms)
      ✓ should be able to deposit (112ms)
      ✓ should forward deposit if whitelisted (191ms)
      ✓ should forward deposit if below the limit (180ms)
      ✓ should forward deposit if offchain signed (358ms)
      ✓ should fail to forward if cleared (225ms)
      ✓ should fail to forward non existent transaction
      ✓ should fail to forward transaction without signature (209ms)
      ✓ should get the same bonus for deposit if forwarded later (635ms)
      ✓ should forward many transactions (494ms)
      ✓ should forward investor transactions if whitelisted (490ms)
      ✓ should forward investor transactions if offchain signed (792ms)
      ✓ should fail for non existent transaction (40ms)
      ✓ should refund transaction after end (889ms)
      ✓ should fail to refund an already forwarded item (477ms)
      ✓ should fail to refund an already refunded item (714ms)
      ✓ should refund many transactions after end (1351ms)
      ✓ should refund investor transactions after end (1367ms)
      ✓ should list both cleared and non-cleared transactions (489ms)
      ✓ should list cleared transactions (453ms)
      ✓ should list non-cleared transactions (421ms)
      ✓ should list no transactions (391ms)
    payments to crowdsale
      ✓ should reject payments smaller than min contribution (74ms)
      ✓ should reject zero payments (38ms)
      ✓ should reject payments for 0x0 address
      ✓ should fail to call depositEth if not deposit address
      ✓ should accept payments before start (146ms)
      ✓ should accept payments after start (307ms)
*** BUY TOKENS: 165310 gas used.
      ✓ should measure buyTokens tx costs (79ms)
      ✓ should reject payments after end (219ms)
      ✓ should reject payments outside cap (151ms)
      ✓ should refund payments that exceed cap (493ms)
      ✓ should reject depositOffchain other initiated by owner
      ✓ should reject depositOffchain with 0x0 address
      ✓ should depositOffchain (82ms)
    low-level purchase
      ✓ should log purchase (71ms)
    hight-level purchase
      ✓ should log purchase (67ms)
      ✓ should give back how much one can contribute
      ✓ should fail when contribution amount is queried for 0x0
      ✓ should give proper contributor count for zero
      ✓ should give proper contributor count for two (168ms)
      ✓ should list both pending and claimed contributors (182ms)
      ✓ should list pending contributors (657ms)
      ✓ should list claimed contributors (682ms)
      ✓ should list no contributors (647ms)
    claim token
      ✓ should deny claim token before finish (218ms)
      ✓ should allow claim token after finish below softCap (727ms)
      ✓ should allow claim token after finish reaching soft cap (720ms)
      ✓ should correctly distribute among multiple participants when buying on separate days (1252ms)
      ✓ should send back excess tokens to controllers SALE address (581ms)
      ✓ should allow token transfer after controller unpaused (903ms)
    hodl
      ✓ controller should own hodler
      ✓ should not allow to add hodler stake for anyone (97ms)
      ✓ should set hodl stake based on contribution (939ms)
      ✓ should set hodl stake based on multiple contributions (1081ms)
      ✓ should invalidate hodl stake after transfer (1109ms)
      ✓ should not invalidate hodl stake if receiving transfer, too early claim for 3 month reward (1636ms)
      ✓ should not invalidate hodl stake if receiving transfer, distribute 3 month reward properly (1655ms)
      ✓ should not invalidate hodl stake if receiving transfer, distribute 6 month reward properly (1896ms)
      ✓ should not invalidate hodl stake if receiving transfer, distribute 9 month reward properly (1823ms)
      ✓ should not distribute hodl to two participants when called too early (1287ms)
      ✓ should correctly distribute 3 month hodl reward to two participants (1538ms)
      ✓ should correctly distribute 6 month hodl reward to two participants (1920ms)
      ✓ should correctly distribute 9 month hodl reward to two participants (1948ms)
      ✓ should correctly distribute 9 month hodl reward to two participants if it has excess token (2038ms)


  228 passing (6m)

```
