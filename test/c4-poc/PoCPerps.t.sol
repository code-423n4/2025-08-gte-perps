// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {PerpManagerTestBase} from "../perps/PerpManagerTestBase.sol";

contract PoCPerps is PerpManagerTestBase {
    /**
     * PoC can utilize the following variables to access the relevant contracts:
     * ================PERPETUAL================
     * - factory: ERC1967Factory.sol 
     * - perpManager: MockPerpManager.sol (extends PerpManager.sol)
     * - gtl: GTL.sol 
     * - usdc: Test USDC within perpetual system
     * - ETH, GTE, BTC: Tickers for markets created
     */
    function test_submissionValidity() external {
    }
}
