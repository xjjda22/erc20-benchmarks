// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.10;

import {DSTest} from "@ds-test/test.sol";

import {ERC20Mock} from "../mocks/ERC20Mock.sol";
import {console} from "../utils/Console.sol";


contract ERC20Test is DSTest {
    ERC20Mock m20;
    address initialAccount;
    address alice = 0x000000000000000000636F6e736F6c652e6c6f67;
    address bob  = 0xd8dA6BF26964aF9D7eEd9e03E53415D37aA96045;

    function setUp() public {
        console.log('setUp',msg.sender);
        initialAccount = msg.sender;
        m20 = new ERC20Mock('ERC20MOCKBENCH','E20B', msg.sender, 1e18);
    }

    function testName() public {
        console.log('testName',msg.sender);
        assertEq(m20.name(),'ERC20MOCKBENCH');
    }

    function testSymbol() public {
        console.log('testSymbol',msg.sender);
        assertEq(m20.symbol(),'E20B');
    }

    function testSupply() public {
        console.log('testSupply',msg.sender);
        assertEq(m20.totalSupply(),1e18);
    }

    function testBalance() public {
        console.log('testBalance',msg.sender);
        assertEq(m20.balanceOf(initialAccount), 1e18);
    }

    function testMintAlice() public {
        console.log('testMint',msg.sender);
        assertEq(m20.balanceOf(alice), 0);
        m20.mint(alice, 100);
        assertGt(m20.balanceOf(alice), 99);
    }

    function testMintBob() public {
        console.log('testMint',msg.sender);
        assertEq(m20.balanceOf(bob), 0);
        m20.mint(bob, 10000);
        assertEq(m20.balanceOf(bob), 10000);
    }
}