# Work paper

Mar 15, 2018, BlockchainLabsNZ


|    Contract     |         Function         | Visibility | Constant | Returns | Modifiers |              Static Analysis              |   Test Coverage    | Functional Analysis |
|-----------------|--------------------------|------------|----------|---------|-----------|-------------------------------------------|--------------------|---------------------|
| CappedCrowdsale | CappedCrowdsale(uint256) | public     | false    |         |           | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| CappedCrowdsale | validPurchase(uint256)   | internal   | true     | bool    |           | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| CappedCrowdsale | hasEnded()               | public     | true     | bool    |           | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| CappedCrowdsale | capReached()             | internal   | true     | bool    |           | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| CappedCrowdsale | buyTokens(address)       | public     | false    |         | payable   | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |



|  Contract  |         Function          | Visibility | Constant | Returns |   Modifiers    |              Static Analysis              |   Test Coverage    | Functional Analysis |
|------------|---------------------------|------------|----------|---------|----------------|-------------------------------------------|--------------------|---------------------|
| Controlled | Controlled()              | public     | false    |         |                | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| Controlled | changeController(address) | public     | false    |         | onlyController | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |



| Contract  |                  Function                  | Visibility | Constant | Returns | Modifiers |              Static Analysis              |   Test Coverage    | Functional Analysis |
|-----------|--------------------------------------------|------------|----------|---------|-----------|-------------------------------------------|--------------------|---------------------|
| Crowdsale | Crowdsale(uint256,uint256,uint256,address) | public     | false    |         |           | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| Crowdsale | ()                                         | public     | false    |         | payable   | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| Crowdsale | buyTokens(address)                         | public     | false    |         | payable   | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| Crowdsale | buyTokens(address,uint256)                 | internal   | false    |         |           | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| Crowdsale | transferToken(address,uint256)             | internal   | false    |         |           | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| Crowdsale | forwardFunds(uint256)                      | internal   | false    |         |           | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| Crowdsale | validPurchase(uint256)                     | internal   | true     | bool    |           | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| Crowdsale | hasEnded()                                 | public     | true     | bool    |           | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| Crowdsale | hasStarted()                               | public     | true     | bool    |           | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |


|     Contract     |                Function                | Visibility | Constant | Returns |      Modifiers       |              Static Analysis              |   Test Coverage    | Functional Analysis |
|------------------|----------------------------------------|------------|----------|---------|----------------------|-------------------------------------------|--------------------|---------------------|
| EthealController | EthealController(address)              | public     | false    |         |                      | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealController | extractTokens(address,address)         | public     | false    |         | onlyOwner            | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealController | setCrowdsaleTransfer(address,uint256)  | public     | false    |         | onlyOwner            | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealController | isCrowdsaleOpen()                      | public     | false    | bool    | view                 | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealController | createGrant(address,uint256,bool,bool) | public     | false    |         | onlyOwner            | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealController | transferToGrant(uint256,uint256)       | public     | false    |         | onlyOwner            | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealController | revokeGrant(uint256)                   | public     | false    |         | onlyOwner            | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealController | getGrantCount()                        | public     | false    | uint    | view                 | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealController | burn(address,uint256)                  | public     | false    |         | onlyEthealMultisig   | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealController | setNewController(address)              | public     | false    |         | onlyEthealMultisig   | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealController | setNewMultisig(address)                | public     | false    |         | onlyEthealMultisig   | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealController | setEthealToken(address,address)        | public     | false    |         | onlyOwner,whenPaused | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealController | setHodlerTime(uint256)                 | public     | false    |         | onlyCrowdsale        | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealController | addHodlerStake(address,uint256)        | public     | false    |         | onlyCrowdsale        | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealController | setHodlerStake(address,uint256)        | public     | false    |         | onlyCrowdsale        | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealController | proxyPayment(address)                  | public     | false    | bool    | payable              | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealController | onTransfer(address,address,uint256)    | public     | false    | bool    |                      | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealController | onApprove(address,address,uint256)     | public     | false    | bool    |                      | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealController | claimTokenTokens(address)              | public     | false    |         | onlyOwner            | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |


