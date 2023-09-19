// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.13;

// Vendor
// solhint-disable-next-line no-console
import {console2} from "forge-std/console2.sol";
import {Script} from "forge-std/Script.sol";
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
 * @title Deploy Script
 */
contract DeployScript is Script, AppConstants {
    /* solhint-disable no-console */

    // =======
    // Storage
    // =======

    Installer public installerImplementation;
    Installer public installerEndpoint;

    AppDispatcher public dispatcher;

    DecrementCounter public decrementCounterImplementation;
    DecrementCounter public decrementCounterEndpoint;

    IncrementCounter public incrementCounterImplementation;
    IncrementCounter public incrementCounterEndpoint;

    // ===
    // Run
    // ===

    function run() external {
        vm.startBroadcast();

        installerImplementation = new Installer(
            IReflexModule.ModuleSettings({
                moduleId: _MODULE_ID_INSTALLER,
                moduleType: _MODULE_TYPE_SINGLE_ENDPOINT
            })
        );

        dispatcher = new AppDispatcher(
            msg.sender,
            address(installerImplementation)
        );

        installerEndpoint = Installer(
            dispatcher.getEndpoint(_MODULE_ID_INSTALLER)
        );

        decrementCounterImplementation = new DecrementCounter(
            IReflexModule.ModuleSettings({
                moduleId: _MODULE_ID_DECREMENT_COUNTER,
                moduleType: _MODULE_TYPE_SINGLE_ENDPOINT
            })
        );

        incrementCounterImplementation = new IncrementCounter(
            IReflexModule.ModuleSettings({
                moduleId: _MODULE_ID_INCREMENT_COUNTER,
                moduleType: _MODULE_TYPE_SINGLE_ENDPOINT
            })
        );

        address[] memory moduleAddresses = new address[](2);
        moduleAddresses[0] = address(decrementCounterImplementation);
        moduleAddresses[1] = address(incrementCounterImplementation);
        installerEndpoint.addModules(moduleAddresses);

        vm.stopBroadcast();

        decrementCounterEndpoint = DecrementCounter(
            dispatcher.getEndpoint(_MODULE_ID_DECREMENT_COUNTER)
        );
        incrementCounterEndpoint = IncrementCounter(
            dispatcher.getEndpoint(_MODULE_ID_INCREMENT_COUNTER)
        );

        console2.log("Dispatcher                      :", address(dispatcher));
        console2.log(
            "Installer implementation        :",
            address(installerImplementation)
        );
        console2.log(
            "Installer endpoint              :",
            address(installerEndpoint)
        );
        console2.log(
            "Decrement counter implementation:",
            address(decrementCounterImplementation)
        );
        console2.log(
            "Decrement counter endpoint      :",
            address(decrementCounterEndpoint)
        );
        console2.log(
            "Increment counter implementation:",
            address(incrementCounterImplementation)
        );
        console2.log(
            "Increment counter endpoint      :",
            address(incrementCounterEndpoint)
        );

        /* solhint-enable no-console */
    }
}
