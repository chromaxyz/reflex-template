// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.13;

// Vendor
import {ReflexInstaller} from "reflex/ReflexInstaller.sol";

// Abstracts
import {AppModule} from "../abstracts/AppModule.sol";

/**
 * @title Installer
 */
contract Installer is ReflexInstaller, AppModule {
    // ===========
    // Constructor
    // ===========

    /**
     * @param moduleSettings_ Module settings.
     */
    constructor(ModuleSettings memory moduleSettings_) AppModule(moduleSettings_) {}
}
