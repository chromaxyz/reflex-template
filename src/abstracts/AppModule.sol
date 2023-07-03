// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.13;

// Vendor
import {ReflexModule} from "reflex/ReflexModule.sol";

// Abstracts
import {AppState} from "./AppState.sol";

/**
 * @title App Module
 */
abstract contract AppModule is ReflexModule, AppState {
    // ===========
    // Constructor
    // ===========

    /**
     * @param moduleSettings_ Module settings.
     */
    constructor(ModuleSettings memory moduleSettings_) ReflexModule(moduleSettings_) {}
}
