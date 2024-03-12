// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract FundMe{

    uint256 public miniumUsd = 1e18;

    AggregatorV3Interface v3Interface;

    constructor(){
        v3Interface = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
    }
    


    function fund() public payable {
        require(getConversionRate(msg.value) >= miniumUsd ,"1 ETH at least is required");
    }

    // function withdraw() public {

    // }


    function getPrice() public view returns(uint256){
        (,int256 price,,,) = v3Interface.latestRoundData();
        // 8 after dot
        return uint256(price*1e10);
    }

    function getConversionRate(uint256 ethAmount) public view returns(uint256){
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
        return ethAmountInUsd; 
    }

    function getVersion() public view returns(uint256){
        return v3Interface.version();
    }


}