|     Contract     |                                         Function                                          | Visibility | Constant |   Returns    |                   Modifiers                    |              Static Analysis              |   Test Coverage    | Functional Analysis |
|------------------|-------------------------------------------------------------------------------------------|------------|----------|--------------|------------------------------------------------|-------------------------------------------|--------------------|---------------------|
| EthealNormalSale | EthealNormalSale(address,uint256,uint256,uint256,uint256,uint256,uint256,uint256,address) | public     | false    |              | CappedCrowdsale,FinalizableCrowdsale,Crowdsale | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealNormalSale | setMinContribution(uint256)                                                               | public     | false    |              | onlyOwner                                      | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealNormalSale | setCaps(uint256,uint256,uint256)                                                          | public     | false    |              | onlyOwner                                      | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealNormalSale | setTimes(uint256,uint256)                                                                 | public     | false    |              | onlyOwner                                      | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealNormalSale | setRate(uint256)                                                                          | public     | false    |              | onlyOwner                                      | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealNormalSale | setPromoTokenController(address)                                                          | public     | false    |              | onlyOwner                                      | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealNormalSale | setWhitelist(address,uint256)                                                             | public     | false    |              | onlyOwner                                      | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealNormalSale | setDeposit(address)                                                                       | public     | false    |              | onlyOwner                                      | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealNormalSale | buyTokens(address)                                                                        | public     | false    |              | payable,whenNotPaused                          | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealNormalSale | buyTokens(address,bytes)                                                                  | public     | false    |              | payable,whenNotPaused                          | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealNormalSale | handlePayment(address,uint256,uint256,bytes)                                              | internal   | false    |              |                                                | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealNormalSale | handleContribution(address,uint256,uint256,bytes)                                         | internal   | false    | uint256      |                                                | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealNormalSale | transferToken(address,uint256,uint256,bytes)                                              | internal   | false    |              |                                                | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealNormalSale | depositEth(address,uint256,bytes)                                                         | public     | false    |              | payable,whenNotPaused                          | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealNormalSale | depositOffchain(address,uint256,uint256,bytes)                                            | public     | false    |              | onlyOwner,whenNotPaused                        | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealNormalSale | validPurchase(uint256)                                                                    | internal   | true     | bool         |                                                | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealNormalSale | hasEnded()                                                                                | public     | true     | bool         |                                                | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealNormalSale | finalization()                                                                            | internal   | false    |              |                                                | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealNormalSale | claimToken()                                                                              | public     | false    |              | afterSale                                      | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealNormalSale | claimTokenFor(address)                                                                    | public     | false    |              | afterSale,whenNotPaused                        | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealNormalSale | claimManyTokenFor(address)                                                                | external   | false    |              | afterSale                                      | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealNormalSale | setPromoBonus(address)                                                                    | public     | false    |              |                                                | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealNormalSale | setBonusExtra(address,uint256)                                                            | public     | false    |              | onlyOwner                                      | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealNormalSale | setManyBonusExtra(address,uint256)                                                        | external   | false    |              | onlyOwner                                      | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealNormalSale | getBonusNow(address,uint256)                                                              | public     | false    | uint256      | view                                           | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealNormalSale | getBonus(address,uint256,uint256)                                                         | public     | false    | _bonus       | view                                           | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealNormalSale | howMuchCanIContributeNow()                                                                | public     | false    | uint256      | view                                           | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealNormalSale | howMuchCanXContributeNow(address)                                                         | public     | false    | uint256      | view                                           | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealNormalSale | getSaleDay(uint256)                                                                       | public     | false    | uint256      | view                                           | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealNormalSale | getSaleDayNow()                                                                           | public     | false    | uint256      | view                                           | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealNormalSale | getSaleHour(uint256)                                                                      | public     | false    | uint256      | view                                           | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealNormalSale | getSaleHourNow()                                                                          | public     | false    | uint256      | view                                           | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealNormalSale | uint256Min(uint256,uint256)                                                               | internal   | false    | uint256      | pure                                           | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealNormalSale | getContributorsCount()                                                                    | public     | false    | uint256      | view                                           | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealNormalSale | getContributors(bool,bool)                                                                | public     | false    | contributors | view                                           | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealNormalSale | getHealBalance()                                                                          | public     | false    | uint256      | view                                           | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |


