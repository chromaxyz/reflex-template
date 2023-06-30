// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.13;

// Vendor
import {ReflexBase} from "reflex/ReflexBase.sol";
import {ReflexDispatcher} from "reflex/ReflexDispatcher.sol";

// Abstracts
import {AppBase} from "./abstracts/AppBase.sol";

/**
 * @title App Dispatcher
 */
contract AppDispatcher is ReflexDispatcher, AppBase {
    // ===========
    // Constructor
    // ===========

    /**
     * @param owner_ Protocol owner.
     * @param installerModule_ Installer module address.
     */
    constructor(address owner_, address installerModule_) ReflexDispatcher(owner_, installerModule_) {}

    // =========
    // Overrides
    // =========

    function _getEndpointCreationCode(uint32 moduleId_)
        internal
        virtual
        override(ReflexDispatcher, ReflexBase)
        returns (bytes memory)
    {
        return super._getEndpointCreationCode(moduleId_);
    }
}
