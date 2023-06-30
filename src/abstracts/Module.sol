// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.13;

// Vendor
import {ReflexModule} from "reflex/ReflexModule.sol";

// Abstracts
import {State} from "./State.sol";

abstract contract Module is ReflexModule, State {
    // ===========
    // Constructor
    // ===========

    /**
     * @param moduleSettings_ Module settings.
     */
    constructor(ModuleSettings memory moduleSettings_) ReflexModule(moduleSettings_) {}
}