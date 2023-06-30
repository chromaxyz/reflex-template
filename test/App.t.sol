// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

// Vendor
import {Test} from "forge-std/Test.sol";
import {IReflexModule} from "reflex/interfaces/IReflexModule.sol";

// Abstracts
import {Constants} from "../src/abstracts/Constants.sol";

// Modules
import {Counter} from "../src/modules/Counter.sol";
import {Installer} from "../src/modules/Installer.sol";

// Sources
import {Dispatcher} from "../src/Dispatcher.sol";

/**
 * @title App Test
 */
contract AppTest is Test, Constants {
    // =======
    // Storage
    // =======

    Installer public installer;
    Installer public installerEndpoint;

    Dispatcher public dispatcher;

    Counter public counter;
    Counter public counterEndpoint;

    function setUp() public {
        // Set up installer module.
        installer = new Installer(
            IReflexModule.ModuleSettings({
                moduleId: _MODULE_ID_INSTALLER,
                moduleType: _MODULE_TYPE_SINGLE_ENDPOINT,
                moduleVersion: 1,
                moduleUpgradeable: true
            })
        );

        // Set up counter module.
        counter = new Counter(
            IReflexModule.ModuleSettings({
                moduleId: _MODULE_ID_COUNTER,
                moduleType: _MODULE_TYPE_SINGLE_ENDPOINT,
                moduleVersion: 1,
                moduleUpgradeable: true
            })
        );

        // Set up dispatcher.
        dispatcher = new Dispatcher(address(this), address(installer));

        // Fetch installer endpoint.
        installerEndpoint = Installer(dispatcher.getEndpoint(_MODULE_ID_INSTALLER));

        // Install modules.
        address[] memory moduleAddresses = new address[](1);
        moduleAddresses[0] = address(counter);
        installerEndpoint.addModules(moduleAddresses);

        // Fetch counter endpoint
        counterEndpoint = Counter(dispatcher.getEndpoint(_MODULE_ID_COUNTER));
    }

    function testUnitCounterIncrementDecrement() public {
        // Increment counter.
        counterEndpoint.increment();

        // Assert counter value.
        assertEq(counterEndpoint.count(), 1);

        // Decrement counter.
        counterEndpoint.decrement();

        // Assert counter value.
        assertEq(counterEndpoint.count(), 0);
    }

    function testFuzzCounterSetNumber(uint256 number_) public {
        // Set number.
        counterEndpoint.setNumber(number_);

        // Assert counter value.
        assertEq(counterEndpoint.count(), number_);
    }
}