|   Contract    |                                                    Function                                                    | Visibility | Constant |   Returns    |                             Modifiers                              |              Static Analysis              |   Test Coverage    | Functional Analysis |
|---------------|----------------------------------------------------------------------------------------------------------------|------------|----------|--------------|--------------------------------------------------------------------|-------------------------------------------|--------------------|---------------------|
| EthealPreSale | EthealPreSale(address,uint256,uint256,uint256,uint256,uint256,uint256,uint256,uint256,uint256,uint256,address) | public     | false    |              | CappedCrowdsale,FinalizableCrowdsale,RefundableCrowdsale,Crowdsale | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealPreSale | buyTokens(address)                                                                                             | public     | false    |              | payable,whenNotPaused                                              | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealPreSale | transferToken(address,uint256)                                                                                 | internal   | false    |              |                                                                    | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealPreSale | validPurchase(uint256)                                                                                         | internal   | true     | bool         |                                                                    | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealPreSale | hasEnded()                                                                                                     | public     | true     | bool         |                                                                    | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealPreSale | claimRefund()                                                                                                  | public     | false    |              |                                                                    | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealPreSale | finalization()                                                                                                 | internal   | false    |              |                                                                    | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealPreSale | setWhitelist(address,address,uint256)                                                                          | public     | false    |              | onlyOwner,beforeSale                                               | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealPreSale | setMaxGas(uint256,uint256)                                                                                     | public     | false    |              | onlyOwner,beforeSale                                               | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealPreSale | setMinContribution(uint256)                                                                                    | public     | false    |              | onlyOwner,beforeSale                                               | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealPreSale | setCaps(uint256,uint256,uint256,uint256)                                                                       | public     | false    |              | onlyOwner,beforeSale                                               | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealPreSale | setTimes(uint256,uint256)                                                                                      | public     | false    |              | onlyOwner,beforeSale                                               | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealPreSale | setRate(uint256)                                                                                               | public     | false    |              | onlyOwner,beforeSale                                               | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealPreSale | claimRefundFor(address)                                                                                        | public     | false    |              | afterSaleFail,whenNotPaused                                        | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealPreSale | claimRefundsFor(address)                                                                                       | external   | false    |              | afterSaleFail                                                      | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealPreSale | claimToken()                                                                                                   | public     | false    |              | afterSaleSuccess                                                   | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealPreSale | claimTokenFor(address)                                                                                         | public     | false    |              | afterSaleSuccess,whenNotPaused                                     | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealPreSale | claimTokensFor(address)                                                                                        | external   | false    |              | afterSaleSuccess                                                   | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealPreSale | extractVaultTokens(address,address)                                                                            | public     | false    |              | onlyOwner,afterSale                                                | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealPreSale | howMuchCanIContributeNow()                                                                                     | public     | false    | uint256      | view                                                               | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealPreSale | howMuchCanXContributeNow(address)                                                                              | public     | false    | uint256      | view                                                               | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealPreSale | getSaleDay(uint256)                                                                                            | public     | false    | uint8        | view                                                               | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealPreSale | getSaleDayNow()                                                                                                | public     | false    | uint8        | view                                                               | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealPreSale | uint8Min(uint8,uint8)                                                                                          | internal   | false    | uint8        | pure                                                               | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealPreSale | uint256Min(uint256,uint256)                                                                                    | internal   | false    | uint256      | pure                                                               | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealPreSale | wasSuccess()                                                                                                   | public     | false    | bool         | view                                                               | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealPreSale | getContributorsCount()                                                                                         | public     | false    | uint256      | view                                                               | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealPreSale | getContributors(bool,bool)                                                                                     | public     | false    | contributors | view                                                               | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealPreSale | getHealBalance()                                                                                               | public     | false    | uint256      | view                                                               | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |



