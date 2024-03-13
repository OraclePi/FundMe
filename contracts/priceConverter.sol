// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";


library priceConverter{

    function getPrice() internal view returns(uint256){
        AggregatorV3Interface v3Interface = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (,int256 price,,,) = v3Interface.latestRoundData();
        // 8 after dot
        return uint256(price*1e10);
    }

    function getConversionRate(uint256 ethAmount) internal view returns(uint256){
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
        return ethAmountInUsd; 
    }

    function getVersion() internal view returns(uint256){
        AggregatorV3Interface v3Interface = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        return v3Interface.version();
    }

}