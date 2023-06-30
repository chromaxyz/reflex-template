// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.13;

// Vendor
import {ReflexState} from "reflex/ReflexState.sol";

// Abstracts
import {Constants} from "./Constants.sol";

/**
 * @title State
 */
abstract contract State is ReflexState, Constants {
    // =========
    // Constants
    // =========

    /**
     * @dev `bytes32(uint256(keccak256("_APP_STORAGE")) - 1)`
     * A `-1` offset is added so the preimage of the hash cannot be known,
     * reducing the chances of a possible attack.
     */
    bytes32 internal constant _APP_STORAGE_SLOT = 0xe6cc852b4ee6f692329c8a9e2fb5590fb9bbd220b459ee4ba88f9b97ed38d574;

    // =======
    // Storage
    // =======

    /**
     * @dev Append-only extendable.
     */
    struct AppStorage {
        uint256 counter;
    }

    // ================
    // Internal methods
    // ================

    /**
     * @dev Get the App storage pointer.
     * @return storage_ Pointer to the App storage state.
     */
    // solhint-disable-next-line func-name-mixedcase
    function _APP_STORAGE() internal pure returns (AppStorage storage storage_) {
        assembly {
            storage_.slot := _APP_STORAGE_SLOT
        }
    }
}