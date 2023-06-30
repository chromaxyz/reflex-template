// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.13;

// Vendor
import {ReflexBase} from "reflex/ReflexBase.sol";

// Abstracts
import {AppState} from "./AppState.sol";

/**
 * @title App Base
 */
abstract contract AppBase is ReflexBase, AppState {}
