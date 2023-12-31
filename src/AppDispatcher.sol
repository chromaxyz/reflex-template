// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.13;

// Vendor
import {ReflexDispatcher} from "reflex/ReflexDispatcher.sol";

// Abstracts
import {AppState} from "./abstracts/AppState.sol";

/**
 * @title App Dispatcher
 */
contract AppDispatcher is ReflexDispatcher, AppState {
    // ===========
    // Constructor
    // ===========

    /**
     * @param owner_ Protocol owner.
     * @param installerModule_ Installer module address.
     */
    constructor(address owner_, address installerModule_) ReflexDispatcher(owner_, installerModule_) {}
}
