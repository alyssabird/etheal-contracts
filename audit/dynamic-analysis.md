# Dynamic Analysis
performed by Blockchain Labs, March 20, 2018

```
    Contract: NormalSale
    creating a valid crowdsale
      √ should fail with zero rate (52ms)
      √ should fail with zero cap (187ms)
      √ should fail with greater softCap than cap (132ms)
      √ should fail with zero controller (109ms)
      √ should fail with zero wallet (63ms)
    modify parameters
      √ should set valid mincontribution (125ms)
      √ should fail to set mincintribution from other address than deployer (85ms)
      √ should set valid caps (43ms)
      √ should fail setting zero cap (47ms)
      √ should fail setting greater softCap than cap (63ms)
      √ should fail setting cap by other than deployer
      √ should set valid times (62ms)
      √ should fail to set times after end time (648ms)
      √ should fail to set invalid times
      √ should fail to set times by other than deployer (47ms)
      √ should set valid rate (62ms)
      √ should fail to set invalid rate
      √ should fail to set rate by other than deployer
      √ should set valid promo token controller (47ms)
      √ should fail to set invalid promo token controller (47ms)
      √ should fail to set promo token controller by other than deployer
      √ should set valid whitelist (125ms)
      √ should set threshold only for invalid whitelist address (141ms)
      √ should fail to set whitelist by other than deployer
      √ should set valid deposit (78ms)
      √ should fail to set deposit by other than deployer
    ending
      √ should be ended after end time (649ms)
      √ should be ended after soft cap reached (2088ms)
      √ should not end sooner if softCap is not reached (2728ms)
      √ should be ended after cap reached (874ms)
    whitelist
      √ should fail for 0 initial signer (47ms)
      √ should be able to set new signer (120ms)
      √ should fail to set zero address signer
      √ should fail to set new signer by other than deployer
      √ should be able to set new whitelist (109ms)
      √ should be able to remove whitelist (172ms)
      √ should fail to set whitelist to address 0x0 (46ms)
      √ should fail to set new whitelist by other than deployer (56ms)
      √ should be able to set many new whitelist (141ms)
      √ should be able to set many new whitelist to false (260ms)
      √ should fail to set many new whitelist by other than deployer
      √ should return false for checking offline signature for empty string
      √ should return false for checking offline signature for invalid signature
      √ should return true for checking valid offline signature (703ms)
      √ should return true for checking valid offline signature by any account (602ms)
      √ should return false for checking old offline signature after changing signer (718ms)
      √ should return true for checking new offline signature after changing signer (697ms)
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
      √ should calculate bonus for first 11.5 hour: 118 (125ms)
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
      √ should calculate bonus for day 6.5: 113 (78ms)
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
      √ should calculate bonus for day 17.5: 107 (47ms)
      √ should calculate bonus for day 18.5: 106
      √ should calculate bonus for day 19.5: 106
      √ should calculate bonus for day 20.5: 105
      √ should calculate bonus for day 21.5: 105
      √ should calculate bonus for day 22.5: 104
      √ should calculate bonus for day 23.5: 104
      √ should calculate bonus for day 24.5: 103 (63ms)
      √ should calculate bonus for day 25.5: 103 (63ms)
      √ should calculate bonus for day 26.5: 102
      √ should calculate bonus for day 27.5: 102
      √ should calculate bonus for day 28.5: 100
      √ should calculate bonus for day 29.5: 100 (47ms)
      √ should give no bonus above below 10 eth
      √ should give bonus above 10 eth
      √ should give bonus above 100 eth
      √ should give no individual bonus if its not set
      √ should fail setting extra bonus for address 0x0
      √ should give individial bonus if set (94ms)
      √ should fail for setting individual bonus other than the deployer (54ms)
      √ should give multiple individial bonus if set (110ms)
      √ should combine individual, time and size based bonuses (70ms)
    promo token
      √ should get the name right (47ms)
      √ should get the symbol right
      √ should get the decimals right
      √ should not be able to send ether to controller since no payable function
      √ should be able to extract token from controller by owner (503ms)
      √ should not be able to extract token from controller by other than owner (250ms)
      √ should be able to set new crowdsale (62ms)
      √ should be able to set zero as new crowdsale (78ms)
      √ should not be able to set new crowdsale by other than owner
      √ everyone with at least 0.1 ether should have 911 promo token
      √ sending someone 0.1 ether should have 911 promo token (637ms)
      √ sending someone less than 0.1 ether should have 0 promo token (582ms)
      √ addresses with less than 0.1 ether should have 0 promo token (63ms)
      √ should be able to notify and log events (78ms)
      √ should be able to notify to many (78ms)
      √ should not be able to distribute by other than owner
      √ should be fail to set promo bonus by any address than owner or PromoController (47ms)
      √ should be fail to set pormo bonus with 0 value (156ms)
      √ should fail to set promo bonus if crowdsale is 0 (156ms)
      √ should fail to set promo bonus if value is 0 (94ms)
      √ should fail to set promo bonus for unsuccessful transfer (78ms)
      √ should fail to set promo bonus for transferFrom with 0 value (168ms)
      √ should set promo bonus for transferFrom (156ms)
      √ should fail to set promo bonus for transferFrom which is too high (172ms)
      √ should set promo bonus by owner (78ms)
      √ should set easter egg promo bonus by owner (92ms)
      √ should set bonus by sending to 0x1 (125ms)
      √ should set bonus by sending to PromoToken (94ms)
      √ should set bonus by sending to Crowdsale (125ms)
      √ should not set bonus by sending to other address than 0x0, PromoToken or Crowdsale (140ms)
      √ should set bonus only once even though sent twice (243ms)
      √ should override smaller extra bonus (153ms)
      √ should not override larger extra bonus (250ms)
      √ should be able to kill (62ms)
      √ should fail to kill by other than the owner (47ms)
    deposit
      √ should fail for initiating with 0x0 sale address (47ms)
      √ should fail deposit without whitelist (203ms)
      √ should fail deposit after sale end (773ms)
      √ should fail deposit for zero address (46ms)
      √ should fail deposit with zero value (110ms)
      √ should fail deposit below min contribution (47ms)
      √ should succeed with min contribution (187ms)
      √ should be able to deposit at min contribution (159ms)
      √ should set new sale address (62ms)
      √ should fail to set new sale address by other than owner
      √ should set new whitelist address (78ms)
      √ should fail to set new whitelist address by other than owner (156ms)
      √ should be able to extract token (1018ms)
      √ should not be able to extract token before end (297ms)
      √ should not be able to extract token after end if there are pending transactions (994ms)
      √ should not be able to extract token from controller by other than owner (1058ms)
      √ should be able to deposit through payable fallback (171ms)
      √ should forward fallback deposit if whitelisted (340ms)
      √ should forward fallback deposit if below the limit (328ms)
      √ should get the same bonus for fallback deposit if forwarded later (949ms)
      √ should be able to deposit (172ms)
      √ should forward deposit if whitelisted (394ms)
      √ should forward deposit if below the limit (449ms)
      √ should forward deposit if offchain signed (863ms)
      √ should fail to forward if cleared (278ms)
      √ should fail to forward non existent transaction (47ms)
      √ should fail to forward transaction without signature (250ms)
      √ should get the same bonus for deposit if forwarded later (987ms)
      √ should forward many transactions (686ms)
      √ should not forward not whitelisted transactions when forwarding many transactions (687ms)
      √ should forward investor transactions if whitelisted (568ms)
      √ should forward investor transactions only below threshold if not whitelisted (660ms)
      √ should not forward investor transactions if not whitelisted (305ms)
      √ should forward investor transactions if offchain signed (1506ms)
      √ should fail for non existent transaction (62ms)
      √ should fail for non existent transaction (78ms)
      √ should refund transaction after end (2035ms)
      √ should fail to refund an already forwarded item (806ms)
      √ should fail to refund an already refunded item (1531ms)
      √ should refund many transactions after end (1835ms)
      √ should refund investor transactions after end (2110ms)
      √ should list both cleared and non-cleared transactions (483ms)
      √ should list cleared transactions (406ms)
      √ should list non-cleared transactions (452ms)
      √ should list no transactions (565ms)
    payments to crowdsale
      √ should reject payments smaller than min contribution (78ms)
      √ should reject zero payments (63ms)
      √ should reject payments for 0x0 address (46ms)
      √ should fail to call depositEth if not deposit address
      √ should accept payments before start (234ms)
      √ should accept payments after start (917ms)
*** BUY TOKENS: 165482 gas used.
      √ should measure buyTokens tx costs (93ms)
      √ should reject payments after end (774ms)
      √ should reject payments outside cap (468ms)
      √ should refund payments that exceed cap (1439ms)
      √ should reject depositOffchain other initiated by owner (78ms)
      √ should reject depositOffchain with 0x0 address
      √ should depositOffchain (105ms)
    low-level purchase
      √ should log purchase (94ms)
      √ should log multiple purchases (328ms)
    hight-level purchase
      √ should log purchase (150ms)
      √ should give back how much one can contribute
      √ should fail when contribution amount is queried for 0x0
      √ should give proper contributor count for zero
      √ should give proper contributor count for two (421ms)
      √ should list both pending and claimed contributors (281ms)
      √ should list pending contributors (1426ms)
      √ should list claimed contributors (1460ms)
      √ should list no contributors (1477ms)
    claim token
      √ should deny claim token before finish (761ms)
      √ should allow claim token after finish below softCap (1584ms)
      √ should allow claim token after finish reaching soft cap (1523ms)
      √ should correctly distribute among multiple participants when buying on separate days (3019ms)
      √ should send back excess tokens to controllers SALE address (1141ms)
      √ should allow token transfer after controller unpaused (1496ms)
    hodl
      √ controller should own hodler
      √ should not allow to add hodler stake for anyone (125ms)
      √ should set hodl stake based on contribution (2178ms)
      √ should set hodl stake based on multiple contributions (2206ms)
      √ should invalidate hodl stake after transfer (2326ms)
      √ should not invalidate hodl stake if receiving transfer, too early claim for 3 month reward (3523ms)
      √ should not invalidate hodl stake if receiving transfer, distribute 3 month reward properly (3639ms)
      √ should not invalidate hodl stake if receiving transfer, distribute 6 month reward properly (3809ms)
      √ should not invalidate hodl stake if receiving transfer, distribute 9 month reward properly (4260ms)
      √ should not distribute hodl to two participants when called too early (3120ms)
      √ should correctly distribute 3 month hodl reward to two participants (3533ms)
      √ should correctly distribute 6 month hodl reward to two participants (4492ms)
      √ should correctly distribute 9 month hodl reward to two participants (4256ms)
      √ should correctly distribute 9 month hodl reward to two participants if it has excess token (4465ms)

  236 passing

```
