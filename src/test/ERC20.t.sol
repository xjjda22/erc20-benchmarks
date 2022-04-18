// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.10;

import {DSTest} from "@ds-test/test.sol";

import {ERC20Mock} from "../mocks/ERC20Mock.sol";
import {console} from "../utils/Console.sol";


contract ERC20Test is DSTest {
    ERC20Mock m20;
    address alice = 0x000000000000000000636F6e736F6c652e6c6f67;
    address bob  = 0xd8dA6BF26964aF9D7eEd9e03E53415D37aA96045;

    function setUp() public {
        m20 = new ERC20Mock('ERC20MOCKBENCH','E20B', msg.sender, 1e18);
    }

    function testName() public {
        assertEq(m20.name(),'ERC20MOCKBENCH');
    }

    function testSymbol() public {
        assertEq(m20.symbol(),'E20B');
    }

    function testSupply() public {
        assertEq(m20.totalSupply(),1e18);
    }

    function testBalance() public {
        assertEq(m20.balanceOf(msg.sender), 0);
    }

    function testMint() public {
        assertEq(m20.balanceOf(alice), 0);
        m20.mint(alice, 100);
        assertGt(m20.balanceOf(alice), 0);
    }
}