// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {FundMe} from "../src/fundMe.sol";
import {HelperConfig} from "./HelperConfig.s.sol";

contract DeployFundMe is Script {
    function run() external returns (FundMe fundMe) {
        HelperConfig helperConfig = new HelperConfig();
        address ethUsdPrice = helperConfig.activeNetworkConfig();
        vm.startBroadcast();
        fundMe = new FundMe(ethUsdPrice);
        vm.stopBroadcast();
    }
}