|     Contract     |             Function              | Visibility | Constant | Returns |  Modifiers  |              Static Analysis              |   Test Coverage    | Functional Analysis |
|------------------|-----------------------------------|------------|----------|---------|-------------|-------------------------------------------|--------------------|---------------------|
| EthealPromoToken | EthealPromoToken(address,address) | public     | false    |         | MiniMeToken | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |


| EthealPromoTokenController | extractTokens(address,address)           | public     | false    |         | onlyOwner | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealPromoTokenController | setNewController(address)                | public     | false    |         | onlyOwner | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealPromoTokenController | setCrowdsale(address)                    | public     | false    |         | onlyOwner | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealPromoTokenController | setPromoToken(address)                   | public     | false    |         | onlyOwner | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealPromoTokenController | distributeToken(address,uint256)         | public     | false    |         | onlyOwner | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealPromoTokenController | distributeManyToken(address,uint256)     | external   | false    |         | onlyOwner | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealPromoTokenController | distributeTokenInternal(address,uint256) | internal   | false    |         |           | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealPromoTokenController | burnToken(address,uint256)               | public     | false    |         | onlyOwner | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealPromoTokenController | burnManyToken(address,uint256)           | external   | false    |         | onlyOwner | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealPromoTokenController | proxyPayment(address)                    | public     | false    | bool    | payable   | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealPromoTokenController | onTransfer(address,address,uint256)      | public     | false    | bool    |           | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealPromoTokenController | onApprove(address,address,uint256)       | public     | false    | bool    |           | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealPromoTokenController | claimTokenTokens(address)                | public     | false    |         | onlyOwner | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |


|  Contract   |           Function           | Visibility | Constant | Returns |  Modifiers  |              Static Analysis              |   Test Coverage    | Functional Analysis |
|-------------|------------------------------|------------|----------|---------|-------------|-------------------------------------------|--------------------|---------------------|
| EthealToken | EthealToken(address,address) | public     | false    |         | MiniMeToken | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |


|    Contract     |               Function               | Visibility | Constant | Returns | Modifiers |              Static Analysis              |   Test Coverage    | Functional Analysis |
|-----------------|--------------------------------------|------------|----------|---------|-----------|-------------------------------------------|--------------------|---------------------|
| EthealWhitelist | EthealWhitelist(address)             | public     | false    |         |           | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealWhitelist | setSigner(address)                   | public     | false    |         | onlyOwner | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealWhitelist | setWhitelist(address,bool)           | public     | false    |         | onlyOwner | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealWhitelist | setManyWhitelist(address,bool)       | public     | false    |         | onlyOwner | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealWhitelist | isOffchainWhitelisted(address,bytes) | public     | false    | bool    | view      | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |


|       Contract       |    Function    | Visibility | Constant | Returns | Modifiers |              Static Analysis              |   Test Coverage    | Functional Analysis |
|----------------------|----------------|------------|----------|---------|-----------|-------------------------------------------|--------------------|---------------------|
| FinalizableCrowdsale | finalize()     | public     | false    |         | onlyOwner | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| FinalizableCrowdsale | finalization() | internal   | false    |         |           | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |


|  Contract   |            Function            | Visibility | Constant | Returns | Modifiers |              Static Analysis              |   Test Coverage    | Functional Analysis |
|-------------|--------------------------------|------------|----------|---------|-----------|-------------------------------------------|--------------------|---------------------|
| HasNoTokens | extractTokens(address,address) | public     | false    |         | onlyOwner | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |


| Contract |            Function             | Visibility | Constant | Returns |         Modifiers         |              Static Analysis              |   Test Coverage    | Functional Analysis |
|----------|---------------------------------|------------|----------|---------|---------------------------|-------------------------------------------|--------------------|---------------------|
| Hodler   | Hodler(uint256,uint256,uint256) | public     | false    |         |                           | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| Hodler   | addHodlerStake(address,uint256) | public     | false    |         | onlyOwner,beforeHodlStart | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| Hodler   | setHodlerStake(address,uint256) | public     | false    |         | onlyOwner,beforeHodlStart | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| Hodler   | setHodlerTime(uint256)          | public     | false    |         | onlyOwner,beforeHodlStart | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| Hodler   | invalidate(address)             | public     | false    |         | onlyOwner                 | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| Hodler   | claimHodlReward()               | public     | false    |         |                           | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| Hodler   | claimHodlRewardFor(address)     | public     | false    |         |                           | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| Hodler   | claimHodlRewardsFor(address)    | external   | false    |         |                           | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| Hodler   | updateAndGetHodlTotalValue()    | public     | false    | uint    |                           | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |



