# erc20 benchmarks

# 🛠 Quick Start
Prerequisites: 
- Rust https://sourabhbajaj.com/mac-setup/Rust/
- Foundry https://github.com/foundry-rs/foundry

# Building and Testing
```bash
forge build
forge test 
forge snapshot

# logs and gas reports
# forge test -vv --gas-report

# forking from existing state
# forge test -f http://127.0.0.1:8545 -vvv

# To access the debugger
# forge run --debug src/test/Contract.t.sol --sig "testExample()"
```
# Reference
https://book.getfoundry.sh/forge/tests.html

# Benchmarks
Benchmarks are separated by method. Check the description of each table.

mint
Implementation | 1000 | 1e20 | 1e75
--- | --- | --- | --- 
openzeppelin | 37191 | 37159 | 37182
erc20-assembly | 0 | 0 | 0 