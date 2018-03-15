# Dynamic Analysis
performed by Blockchain Labs, March 15, 2018

```

  Contract: NormalSale
    creating a valid crowdsale
      ✓ should fail with zero rate (89ms)
      ✓ should fail with zero cap (113ms)
      ✓ should fail with greater softCap than cap (177ms)
      ✓ should fail with zero controller (118ms)
      ✓ should fail with zero wallet (87ms)
    modify parameters
      ✓ should set valid mincontribution (59ms)
      ✓ should fail to set mincintribution from other address than deployer
      ✓ should set valid caps (53ms)
      ✓ should fail setting zero cap (57ms)
      ✓ should fail setting greater softCap than cap (43ms)
      ✓ should fail setting cap by other than deployer
      ✓ should set valid times (45ms)
      ✓ should fail to set invalid times (42ms)
      ✓ should fail to set times by other than deployer
      ✓ should set valid rate (42ms)
      ✓ should fail to set invalid rate
      ✓ should fail to set rate by other than deployer
      ✓ should set valid promo token controller (48ms)
      ✓ should fail to set invalid promo token controller (41ms)
      ✓ should fail to set promo token controller by other than deployer
      ✓ should set valid whitelist (76ms)
      ✓ should set threshold only for invalid whitelist address (89ms)
      ✓ should fail to set whitelist by other than deployer
      ✓ should set valid deposit (73ms)
      ✓ should fail to set deposit by other than deployer
    ending
      ✓ should be ended after end time (174ms)
      ✓ should be ended after soft cap reached (867ms)
      ✓ should not end sooner if softCap is not reached (932ms)
      ✓ should be ended after cap reached (654ms)
    whitelist
      ✓ should fail for 0 initial signer
      ✓ should be able to set new signer (51ms)
      ✓ should fail to set zero address signer
      ✓ should fail to set new signer by other than deployer
      ✓ should be able to set new whitelist (68ms)
      ✓ should be able to remove whitelist (118ms)
      ✓ should fail to set whitelist to address 0x0
      ✓ should fail to set new whitelist by other than deployer
      ✓ should be able to set many new whitelist (123ms)
      ✓ should be able to set many new whitelist to false (214ms)
      ✓ should fail to set many new whitelist by other than deployer
      ✓ should return false for checking offline signature for empty string
      ✓ should return false for checking offline signature for invalid signature
      ✓ should return true for checking valid offline signature (201ms)
      ✓ should return true for checking valid offline signature by any account (161ms)
      ✓ should return false for checking old offline signature after changing signer (209ms)
      ✓ should return true for checking new offline signature after changing signer (200ms)
    bonus
      ✓ should give the biggest bonus before sale (65ms)
      ✓ should give the biggest bonus now (92ms)
      ✓ should sale day now 0 before sale
      ✓ should sale hour now 0 before sale (39ms)
      ✓ should calculate bonus for first 0.5 hour: 130 (129ms)
      ✓ should calculate bonus for first 1.5 hour: 125 (122ms)
      ✓ should calculate bonus for first 2.5 hour: 125 (120ms)
      ✓ should calculate bonus for first 3.5 hour: 125 (118ms)
      ✓ should calculate bonus for first 4.5 hour: 125 (131ms)
      ✓ should calculate bonus for first 5.5 hour: 120 (119ms)
      ✓ should calculate bonus for first 6.5 hour: 120 (139ms)
      ✓ should calculate bonus for first 7.5 hour: 120 (169ms)
      ✓ should calculate bonus for first 8.5 hour: 118 (140ms)
      ✓ should calculate bonus for first 9.5 hour: 118 (163ms)
      ✓ should calculate bonus for first 10.5 hour: 118 (136ms)
      ✓ should calculate bonus for first 11.5 hour: 118 (123ms)
      ✓ should calculate bonus for first 12.5 hour: 118 (125ms)
      ✓ should calculate bonus for first 13.5 hour: 118 (132ms)
      ✓ should calculate bonus for first 14.5 hour: 118 (123ms)
      ✓ should calculate bonus for first 15.5 hour: 118 (121ms)
      ✓ should calculate bonus for first 16.5 hour: 118 (168ms)
      ✓ should calculate bonus for first 17.5 hour: 118 (159ms)
      ✓ should calculate bonus for first 18.5 hour: 118 (135ms)
      ✓ should calculate bonus for first 19.5 hour: 118 (164ms)
      ✓ should calculate bonus for first 20.5 hour: 118 (122ms)
      ✓ should calculate bonus for first 21.5 hour: 118 (120ms)
      ✓ should calculate bonus for first 22.5 hour: 118 (121ms)
      ✓ should calculate bonus for first 23.5 hour: 118 (130ms)
      ✓ should calculate bonus for day 2.5: 116 (115ms)
      ✓ should calculate bonus for day 3.5: 115 (150ms)
      ✓ should calculate bonus for day 4.5: 114 (127ms)
      ✓ should calculate bonus for day 5.5: 114 (114ms)
      ✓ should calculate bonus for day 6.5: 113 (158ms)
      ✓ should calculate bonus for day 7.5: 113 (119ms)
      ✓ should calculate bonus for day 8.5: 112 (138ms)
      ✓ should calculate bonus for day 9.5: 112 (165ms)
      ✓ should calculate bonus for day 10.5: 111 (123ms)
      ✓ should calculate bonus for day 11.5: 111 (172ms)
      ✓ should calculate bonus for day 12.5: 110 (174ms)
      ✓ should calculate bonus for day 13.5: 110 (127ms)
      ✓ should calculate bonus for day 14.5: 108 (156ms)
      ✓ should calculate bonus for day 15.5: 108 (148ms)
      ✓ should calculate bonus for day 16.5: 107 (136ms)
      ✓ should calculate bonus for day 17.5: 107 (176ms)
      ✓ should calculate bonus for day 18.5: 106 (170ms)
      ✓ should calculate bonus for day 19.5: 106 (158ms)
      ✓ should calculate bonus for day 20.5: 105 (198ms)
      ✓ should calculate bonus for day 21.5: 105 (142ms)
      ✓ should calculate bonus for day 22.5: 104 (141ms)
      ✓ should calculate bonus for day 23.5: 104 (156ms)
      ✓ should calculate bonus for day 24.5: 103 (184ms)
      ✓ should calculate bonus for day 25.5: 103 (168ms)
      ✓ should calculate bonus for day 26.5: 102 (168ms)
      ✓ should calculate bonus for day 27.5: 102 (147ms)
      ✓ should calculate bonus for day 28.5: 100 (193ms)
      ✓ should calculate bonus for day 29.5: 100 (145ms)
      ✓ should give no bonus above below 10 eth (146ms)
      ✓ should give bonus above 10 eth (240ms)
      ✓ should give bonus above 100 eth (154ms)
      ✓ should give no individual bonus if its not set (170ms)
      ✓ should fail setting extra bonus for address 0x0 (39ms)
      ✓ should give individial bonus if set (194ms)
      ✓ should fail for setting individual bonus other than the deployer
      ✓ should give multiple individial bonus if set (361ms)
      ✓ should combine individual, time and size based bonuses (151ms)
    promo token
      ✓ should get the name right
      ✓ should get the symbol right
      ✓ should get the decimals right
      ✓ should not be able to send ether to controller since no payable function
      ✓ should be able to extract token from controller by owner (851ms)
      ✓ should not be able to extract token from controller by other than owner (412ms)
      ✓ should be able to set new crowdsale
      ✓ should be able to set zero as new crowdsale
      ✓ should not be able to set new crowdsale by other than owner
      ✓ everyone with at least 0.1 ether should have 911 promo token (50ms)
      ✓ sending someone 0.1 ether should have 911 promo token (220ms)
      ✓ sending someone less than 0.1 ether should have 0 promo token (199ms)
      ✓ addresses with less than 0.1 ether should have 0 promo token (53ms)
      ✓ should be able to notify and log events (109ms)
      ✓ should be able to notify to many (99ms)
      ✓ should not be able to distribute by other than owner (41ms)
      ✓ should be fail to set promo bonus by any address than owner or PromoController (62ms)
      ✓ should be fail to set pormo bonus with 0 value
      ✓ should fail to set promo bonus if crowdsale is 0 (288ms)
      ✓ should fail to set promo bonus if value is 0 (137ms)
      ✓ should fail to set promo bonus for unsuccessful transfer (99ms)
      ✓ should fail to set promo bonus for transferFrom with 0 value (227ms)
      ✓ should set promo bonus for transferFrom (403ms)
      ✓ should fail to set promo bonus for transferFrom which is too high (142ms)
      ✓ should set promo bonus by owner (69ms)
      ✓ should set easter egg promo bonus by owner (69ms)
      ✓ should set bonus by sending to 0x1 (303ms)
      ✓ should set bonus by sending to PromoToken (299ms)
      ✓ should set bonus by sending to Crowdsale (277ms)
      ✓ should not set bonus by sending to other address than 0x0, PromoToken or Crowdsale (273ms)
      ✓ should set bonus only once even though sent twice (438ms)
      ✓ should override smaller extra bonus (313ms)
      ✓ should not override larger extra bonus (342ms)
      ✓ should be able to kill
      ✓ should fail to kill by other than the owner
    deposit
      ✓ should fail for initiating with 0x0 sale address (49ms)
      ✓ should fail deposit without whitelist (114ms)
      ✓ should fail deposit after sale end (170ms)
      ✓ should fail deposit for zero address (75ms)
      ✓ should fail deposit with zero value (79ms)
      ✓ should set new sale address (58ms)
      ✓ should fail to set new sale address by other than owner
      ✓ should set new whitelist address
      ✓ should fail to set new whitelist address by other than owner
      ✓ should be able to extract token (1057ms)
      ✓ should not be able to extract token before end (448ms)
      ✓ should not be able to extract token after end if there are pending transactions (716ms)
      ✓ should not be able to extract token from controller by other than owner (461ms)
      ✓ should be able to deposit through payable fallback (220ms)
      ✓ should forward fallback deposit if whitelisted (605ms)
      ✓ should forward fallback deposit if below the limit (649ms)
      ✓ should get the same bonus for fallback deposit if forwarded later (880ms)
      ✓ should be able to deposit (227ms)
      ✓ should forward deposit if whitelisted (633ms)
      ✓ should forward deposit if below the limit (627ms)
      ✓ should forward deposit if offchain signed (785ms)
      ✓ should fail to forward if cleared (685ms)
      ✓ should fail to forward non existent transaction (65ms)
      ✓ should fail to forward transaction without signature (471ms)
      ✓ should get the same bonus for deposit if forwarded later (866ms)
      ✓ should forward many transactions (1430ms)
      ✓ should forward investor transactions if whitelisted (1392ms)
      ✓ should forward investor transactions if offchain signed (1584ms)
      ✓ should fail for non existent transaction (48ms)
      ✓ should fail for non existent transaction (53ms)
      ✓ should refund transaction after end (677ms)
      ✓ should fail to refund an already forwarded item (417ms)
      ✓ should fail to refund an already refunded item (737ms)
      ✓ should refund many transactions after end (1265ms)
      ✓ should refund investor transactions after end (1008ms)
      ✓ should list both cleared and non-cleared transactions (1225ms)
      ✓ should list cleared transactions (881ms)
      ✓ should list non-cleared transactions (836ms)
      ✓ should list no transactions (811ms)
    payments to crowdsale
      ✓ should reject payments smaller than min contribution (356ms)
      ✓ should reject zero payments (144ms)
      ✓ should reject payments for 0x0 address (39ms)
      ✓ should fail to call depositEth if not deposit address (90ms)
      ✓ should accept payments before start (860ms)
      ✓ should accept payments after start (917ms)
*** BUY TOKENS: 317391 gas used.
      ✓ should measure buyTokens tx costs (341ms)
      ✓ should reject payments after end (361ms)
      ✓ should reject payments outside cap (575ms)
      ✓ should refund payments that exceed cap (1080ms)
      ✓ should reject depositOffchain other initiated by owner (65ms)
      ✓ should reject depositOffchain with 0x0 address (42ms)
      ✓ should depositOffchain (310ms)
    low-level purchase
      ✓ should log purchase (373ms)
    hight-level purchase
      ✓ should log purchase (335ms)
      ✓ should give back how much one can contribute (59ms)
      ✓ should fail when contribution amount is queried for 0x0
      ✓ should give proper contributor count for zero
      ✓ should give proper contributor count for two (731ms)
      ✓ should list both pending and claimed contributors (844ms)
      ✓ should list pending contributors (1949ms)
      ✓ should list claimed contributors (1879ms)
      ✓ should list no contributors (2069ms)
    claim token
      ✓ should deny claim token before finish (211ms)
      ✓ should allow claim token after finish below softCap (1920ms)
      ✓ should allow claim token after finish reaching soft cap (1682ms)
      ✓ should correctly distribute among multiple participants when buying on separate days (3220ms)
      ✓ should send back excess tokens to controllers SALE address (1428ms)
      ✓ should allow token transfer after controller unpaused (2274ms)
    hodl
      ✓ controller should own hodler
      ✓ should not allow to add hodler stake for anyone (194ms)
      ✓ should set hodl stake based on contribution (1756ms)
      ✓ should set hodl stake based on multiple contributions (2276ms)
      ✓ should invalidate hodl stake after transfer (2482ms)
      ✓ should not invalidate hodl stake if receiving transfer, too early claim for 3 month reward (3394ms)
      ✓ should not invalidate hodl stake if receiving transfer, distribute 3 month reward properly (3398ms)
      ✓ should not invalidate hodl stake if receiving transfer, distribute 6 month reward properly (4734ms)
      ✓ should not invalidate hodl stake if receiving transfer, distribute 9 month reward properly (5126ms)
      ✓ should not distribute hodl to two participants when called too early (3275ms)
      ✓ should correctly distribute 3 month hodl reward to two participants (3729ms)
      ✓ should correctly distribute 6 month hodl reward to two participants (4705ms)
      ✓ should correctly distribute 9 month hodl reward to two participants (5399ms)
      ✓ should correctly distribute 9 month hodl reward to two participants if it has excess token (5627ms)


  228 passing (11m)

```
