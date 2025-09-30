// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Counter {

    error NumberTooSmall(int256 value);
    
    function add(uint256 a, uint256 b) public pure returns (uint256) {
        uint256 result;
        assembly {
            result := add(a, b)
        }
        return result;
    }

    function sub(uint256 a, uint256 b) public pure returns (uint256) {
        if (a < b) {
            revert NumberTooSmall(int256(b));
        }
        uint256 result;
        assembly {
            result := sub(a, b)
        }
        return result;
    }

    function mul(uint256 a, uint256 b) public pure returns (uint256) {
        uint256 result;
        assembly {
            result := mul(a, b)
        }
        return result;
    }

    function div(uint256 a, uint256 b) public pure returns (uint256) {
        if (b == 0) {
            revert NumberTooSmall(int256(b));
        }
        uint256 result;
        assembly {
            result := div(a, b)
        }
        return result;
    }
}
