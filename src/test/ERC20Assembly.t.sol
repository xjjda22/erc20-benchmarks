// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {Test, stdError} from "@forge-std/Test.sol";

import {ERC20AssemblyMock} from "../mocks/ERC20AssemblyMock.sol";
import {console} from "../utils/Console.sol";


contract ERC20AssemblyTest is Test {
    ERC20AssemblyMock m20;

    address initAcc;
    address aliceAcc = 0x000000000000000000636F6e736F6c652e6c6f67;
    address bobAcc  = 0xd8dA6BF26964aF9D7eEd9e03E53415D37aA96045;

    function setUp() public {
        // console.log('setUp', msg.sender);
        initialAccount = msg.sender;
        m20 = new ERC20AssemblyMock('ERC20MockAssemblyBENCH','E20AB', initAcc, 1e18);
        m20.approve(initAcc, 1e18);
        hoax(initAcc);
        m20.approve(aliceAcc, 1e18);
    }

    function testC() public {
        // console.log('testName', msg.sender);
        assertEq(m20.name(),'ERC20MockAssemblyBENCH');
        assertEq(m20.symbol(),'E20AB');
        assertEq(m20.totalSupply(),1e18);
    }

    function testAllowance() public {
        hoax(initAcc);
        assertEq(m20.allowance(initAcc, aliceAcc), 1000000);
    }

    function testMint() public {
        // console.log('testMint', msg.sender);
        m20.mint(msg.sender, 1000000);
        assertEq(m20.totalSupply(),1e18 + 1000000);
    }

    function testBurn() public {
        // console.log('testBurn', msg.sender);
        m20.mint(msg.sender, 1000000);
        m20.burn(msg.sender, 1000000);
        assertEq(m20.totalSupply(),1e18);
    }

    function testTransfer() public {
        // console.log('testTransfer', msg.sender);
        hoax(initAcc);
        m20.transfer(msg.sender, 1000000);
        assertEq(m20.balanceOf(initAcc), 1e18 - 1000000);
        assertEq(m20.balanceOf(msg.sender), 1000000);
    }

    function testTransferFrom() public {
        // console.log('testTransfer', msg.sender);
        hoax(aliceAcc);
        m20.transferFrom(initAcc, msg.sender, 1000000);
        assertEq(m20.balanceOf(initAcc), 1e18 - 1000000);
        assertEq(m20.balanceOf(msg.sender), 1000000);
    }

    function testMintFuzz(uint256 t) public {
        // console.log('testMintFuzz', msg.sender);
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