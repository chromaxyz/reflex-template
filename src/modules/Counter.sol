// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.13;

// Abstracts
import {Module} from "../abstracts/Module.sol";

/**
 * @title Counter
 */
contract Counter is Module {
    // ===========
    // Constructor
    // ===========

    /**
     * @param moduleSettings_ Module settings.
     */
    constructor(ModuleSettings memory moduleSettings_) Module(moduleSettings_) {}

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
     * @notice Increment the counter.
     */
     function increment() external {
        _APP_STORAGE().counter += 1;
    }

    /**
     * @notice Decrement the counter.
     */
    function decrement() external {
        _APP_STORAGE().counter -= 1;
    }

    /**
     * @notice Set the counter.
     * @param number_ Counter number.
     */
    function setNumber(uint256 number_) external {
        _APP_STORAGE().counter = number_;
    }
}