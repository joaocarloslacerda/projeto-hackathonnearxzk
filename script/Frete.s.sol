// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {Frete} from "../src/Frete.sol";

contract CounterScript is Script {
    Frete public frete;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        frete = new Frete();

        vm.stopBroadcast();
    }
}