|  Contract  |      Function      | Visibility | Constant | Returns | Modifiers  |              Static Analysis              |   Test Coverage    | Functional Analysis |
|------------|--------------------|------------|----------|---------|------------|-------------------------------------------|--------------------|---------------------|
| Migrations | Migrations()       | public     | false    |         |            | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| Migrations | setCompleted(uint) | public     | false    |         | restricted | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| Migrations | upgrade(address)   | public     | false    |         | restricted | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |


|      Contract      |                          Function                          | Visibility | Constant |   Returns   |   Modifiers    |              Static Analysis              |   Test Coverage    | Functional Analysis |
|--------------------|------------------------------------------------------------|------------|----------|-------------|----------------|-------------------------------------------|--------------------|---------------------|
| MiniMeToken        | MiniMeToken(address,address,uint,string,uint8,string,bool) | public     | false    |             |                | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| MiniMeToken        | transfer(address,uint256)                                  | public     | false    | success     |                | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| MiniMeToken        | transferFrom(address,address,uint256)                      | public     | false    | success     |                | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| MiniMeToken        | doTransfer(address,address,uint)                           | internal   | false    | bool        |                | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| MiniMeToken        | balanceOf(address)                                         | public     | true     | balance     |                | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| MiniMeToken        | approve(address,uint256)                                   | public     | false    | success     |                | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| MiniMeToken        | allowance(address,address)                                 | public     | true     | remaining   |                | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| MiniMeToken        | approveAndCall(address,uint256,bytes)                      | public     | false    | success     |                | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| MiniMeToken        | totalSupply()                                              | public     | true     | uint        |                | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| MiniMeToken        | balanceOfAt(address,uint)                                  | public     | true     | uint        |                | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| MiniMeToken        | totalSupplyAt(uint)                                        | public     | true     | uint        |                | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| MiniMeToken        | createCloneToken(string,uint8,string,uint,bool)            | public     | false    | address     |                | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| MiniMeToken        | generateTokens(address,uint)                               | public     | false    | bool        | onlyController | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| MiniMeToken        | destroyTokens(address,uint)                                | public     | false    | bool        | onlyController | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| MiniMeToken        | enableTransfers(bool)                                      | public     | false    |             | onlyController | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| MiniMeToken        | getValueAt(Checkpoint,uint)                                | internal   | true     | uint        |                | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| MiniMeToken        | updateValueAtNow(Checkpoint,uint)                          | internal   | false    |             |                | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| MiniMeToken        | isContract(address)                                        | internal   | true     | bool        |                | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| MiniMeToken        | min(uint,uint)                                             | internal   | false    | uint        | pure           | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| MiniMeToken        | ()                                                         | public     | false    |             | payable        | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| MiniMeToken        | claimTokens(address)                                       | public     | false    |             | onlyController | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| MiniMeTokenFactory | createCloneToken(address,uint,string,uint8,string,bool)    | public     | false    | MiniMeToken |                | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |


| Contract |          Function          | Visibility | Constant | Returns | Modifiers |              Static Analysis              |   Test Coverage    | Functional Analysis |
|----------|----------------------------|------------|----------|---------|-----------|-------------------------------------------|--------------------|---------------------|
| Ownable  | Ownable()                  | public     | false    |         |           | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| Ownable  | transferOwnership(address) | public     | false    |         | onlyOwner | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |


| Contract | Function  | Visibility | Constant | Returns |        Modifiers        |              Static Analysis              |   Test Coverage    | Functional Analysis |
|----------|-----------|------------|----------|---------|-------------------------|-------------------------------------------|--------------------|---------------------|
| Pausable | pause()   | public     | false    |         | onlyOwner,whenNotPaused | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| Pausable | unpause() | public     | false    |         | onlyOwner,whenPaused    | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |


