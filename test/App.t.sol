// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

// Vendor
import {Test} from "forge-std/Test.sol";
import {IReflexModule} from "reflex/interfaces/IReflexModule.sol";

// Abstracts
import {AppConstants} from "../src/abstracts/AppConstants.sol";

// Modules
import {DecrementCounter} from "../src/modules/DecrementCounter.sol";
import {IncrementCounter} from "../src/modules/IncrementCounter.sol";
import {Installer} from "../src/modules/Installer.sol";

// Sources
import {AppDispatcher} from "../src/AppDispatcher.sol";

/**
 * @title App Test
 */
contract AppTest is Test, AppConstants {
    // =======
    // Storage
    // =======

    Installer public installer;
    Installer public installerEndpoint;

    AppDispatcher public dispatcher;

    DecrementCounter public decrementCounter;
    DecrementCounter public decrementCounterEndpoint;

    IncrementCounter public incrementCounter;
    IncrementCounter public incrementCounterEndpoint;

    function setUp() public {
        // Set up installer module.
        installer = new Installer(
            IReflexModule.ModuleSettings({
                moduleId: _MODULE_ID_INSTALLER,
                moduleType: _MODULE_TYPE_SINGLE_ENDPOINT
            })
        );

        // Set up decrement counter module.
        decrementCounter = new DecrementCounter(
            IReflexModule.ModuleSettings({
                moduleId: _MODULE_ID_DECREMENT_COUNTER,
                moduleType: _MODULE_TYPE_SINGLE_ENDPOINT
            })
        );

        // Set up increment counter module.
        incrementCounter = new IncrementCounter(
            IReflexModule.ModuleSettings({
                moduleId: _MODULE_ID_INCREMENT_COUNTER,
                moduleType: _MODULE_TYPE_SINGLE_ENDPOINT
            })
        );

        // Set up dispatcher.
        dispatcher = new AppDispatcher(address(this), address(installer));

        // Fetch installer endpoint.
        installerEndpoint = Installer(
            dispatcher.getEndpoint(_MODULE_ID_INSTALLER)
        );

        // Install modules.
        address[] memory moduleAddresses = new address[](2);
        moduleAddresses[0] = address(decrementCounter);
        moduleAddresses[1] = address(incrementCounter);
        installerEndpoint.addModules(moduleAddresses);

        // Fetch decrement counter endpoint.
        decrementCounterEndpoint = DecrementCounter(
            dispatcher.getEndpoint(_MODULE_ID_DECREMENT_COUNTER)
        );

        // Fetch increment counter endpoint.
        incrementCounterEndpoint = IncrementCounter(
            dispatcher.getEndpoint(_MODULE_ID_INCREMENT_COUNTER)
        );
    }

    function testUnitCounterIncrementDecrement() public {
        // Increment counter.
        incrementCounterEndpoint.increment();

        // Assert counter value.
        assertEq(incrementCounterEndpoint.count(), 1);
        assertEq(decrementCounterEndpoint.count(), 1);

        // Decrement counter.
        decrementCounterEndpoint.decrement();

        // Assert counter value.
        assertEq(incrementCounterEndpoint.count(), 0);
        assertEq(decrementCounterEndpoint.count(), 0);
    }
}
