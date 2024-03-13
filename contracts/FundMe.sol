// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {priceConverter} from "./priceConverter.sol";

contract FundMe{

    using priceConverter for uint256;
    
    uint256 public miniumUsd = 1e18;

    uint256 public version;

    uint256 public priceToUsd;

    address[] public funders;


    mapping (address => uint256) public addressToAmountFunded;



    function fund() public payable {
        require(msg.value.getConversionRate() >= miniumUsd ,"1 USD at least is required");
        funders.push(msg.sender);
        version = priceConverter.getVersion();
        priceToUsd = priceConverter.getPrice();
        addressToAmountFunded[msg.sender] += msg.value;
    }

    // function withdraw() public {

    // }


    


}