# GTE Perps and Launchpad audit details
- Total Prize Pool: $103,250 in USDC 
  - HM awards: up to $96,000 in USDC
    - If no valid Highs or Mediums are found, the HM pool is $0 
  - QA awards: $4,000 in USDC
  - Judge awards: $3,000 in USDC
  - Scout awards: $250 in USDC
- [Read our guidelines for more details](https://docs.code4rena.com/competitions)
- Starts August 28, 2025 20:00 UTC 
- Ends September 25, 2025 20:00 UTC

**❗ Important notes for wardens** 
1. A coded, runnable PoC is required for all High/Medium submissions to this audit. 
  - This repo includes a basic template to run the test suite under the `test/c4-poc` folder.
  - PoCs must use the test suite provided in this repo.
  - Your submission will be marked as Insufficient if the POC is not runnable and working with the provided test suite.
  - Exception: PoC is optional (though recommended) for wardens with signal ≥ 0.68.
1. Judging phase risk adjustments (upgrades/downgrades):
  - High- or Medium-risk submissions downgraded by the judge to Low-risk (QA) will be ineligible for awards.
  - Upgrading a Low-risk finding from a QA report to a Medium- or High-risk finding is not supported.
  - As such, wardens are encouraged to select the appropriate risk level carefully during the submission phase.

## Automated Findings / Publicly Known Issues

The 4naly3er report has not been generated for this contest due to the system's SotA compiler combined wtih a complex library and type structure.

_Note for C4 wardens: Anything included in this `Automated Findings / Publicly Known Issues` section is considered a publicly known issue and is ineligible for awards._

### Index Price Manipulation

Any vulnerabilities stemming from manipulation of the Index Price that is yielded by Oracles and other off-chain resources will not be considered valid for the purposes of the contest; for all intents and purposes, the Index Price is considered valid and secure. 

Tampering of these resources as well as organic market manipulation of the Index Price are also considered out-of-scope. However, price *history* manipulation of the Index Price (or any other price type within the system) is in-scope.

Additionally, manipulation of the platform-specific construct called the Mark Price is in-scope as well.

### Previously Identified Issues

Any submissions that have been identified in the Zellic audits are considered out-of-scope for the purposes of this contest. Additionally, any submissions applicable to the perpetual CLOB system that were identified in the Code4rena CLOB contest are also considered out-of-scope. 

A notable example of such findings would be [S-461](https://code4rena.com/audits/2025-07-gte-spot-clob-and-router/submissions/S-461) and the absence of a minimum expiry enforcement / minimum wait cancellation window.

# Overview

## Launchpad

Permissionless token launcher and project token launchpad.

### Permissionless Token Launcher

The GTE token launcher is a permissionless system that allows anyone to boostrap liquidity to launch a token on GTE. Launches are fair, meaning that no tokens will be available for purchase by the team beforehand. The flow of launching a new long-tail asset is as follows:

- 80% of the token supply will be traded on a bonding curve, and when a token hits the bonding price, a liquidity pool will automatically be deployed on the GTE AMM seeded with 20% of the supply reserved from the bonding curve.
- After a launched token bonds and gets its own liquidity pool, the token will be immediately tradeable in the DEX aggregator frontend.
- After a token reaches sufficient maturity and market depth, it will be automatically added to the GTE CLOB platform.

### Project Token Launchpad

The GTE Token Launchpad addresses the growing skepticism around CEX listings, which are often expensive and lack transparency in price discovery. Unlike CEXs, GTE partners with projects on MegaETH to launch tokens onchain through our token launchpad and across our trading venues.

The launchpad facilitates the creation of fully onchain token vaults, enabling token sales to the GTE community. Upon a sale, tokens are locked in a stake vault. Users who hold their staked tokens for longer periods receive more tokens at the time of vault unlock. Additionally, GTE receives a portion of the initial supply dedicated to the launchpad.

This process is conducted in a fully compliant manner, with partnerships in place to provide necessary KYC, ensuring protection for both GTE and its users.

## Perps CLOB

GTE onchain Central-Limit Order Book

### What is a CLOB?

The order book is an exchange design that resembles traditional finance. For any given asset pair, an order book maintains a bid and ask side – each one being a list of buy and sell orders, respectively. Each order is placed at a different price level, called a limit, and has an order size, which represents the amount of the trade asset that the order wants to buy or sell. Order books use an algorithmic matching engine to match up buy and sell orders, settling the funds of orders that fulfill each other. Most order books use “price-time priority” for their matching engines, meaning that the highest buy offers and lowest sell offers are settled first, followed by the chronological sequence of orders placed at that limit price.

### Perps
GTE leverages its high-performance infrastructure to offer Central Limit Order Books for both major market types, with perpetual futures being the focus of this contest:

- Perpetual Futures CLOB: For trading derivatives contracts that mimic spot prices without an expiry date, allowing for leverage and hedging strategies.

## Links

- **Previous audits:**  
  - Launchpad: https://github.com/Zellic/publications/blob/master/GTE%20Launchpad-%20Zellic%20Audit%20Report.pdf
  - CLOB Perps: https://github.com/Zellic/publications/blob/master/GTE%20Perps%20-%20Zellic%20Audit%20Report.pdf
- **Documentation:** https://docs.gte.xyz/home/, https://hackmd.io/@prltZHT9SO6hggMkOStsyw/BknIWmAYle
- **Website:** https://www.gte.xyz
- **X/Twitter:** https://x.com/GTE_XYZ
  
---

# Scope

### Files in scope

_Note: The nSLoC counts in the following table have been automatically generated and may differ depending on the definition of what a "significant" line of code represents. As such, they should be considered indicative rather than absolute representations of the lines involved in each contract._

| File   | nSLOC | 
| ------ | ----- | 
| [contracts/perps/GTL.sol](https://github.com/code-423n4/2025-08-gte-perps/blob/main/contracts/perps/GTL.sol) | 199 | 
| [contracts/perps/PerpManager.sol](https://github.com/code-423n4/2025-08-gte-perps/blob/main/contracts/perps/PerpManager.sol) |  226 | 
| [contracts/perps/modules/AdminPanel.sol](https://github.com/code-423n4/2025-08-gte-perps/blob/main/contracts/perps/modules/AdminPanel.sol) |  467 | 
| [contracts/perps/modules/LiquidatorPanel.sol](https://github.com/code-423n4/2025-08-gte-perps/blob/main/contracts/perps/modules/LiquidatorPanel.sol) | 536 | 
| [contracts/perps/modules/ViewPort.sol](https://github.com/code-423n4/2025-08-gte-perps/blob/main/contracts/perps/modules/ViewPort.sol) | 233 | 
| [contracts/perps/types/BackstopLiquidatorDataLib.sol](https://github.com/code-423n4/2025-08-gte-perps/blob/main/contracts/perps/types/BackstopLiquidatorDataLib.sol) | 62 |
| [contracts/perps/types/Book.sol](https://github.com/code-423n4/2025-08-gte-perps/blob/main/contracts/perps/types/Book.sol) | 339 |
| [contracts/perps/types/CLOBLib.sol](https://github.com/code-423n4/2025-08-gte-perps/blob/main/contracts/perps/types/CLOBLib.sol) | 420 | 
| [contracts/perps/types/ClearingHouse.sol](https://github.com/code-423n4/2025-08-gte-perps/blob/main/contracts/perps/types/ClearingHouse.sol) | 431 | 
| [contracts/perps/types/CollateralManager.sol](https://github.com/code-423n4/2025-08-gte-perps/blob/main/contracts/perps/types/CollateralManager.sol) | 72 | 
| [contracts/perps/types/Constants.sol](https://github.com/code-423n4/2025-08-gte-perps/blob/main/contracts/perps/types/Constants.sol) | 9 | 
| [contracts/perps/types/Enums.sol](https://github.com/code-423n4/2025-08-gte-perps/blob/main/contracts/perps/types/Enums.sol) |  35 |
| [contracts/perps/types/FeeManager.sol](https://github.com/code-423n4/2025-08-gte-perps/blob/main/contracts/perps/types/FeeManager.sol) | 49 | 
| [contracts/perps/types/FundingRateEngine.sol](https://github.com/code-423n4/2025-08-gte-perps/blob/main/contracts/perps/types/FundingRateEngine.sol) | 80 | 
| [contracts/perps/types/InsuranceFund.sol](https://github.com/code-423n4/2025-08-gte-perps/blob/main/contracts/perps/types/InsuranceFund.sol) | 37 |
| [contracts/perps/types/Market.sol](https://github.com/code-423n4/2025-08-gte-perps/blob/main/contracts/perps/types/Market.sol) | 398 | 
| [contracts/perps/types/Order.sol](https://github.com/code-423n4/2025-08-gte-perps/blob/main/contracts/perps/types/Order.sol) | 69 |
| [contracts/perps/types/PackedFeeRatesLib.sol](https://github.com/code-423n4/2025-08-gte-perps/blob/main/contracts/perps/types/PackedFeeRatesLib.sol) | 20 |
| [contracts/perps/types/Position.sol](https://github.com/code-423n4/2025-08-gte-perps/blob/main/contracts/perps/types/Position.sol) | 87 | 
| [contracts/perps/types/PriceHistory.sol](https://github.com/code-423n4/2025-08-gte-perps/blob/main/contracts/perps/types/PriceHistory.sol) | 66 |
| [contracts/perps/types/StorageLib.sol](https://github.com/code-423n4/2025-08-gte-perps/blob/main/contracts/perps/types/StorageLib.sol) | 121 |
| [contracts/perps/types/Structs.sol](https://github.com/code-423n4/2025-08-gte-perps/blob/main/contracts/perps/types/Structs.sol) | 155 |
| [contracts/launchpad/BondingCurve.sol](https://github.com/code-423n4/2025-08-gte-perps/blob/main/contracts/launchpad/BondingCurve.sol) | 3 |
| [contracts/launchpad/BondingCurves/IBondingCurveMinimal.sol](https://github.com/code-423n4/2025-08-gte-perps/blob/main/contracts/launchpad/BondingCurves/IBondingCurveMinimal.sol) |  4 | 
| [contracts/launchpad/BondingCurves/SimpleBondingCurve.sol](https://github.com/code-423n4/2025-08-gte-perps/blob/main/contracts/launchpad/BondingCurves/SimpleBondingCurve.sol) | 120 | 
| [contracts/launchpad/Distributor.sol](https://github.com/code-423n4/2025-08-gte-perps/blob/main/contracts/launchpad/Distributor.sol) | 123 | 
| [contracts/launchpad/LaunchToken.sol](https://github.com/code-423n4/2025-08-gte-perps/blob/main/contracts/launchpad/LaunchToken.sol) | 90 | 
| [contracts/launchpad/Launchpad.sol](https://github.com/code-423n4/2025-08-gte-perps/blob/main/contracts/launchpad/Launchpad.sol) | 356 | 
| [contracts/launchpad/LaunchpadLPVault.sol](https://github.com/code-423n4/2025-08-gte-perps/blob/main/contracts/launchpad/LaunchpadLPVault.sol) |17 |
| [contracts/launchpad/libraries/RewardsTracker.sol](https://github.com/code-423n4/2025-08-gte-perps/blob/main/contracts/launchpad/libraries/RewardsTracker.sol) | 147 |
| [contracts/launchpad/uniswap/GTELaunchpadV2Pair.sol](https://github.com/code-423n4/2025-08-gte-perps/blob/main/contracts/launchpad/uniswap/GTELaunchpadV2Pair.sol) | 236 | 
| [contracts/launchpad/uniswap/GTELaunchpadV2PairFactory.sol](https://github.com/code-423n4/2025-08-gte-perps/blob/main/contracts/launchpad/uniswap/GTELaunchpadV2PairFactory.sol) | 47 |
| [contracts/launchpad/uniswap/interfaces/IGTELaunchpadV2Pair.sol](https://github.com/code-423n4/2025-08-gte-perps/blob/main/contracts/launchpad/uniswap/interfaces/IGTELaunchpadV2Pair.sol) |  3 | 
| [contracts/launchpad/uniswap/interfaces/IUniswapV2Router01.sol](https://github.com/code-423n4/2025-08-gte-perps/blob/main/contracts/launchpad/uniswap/interfaces/IUniswapV2Router01.sol) |  3 | 
| **Totals** | **5260** |

*For a machine-readable version, please consult the [scope.txt](https://github.com/code-423n4/2025-08-gte-perps/blob/main/scope.txt) file*

### Files out of scope

| Filepaths         |
| ------------ |
| [contracts/account-manager/\*\*.\*\*](https://github.com/code-423n4/2025-08-gte-perps/tree/main/contracts/account-manager) |
| [contracts/clob/\*\*.\*\*](https://github.com/code-423n4/2025-08-gte-perps/tree/main/contracts/clob) |
| [contracts/launchpad/interfaces/\*\*.\*\*](https://github.com/code-423n4/2025-08-gte-perps/tree/main/contracts/launchpad/interfaces)  |
| [contracts/perps/interfaces/\*\*.\*\*](https://github.com/code-423n4/2025-08-gte-perps/tree/main/contracts/perps/interfaces) |
| [contracts/router/\*\*.\*\*](https://github.com/code-423n4/2025-08-gte-perps/tree/main/contracts/router) |
| [contracts/utils/\*\*.\*\*](https://github.com/code-423n4/2025-08-gte-perps/tree/main/contracts/utils) |
| [script/\*\*.\*\*](https://github.com/code-423n4/2025-08-gte-perps/tree/main/script) |
| [test/\*\*.\*\*](https://github.com/code-423n4/2025-08-gte-perps/tree/main/test) |

*For a machine-readable version, please consult the [out_of_scope.txt](https://github.com/code-423n4/2025-08-gte-perps/blob/main/out_of_scope.txt) file*


# Additional context

## Areas of concern (where to focus for bugs)

### Economical Vulnerabilities

Economical attacks (e.g. engaging large amounts of tokens to break the platform or profit from it) are considered a valid attack vector; we encourage Wardens to look out for ways to generate "bad debt", e.g. negative equity, in a way that would result in net-positive gains for the attacker, or make the platform illiquid. ADL (Auto-De-Leverage) abuses that result in monetary gains for the attacker as well as any attack that would result in loss of funds for other users, themselves or the Platform's funds, making it illiquid, are of particular interest to us. To note, fund loss of oneself must result from an inadvertent action to be considered a valid vulnerability and must not arise from deliberate misuse of the platform.

### Orderbook Denial-of-Service

The Orderbook should be able to process orders at all times; we invite the wardens to look for attacks that would result in a Denial Of Service (e.g. placing an order that cannot be cleared by the ClearingHouse), or that bypasses the limit of orders a user can place in one transaction.

## Main invariants

We define the PerpManager's USDC balance as:

$$
\sum^{total\_users}_{i=0}{user\_free\_collateral\_balance[i]} + \sum^{total\_users}_{i=0}{user\_margin\_balance[i]} + insurance\_fund\_balance
$$


This should always be equal to or less than the PerpManager's USDC Token balance.

## All trusted roles in the protocol

All administrative roles issued within the system are considered trusted and behaving within acceptable bounds.

A user that has been assigned as the operator of another is considered trusted.

| Role                                | Description                       |
| --------------------------------------- | ---------------------------- |
| `ADMIN_ROLE`                          | Can simulate any other role and has total rights over the system               |
| `LIQUIDATOR_ROLE`                             | Can liquidate, deleverage, and delist close through the `LiquidatorPanel`                      |
| `BACKSTOP_LIQUIDATOR_ROLE` | Can issue a backstop liquidation through the `LiquidatorPanel` |

## Running tests

The codebase utilizes the `forge` framework for compiling its contracts and executing tests coded in `Solidity`.

### Prerequisites

- `forge` (`1.2.3-stable` tested)

### Setup

Once the above prerequisite has been successfully installed, the following commands can be executed to setup the repository:

```bash!
git clone https://github.com/code-423n4/2025-08-gte-perps
cd 2025-08-gte-perps
```

### Tests

To run tests, the `forge test` command should be executed:

```bash! 
forge test
```

### Coverage

Coverage can be executed via the built-in `coverage` command of `forge` (IR minimum is required):

```bash! 
FOUNDRY_PROFILE=coverage forge coverage --ir-minimum --report lcov
```

| File | Coverage (Line / Function / Branch) |
| ---- | -------- |
| [contracts/perps/GTL.sol](https://github.com/code-423n4/2025-08-gte-perps/blob/main/contracts/perps/GTL.sol) | 93.6% / 97% / 60% | 
| [contracts/perps/PerpManager.sol](https://github.com/code-423n4/2025-08-gte-perps/blob/main/contracts/perps/PerpManager.sol) |  92.2% / 89.5% / 75% | 
| [contracts/perps/modules/AdminPanel.sol](https://github.com/code-423n4/2025-08-gte-perps/blob/main/contracts/perps/modules/AdminPanel.sol) |  86.2% / 90% / 32.7% | 
| [contracts/perps/modules/LiquidatorPanel.sol](https://github.com/code-423n4/2025-08-gte-perps/blob/main/contracts/perps/modules/LiquidatorPanel.sol) | 97% / 94.1% / 85.7% | 
| [contracts/perps/modules/ViewPort.sol](https://github.com/code-423n4/2025-08-gte-perps/blob/main/contracts/perps/modules/ViewPort.sol) | 74.1% / 74.6% / 100% | 
| [contracts/perps/types/BackstopLiquidatorDataLib.sol](https://github.com/code-423n4/2025-08-gte-perps/blob/main/contracts/perps/types/BackstopLiquidatorDataLib.sol) | 43.9% / 100% / 50% |
| [contracts/perps/types/Book.sol](https://github.com/code-423n4/2025-08-gte-perps/blob/main/contracts/perps/types/Book.sol) | 82% / 78.4% / 70% |
| [contracts/perps/types/CLOBLib.sol](https://github.com/code-423n4/2025-08-gte-perps/blob/main/contracts/perps/types/CLOBLib.sol) | 86.9% / 95.5% / 68.7% | 
| [contracts/perps/types/ClearingHouse.sol](https://github.com/code-423n4/2025-08-gte-perps/blob/main/contracts/perps/types/ClearingHouse.sol) | 96.2% / 94.1% / 87.1% | 
| [contracts/perps/types/CollateralManager.sol](https://github.com/code-423n4/2025-08-gte-perps/blob/main/contracts/perps/types/CollateralManager.sol) | 100% / 100% / 100% | 
| [contracts/perps/types/FeeManager.sol](https://github.com/code-423n4/2025-08-gte-perps/blob/main/contracts/perps/types/FeeManager.sol) | 83.3% / 80% / 100% | 
| [contracts/perps/types/FundingRateEngine.sol](https://github.com/code-423n4/2025-08-gte-perps/blob/main/contracts/perps/types/FundingRateEngine.sol) | 100% / 100% / 25% | 
| [contracts/perps/types/InsuranceFund.sol](https://github.com/code-423n4/2025-08-gte-perps/blob/main/contracts/perps/types/InsuranceFund.sol) | 88.9% / 80% / 0% |
| [contracts/perps/types/Market.sol](https://github.com/code-423n4/2025-08-gte-perps/blob/main/contracts/perps/types/Market.sol) | 94.2% / 96.1% / 91.4% | 
| [contracts/perps/types/Order.sol](https://github.com/code-423n4/2025-08-gte-perps/blob/main/contracts/perps/types/Order.sol) | 93.9% / 88.9% / 50% |
| [contracts/perps/types/PackedFeeRatesLib.sol](https://github.com/code-423n4/2025-08-gte-perps/blob/main/contracts/perps/types/PackedFeeRatesLib.sol) | 100% / 100% / 0% |
| [contracts/perps/types/Position.sol](https://github.com/code-423n4/2025-08-gte-perps/blob/main/contracts/perps/types/Position.sol) | 100% / 100% / 100% | 
| [contracts/perps/types/PriceHistory.sol](https://github.com/code-423n4/2025-08-gte-perps/blob/main/contracts/perps/types/PriceHistory.sol) | 58.5% / 60% / 50% |
| [contracts/perps/types/StorageLib.sol](https://github.com/code-423n4/2025-08-gte-perps/blob/main/contracts/perps/types/StorageLib.sol) | 58.8% / 87.5% / 100% |
| [contracts/launchpad/BondingCurves/SimpleBondingCurve.sol](https://github.com/code-423n4/2025-08-gte-perps/blob/main/contracts/launchpad/BondingCurves/SimpleBondingCurve.sol) | 85.7% / 81.8% / 50% | 
| [contracts/launchpad/Distributor.sol](https://github.com/code-423n4/2025-08-gte-perps/blob/main/contracts/launchpad/Distributor.sol) | 83.6% / 82.4% / 58.3% | 
| [contracts/launchpad/LaunchToken.sol](https://github.com/code-423n4/2025-08-gte-perps/blob/main/contracts/launchpad/LaunchToken.sol) | 85.7% / 75% / 40% | 
| [contracts/launchpad/Launchpad.sol](https://github.com/code-423n4/2025-08-gte-perps/blob/main/contracts/launchpad/Launchpad.sol) | 80.3% / 67.7% / 31.8% | 
| [contracts/launchpad/LaunchpadLPVault.sol](https://github.com/code-423n4/2025-08-gte-perps/blob/main/contracts/launchpad/LaunchpadLPVault.sol) |14.3% / 33.3% / 100% |
| [contracts/launchpad/libraries/RewardsTracker.sol](https://github.com/code-423n4/2025-08-gte-perps/blob/main/contracts/launchpad/libraries/RewardsTracker.sol) | 98.8% / 100% / 100% |
| [contracts/launchpad/uniswap/GTELaunchpadV2Pair.sol](https://github.com/code-423n4/2025-08-gte-perps/blob/main/contracts/launchpad/uniswap/GTELaunchpadV2Pair.sol) | 87.5% / 100% / 61.1% | 
| [contracts/launchpad/uniswap/GTELaunchpadV2PairFactory.sol](https://github.com/code-423n4/2025-08-gte-perps/blob/main/contracts/launchpad/uniswap/GTELaunchpadV2PairFactory.sol) | 82.1% / 80% / 80% |
| **Totals** | **83.24% / 86.14% / 65.43%** |

## Creating a PoC

The project is composed of two core systems; the perpetual CLOB system, and the Launchpad system. Within the codebase, we have introduced two test files (`PoCPerps.t.sol` & `PoCLaunchpad.t.sol`) under the `test/c4-poc` folder that sets up each system with mock implementations to allow PoCs to be constructed in a straightforward manner. 

Depending on where the vulnerability lies, Wardens should utilize the correct PoC file alongside the relevant storage entries (i.e. the `launchpad` in case a launchpad vulnerability is demonstrated etc.).

For a submission to be considered valid, the test case **should execute successfully** via the following command:

```bash 
forge test --match-test submissionValidity
```

PoCs meant to demonstrate a reverting transaction **must utilize the special `expect` utility functions `forge` exposes**. Failure to do so may result in an invalidation of the submission. 

## Miscellaneous

Employees of GTE and employees' family members are ineligible to participate in this audit.

Code4rena's rules cannot be overridden by the contents of this README. In case of doubt, please check with C4 staff.
