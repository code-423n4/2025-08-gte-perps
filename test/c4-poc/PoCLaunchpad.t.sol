// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {LaunchpadTestBase} from "./LaunchpadTestBase.sol";

contract PoCLaunchpad is LaunchpadTestBase {
    /**
     * PoC can utilize the following variables to access the relevant contracts:
     * - factory: ERC1967Factory.sol 
     * - launchpad: Launchpad.sol
     * - distributor: Distributor.sol
     * - curve: SimpleBondingCurve.sol
     * - launchpadLPVault: LaunchpadLPVault.sol
     * - quoteToken: Quote token used in Launchpad system
     * - uniV2Router: Uniswap V2 Router used in Launchpad system
     */
    function test_submissionValidity() external {
    }
}
