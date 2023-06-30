// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.13;

// Vendor
import {ReflexInstaller} from "reflex/ReflexInstaller.sol";

// Abstracts
import {Module} from "../abstracts/Module.sol";

/**
 * @title Installer
 */
contract Installer is ReflexInstaller, Module {
    // ===========
    // Constructor
    // ===========

    /**
     * @param moduleSettings_ Module settings.
     */
    constructor(ModuleSettings memory moduleSettings_) Module(moduleSettings_) {}
}
