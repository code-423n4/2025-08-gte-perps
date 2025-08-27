// SPDX-License-Identifier: MIT
pragma solidity 0.8.27;

library Constants {
    // ADDRESSES
    address constant USDC = 0xE9b6e75C243B6100ffcb1c66e8f78F96FeeA727F;
    address constant GTL = 0x037eDa3aDB1198021A9b2e88C22B464fD38db3f3;
    // ROLES
    uint256 constant ADMIN_ROLE = 1 << 7;
    uint256 constant KEEPER_ROLE = 1 << 6;
    uint256 constant LIQUIDATOR_ROLE = 1 << 5;
    uint256 constant BACKSTOP_LIQUIDATOR_ROLE = 1 << 4;
}