|      Contract       |           Function           | Visibility | Constant | Returns | Modifiers |              Static Analysis              |   Test Coverage    | Functional Analysis |
|---------------------|------------------------------|------------|----------|---------|-----------|-------------------------------------------|--------------------|---------------------|
| RefundableCrowdsale | RefundableCrowdsale(uint256) | public     | false    |         |           | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| RefundableCrowdsale | forwardFunds(uint256)        | internal   | false    |         |           | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| RefundableCrowdsale | claimRefund()                | public     | false    |         |           | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| RefundableCrowdsale | finalization()               | internal   | false    |         |           | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| RefundableCrowdsale | goalReached()                | public     | true     | bool    |           | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |


|  Contract   |       Function       | Visibility | Constant | Returns |     Modifiers     |              Static Analysis              |   Test Coverage    | Functional Analysis |
|-------------|----------------------|------------|----------|---------|-------------------|-------------------------------------------|--------------------|---------------------|
| RefundVault | RefundVault(address) | public     | false    |         |                   | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| RefundVault | deposit(address)     | public     | false    |         | onlyOwner,payable | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| RefundVault | close()              | public     | false    |         | onlyOwner         | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| RefundVault | enableRefunds()      | public     | false    |         | onlyOwner         | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| RefundVault | refund(address)      | public     | false    |         |                   | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |


|   Contract   |                      Function                      | Visibility | Constant | Returns | Modifiers |              Static Analysis              |   Test Coverage    | Functional Analysis |
|--------------|----------------------------------------------------|------------|----------|---------|-----------|-------------------------------------------|--------------------|---------------------|
| TokenVesting | TokenVesting(address,uint256,uint256,uint256,bool) | public     | false    |         |           | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| TokenVesting | release(ERC20MiniMe)                               | public     | false    |         |           | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| TokenVesting | revoke(ERC20MiniMe)                                | public     | false    |         | onlyOwner | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| TokenVesting | releasableAmount(ERC20MiniMe)                      | public     | true     | uint256 |           | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| TokenVesting | vestedAmount(ERC20MiniMe)                          | public     | true     | uint256 |           | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |


|   Contract   |                      Function                      | Visibility | Constant | Returns | Modifiers |              Static Analysis              |   Test Coverage    | Functional Analysis |
|--------------|----------------------------------------------------|------------|----------|---------|-----------|-------------------------------------------|--------------------|---------------------|
| ECRecovery | recover(bytes32,bytes) | public     | true    |         |           | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |


|   Contract   |                      Function                      | Visibility | Constant | Returns | Modifiers |              Static Analysis              |   Test Coverage    | Functional Analysis |
|--------------|----------------------------------------------------|------------|----------|---------|-----------|-------------------------------------------|--------------------|---------------------|
| TokenVesting | TokenVesting(address,uint256,uint256,uint256,bool) | public     | false    |         |           | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| TokenVesting | release(ERC20MiniMe)                               | public     | false    |         |           | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| TokenVesting | revoke(ERC20MiniMe)                                | public     | false    |         | onlyOwner | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| TokenVesting | releasableAmount(ERC20MiniMe)                      | public     | true     | uint256 |           | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| TokenVesting | vestedAmount(ERC20MiniMe)                          | public     | true     | uint256 |           | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |

