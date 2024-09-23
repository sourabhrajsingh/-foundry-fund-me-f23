//SPDX-License-Identifier:MIT

pragma solidity ^0.8.18;

import {Script, console} from "forge-std/Script.sol";
import {FundMe} from "../src/fundMe.sol";
import {DevOpsTools} from "foundry-devops/src/DevOpsTools.sol";

contract FundFundMe is Script {
    uint256 constant SEND_VALUE = 0.1 ether;

    /* function fundFundMe(address mostRecentDeployed) public {
        vm.startBroadcast();
        FundMe(payable(mostRecentDeployed)).fund{value: SEND_VALUE}();
        vm.stopBroadcast();
        console.log("Funded FundMe with %s", SEND_VALUE);
        }*/

    function run() external {
        address mostRecentDeployed = DevOpsTools.get_most_recent_deployment(
            "FundMe",
            block.chainid,
            "./broadcast"
        );
        /*fundFundMe(mostRecentDeployed);*/
        vm.startBroadcast();
        FundMe(payable(mostRecentDeployed)).fund{value: SEND_VALUE}();
        vm.stopBroadcast();
        console.log("Funded FundMe with %s", SEND_VALUE);
    }
}

contract WithdrawFundMe is Script {
    function run() external {
        address mostRecentDeployed = DevOpsTools.get_most_recent_deployment(
            "FundMe",
            block.chainid
        );

        vm.startBroadcast();
        FundMe(payable(mostRecentDeployed)).withdraw();
        vm.stopBroadcast();
        console.log("Withdraw from FundMe to Owner");
    }
}
