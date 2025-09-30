// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Counter} from "../src/Counter.sol";

contract CounterTest is Test {
    Counter public counter;

    function setUp() public {
        counter = new Counter();
    }

    function testAdd() public view {
        uint256 a = 10;
        uint256 b = 5;
        uint256 result = counter.add(a, b);
        assertEq(result, 15);
    }
    
    function testSub() public view {
        uint256 a = 10;
        uint256 b = 5;
        uint256 result = counter.sub(a, b);
        assertEq(result, 5);
    }
    
    function testSubFail() public {
        uint256 a = 5;
        uint256 b = 10;
        vm.expectRevert(abi.encodeWithSelector(Counter.NumberTooSmall.selector, int256(b)));
        counter.sub(a, b);
    }

    function testMul() public view {
        uint256 a = 10;
        uint256 b = 5;
        uint256 result = counter.mul(a, b);
        assertEq(result, 50);
    }
    function testDiv() public view {
        uint256 a = 10;
        uint256 b = 5;
        uint256 result = counter.div(a, b);
        assertEq(result, 2);
    }
    function testDivByZero() public {
        uint256 a = 10;
        uint256 b = 0;
        vm.expectRevert(abi.encodeWithSelector(Counter.NumberTooSmall.selector, int256(b)));
        counter.div(a, b);
    }
}