|   Contract    |                   Function                   | Visibility | Constant | Returns |             Modifiers             |              Static Analysis              |   Test Coverage    | Functional Analysis |
|---------------|----------------------------------------------|------------|----------|---------|-----------------------------------|-------------------------------------------|--------------------|---------------------|
| EthealDeposit | EthealDeposit(address,address)               | public     | false    |         |                                   | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealDeposit | setSale(address)                             | public     | false    |         | onlyOwner                         | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealDeposit | setWhitelist(address)                        | public     | false    |         | onlyOwner                         | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealDeposit | extractTokens(address,address)               | public     | false    |         | onlyOwner,saleEnded               | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealDeposit | ()                                           | public     | false    |         | payable                           | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealDeposit | deposit(address,bytes)                       | public     | false    | uint256 | payable,whitelistSet,saleNotEnded | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealDeposit | forwardTransaction(uint256,bytes)            | public     | false    |         | whitelistSet,saleNotEnded         | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealDeposit | forwardManyTransaction(uint256)              | public     | false    |         | whitelistSet,saleNotEnded         | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealDeposit | forwardInvestorTransaction(address,bytes)    | public     | false    |         | whitelistSet,saleNotEnded         | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealDeposit | refundTransaction(uint256)                   | public     | false    |         | saleEnded                         | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealDeposit | refundManyTransaction(uint256)               | public     | false    |         | saleEnded                         | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealDeposit | refundInvestor(address)                      | public     | false    |         | saleEnded                         | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealDeposit | addTransaction(address,uint256)              | internal   | false    | uint256 |                                   | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealDeposit | forwardTransactionInternal(uint256,bytes)    | internal   | false    | bool    |                                   | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealDeposit | refundTransactionInternal(uint256)           | internal   | false    | bool    |                                   | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealDeposit | getTransactionIds(uint256,uint256,bool,bool) | external   | false    | ids     | view                              | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| EthealDeposit | bytesToArgument(bytes,uint256) | internal   | false    | bytes     | pure                              | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |


|           Contract           |                    Function                     | Visibility | Constant |     Returns     |                       Modifiers                       |              Static Analysis              |   Test Coverage    | Functional Analysis |
|------------------------------|-------------------------------------------------|------------|----------|-----------------|-------------------------------------------------------|-------------------------------------------|--------------------|---------------------|
| MultiSigWallet               | ()                                              | public     | false    |                 | payable                                               | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| MultiSigWallet               | MultiSigWallet(address,uint)                    | public     | false    |                 | validRequirement                                      | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| MultiSigWallet               | addOwner(address)                               | public     | false    |                 | onlyWallet,ownerDoesNotExist,notNull,validRequirement | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| MultiSigWallet               | removeOwner(address)                            | public     | false    |                 | onlyWallet,ownerExists                                | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| MultiSigWallet               | replaceOwner(address,address)                   | public     | false    |                 | onlyWallet,ownerExists,ownerDoesNotExist              | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| MultiSigWallet               | changeRequirement(uint)                         | public     | false    |                 | onlyWallet,validRequirement                           | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| MultiSigWallet               | submitTransaction(address,uint,bytes)           | public     | false    | transactionId   |                                                       | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| MultiSigWallet               | confirmTransaction(uint)                        | public     | false    |                 | ownerExists,transactionExists,notConfirmed            | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| MultiSigWallet               | revokeConfirmation(uint)                        | public     | false    |                 | ownerExists,confirmed,notExecuted                     | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| MultiSigWallet               | executeTransaction(uint)                        | public     | false    |                 | notExecuted                                           | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| MultiSigWallet               | isConfirmed(uint)                               | public     | true     | bool            |                                                       | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| MultiSigWallet               | addTransaction(address,uint,bytes)              | internal   | false    | transactionId   | notNull                                               | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| MultiSigWallet               | getConfirmationCount(uint)                      | public     | true     | count           |                                                       | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| MultiSigWallet               | getTransactionCount(bool,bool)                  | public     | true     | count           |                                                       | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| MultiSigWallet               | getOwners()                                     | public     | true     |                 |                                                       | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| MultiSigWallet               | getConfirmations(uint)                          | public     | true     | _confirmations  |                                                       | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| MultiSigWallet               | getTransactionIds(uint,uint,bool,bool)          | public     | true     | _transactionIds |                                                       | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| MultiSigWalletWithDailyLimit | MultiSigWalletWithDailyLimit(address,uint,uint) | public     | false    |                 | MultiSigWallet                                        | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| MultiSigWalletWithDailyLimit | changeDailyLimit(uint)                          | public     | false    |                 | onlyWallet                                            | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| MultiSigWalletWithDailyLimit | executeTransaction(uint)                        | public     | false    |                 | notExecuted                                           | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| MultiSigWalletWithDailyLimit | isUnderLimit(uint)                              | internal   | false    | bool            |                                                       | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |
| MultiSigWalletWithDailyLimit | calcMaxWithdraw()                               | public     | true     | uint            |                                                       | :white_check_mark::ballot_box_with_check: | :white_check_mark: | :white_check_mark:  |