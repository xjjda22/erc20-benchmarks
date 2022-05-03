// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@solmate/tokens/ERC20.sol";

// mock class using solmate ERC20
contract ERC20SolMock is ERC20 {
    constructor(
        string memory _name,
        string memory _symbol,
        uint8 _decimals,
        address initialAccount,
        uint256 initialBalance
    ) ERC20(_name, _symbol, _decimals) {
        _mint(initialAccount, initialBalance);
    }

    function mint(address to, uint256 value) public virtual {
        _mint(to, value);
    }

    function burn(address from, uint256 value) public virtual {
        _burn(from, value);
    }
}