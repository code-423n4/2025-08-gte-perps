// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.27;

import "forge-std/Test.sol";
import {PerpManagerTestBase} from "../perps/PerpManagerTestBase.sol";

contract MyPerpsSubmission is Test, PerpManagerTestBase {
    function setUp() public override {
        PerpManagerTestBase.setUp(); // deploys markets + mocks from the repo harness
        // TODO: if a market needs activation, call the same helper they use in e2e tests.
    }

    // Code4rena sees this because of "submissionValidity" in the name.
    function test_submissionValidity_MyPerps() public {
        address alice = makeAddr("alice");
        address bob   = makeAddr("bob");

        // === Arrange: give both margin & open opposed positions
        // Use harness helpers the same way e2e tests do (copy from PerpPostFillOrder_*.t.sol).
        // e.g., deposit margin, then have alice long and bob short at close prices.

        // === Time edge: drive funding/mark windows at exact boundary
        // 1) vm.warp(lastFundingTime + fundingInterval - 1) ; update mark/price history (no settle)
        // 2) vm.warp(block.timestamp + 1) ; immediately settle funding or match order; recompute mark
        // Try to create:
        //  - over/under-charged funding
        //  - a liquidation threshold crossed due to rounding
        //  - or a state that can't be cleared by ClearingHouse (DoS)

        // === Assert: net-positive extraction or invariant break
        // int256 upnlAlice = ...;  uint256 usdcBal = ...; (copy accessor patterns from PerpMiscGetters.t.sol)
        // assertGt(<attacker wealth>, <initial wealth> + MEANINGFUL_DELTA);
        // or vm.expectRevert(<specific>) around a DoS path, but ensure it blocks matching beyond a single tx.

        assertTrue(true); // remove once assertions are wired
    }
}

