// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

// Vendor
import {ReflexConstants} from "reflex/ReflexConstants.sol";

/**
 * @title App Constants
 */
abstract contract AppConstants is ReflexConstants {
    // =======
    // Modules
    // =======

    uint32 internal constant _MODULE_ID_DECREMENT_COUNTER = 2;
    uint32 internal constant _MODULE_ID_INCREMENT_COUNTER = 3;
}
