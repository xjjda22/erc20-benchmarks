// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {Test, stdError} from "@forge-std/Test.sol";

import {ERC20AssemblyMock} from "../mocks/ERC20AssemblyMock.sol";
import {console} from "../utils/Console.sol";


contract ERC20AssemblyTest is Test {
    ERC20AssemblyMock m20;

    address initialAccount;
    address alice = 0x000000000000000000636F6e736F6c652e6c6f67;
    address bob  = 0xd8dA6BF26964aF9D7eEd9e03E53415D37aA96045;

    function setUp() public {
        // console.log('setUp', msg.sender);
        initialAccount = msg.sender;
        m20 = new ERC20AssemblyMock('ERC20MockAssemblyBENCH','E20AB', initialAccount, 1e18);
    }

    function testName() public {
        // console.log('testName', msg.sender);
        assertEq(m20.name(),'ERC20MockAssemblyBENCH');
    }

    function testSymbol() public {
        // console.log('testSymbol', msg.sender);
        assertEq(m20.symbol(),'E20AB');
    }

    function testSupply() public {
        // console.log('testSupply', msg.sender);
        assertEq(m20.totalSupply(),1e18);
    }

    function testBalance() public {
        // console.log('testBalance', msg.sender);
        assertEq(m20.balanceOf(initialAccount), 1e18);
    }

    function testMint() public {
        // console.log('testMint', msg.sender);
        // console.log('testMint 1e18', m20.totalSupply());
        m20.mint(msg.sender, 1000000);
        // console.log('testMint 1e18 + 1000000', m20.totalSupply());
        assertEq(m20.totalSupply(),1e18 + 1000000);
    }

    function testBurn() public {
        // console.log('testBurn', msg.sender);
        // console.log('testBurn 1e18', m20.totalSupply());
        m20.mint(msg.sender, 1000000);
        // console.log('testBurn 1e18 + 1000000', m20.totalSupply());
        m20.burn(initialAccount, 1000000);
        // console.log('testBurn 1e18 - 1000000', m20.totalSupply());
        assertEq(m20.totalSupply(),1e18);
    }

    function testMintFuzz(uint256 t) public {
        // console.log('testMintFuzz', msg.sender);
        // console.log('testMintFuzz', t, m20.totalSupply());
        if(t > type(uint256).max - 1e18) {
            // totalSupply would overflow here
            vm.expectRevert(stdError.arithmeticError);
            m20.mint(msg.sender, t);
            return;
        } 
        m20.mint(msg.sender, t);
        assertLt(t,m20.totalSupply());
    }

    function testMintFail() public {
        uint256 t = type(uint256).max;
        // console.log('testMintFail', msg.sender);
        // console.log('testMintFail', t, m20.totalSupply());
        
        vm.expectRevert(stdError.arithmeticError);
        m20.mint(msg.sender, t);
    }

    function testMint1000() public {
        // console.log('testMint1000', msg.sender);
        assertEq(m20.balanceOf(msg.sender), 0);
        m20.mint(msg.sender, 1000);
        assertEq(m20.balanceOf(msg.sender), 1000);
    }

    function testMint1000_10() public {
        // console.log('testMint1000_10', msg.sender);
        assertEq(m20.balanceOf(msg.sender), 0);
        m20.mint(msg.sender, 1000**10);
        assertEq(m20.balanceOf(msg.sender), 1000**10);
    }

    function testMint1000_20() public {
        // console.log('testMint1000_20', msg.sender);
        assertEq(m20.balanceOf(msg.sender), 0);
        m20.mint(msg.sender, 1000**20);
        assertEq(m20.balanceOf(msg.sender), 1000**20);
    }
}