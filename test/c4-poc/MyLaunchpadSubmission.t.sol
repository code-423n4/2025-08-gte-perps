// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import {LaunchpadTestBase} from "./LaunchpadTestBase.sol";
import {Launchpad} from "contracts/launchpad/Launchpad.sol";
import {IDistributor} from "contracts/launchpad/interfaces/IDistributor.sol"; // sigs are visible via tests
import {ERC20Harness} from "test/harnesses/ERC20Harness.sol";

contract MyLaunchpadSubmission is Test, LaunchpadTestBase {
    // From LaunchpadTestBase:
    // address distributor;  IBondingCurveMinimal curve;  LaunchpadLPVault launchpadLPVault;
    // ERC20Harness quoteToken;  address token;  Launchpad launchpad;

    address attacker;

    function setUp() public override {
        LaunchpadTestBase.setUp(); // deploys launchpad, curve, vault, router, quoteToken, launches `token`
        attacker = makeAddr("attacker");

        // Give attacker quote (USDC-like) and approve Launchpad
        deal(address(quoteToken), attacker, 1_000_000e6); // adjust decimals to match ERC20Harness in tests
        vm.startPrank(attacker);
        quoteToken.approve(address(launchpad), type(uint256).max);
        vm.stopPrank();
    }

    /// Code4rena will pick this up thanks to "submissionValidity" in the name.
    function test_submissionValidity_Launchpad() public {
        // === Arrange: attacker sets price point on curve with a tiny buy (or none), then protocol adds rewards ===
        // 1) Attack step A: tiny stake credited just before rewards drip to capture rounding
        //    Only the LaunchToken contract may call increaseStake/decreaseStake.
        //    So we prank as `token` (the freshly launched asset) to emulate the legit path.
        vm.prank(token);
        launchpad.increaseStake(attacker, uint96(1)); // 1 wei of stake to try to anchor rounding

        // 2) Protocol/team drips rewards now (use the patterns you saw in Distributor.t.sol)
        //    Copy the exact function name/signature from their tests:
        //    e.g., IDistributor(distributor).addRewards(<pair or token>, <baseAmt>, <quoteAmt>);
        // TODO: fill targets/amounts using values consistent with Distributor tests
        // vm.prank(address(launchpad));  // or the correct authority seen in tests
        // IDistributor(distributor).addRewards(<target>, <bigRewardBase>, <bigRewardQuote>);

        // 3) Attack step B: attacker increases stake AFTER rewards were added (to try to capture more than fair)
        vm.prank(token);
        launchpad.increaseStake(attacker, uint96(1e18)); // large stake

        // 4) Simulate a block/time boundary if RewardsTracker is time-weighted
        // hint: vm.warp(block.timestamp + 1); // change as needed

        // 5) Attack step C: attacker exits (or partial exit) to realize a gain
        // vm.prank(token);
        // launchpad.decreaseStake(attacker, uint96( ... )); // copy signature from tests

        // 6) Compute attacker profit; assert a non-dust net gain repeatedly achievable.
        //    You can value base vs quote via launchpad.QUOTE/BASE quoting helpers seen in Launchpad.t.sol
        // uint256 attackerValue = <attacker balances summed in quote terms>;
        // assertGt(attackerValue, <initial value> + <meaningful delta>);

        assertTrue(true); // remove after you wire the asserts above
    }
}
