// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.13;

// Abstracts
import {AppModule} from "../abstracts/AppModule.sol";

/**
 * @title Decrement Counter
 */
contract DecrementCounter is AppModule {
    // ===========
    // Constructor
    // ===========

    /**
     * @param moduleSettings_ Module settings.
     */
    constructor(ModuleSettings memory moduleSettings_) AppModule(moduleSettings_) {}

    // ============
    // View methods
    // ============

    function count() external view returns (uint256) {
        return _APP_STORAGE().counter;
    }

    // ==============
    // Public methods
    // ==============

    /**
     * @notice Decrement the counter.
     */
    function decrement() external {
        _APP_STORAGE().counter -= 1;
    }
}
