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
Implementation | 1000000 | 1000000**5 | 1000000**10
--- | --- | --- | --- 
erc20-openzeppelin | 37204 | 37193 | 37217
erc20-assembly | 0 | 0 | 0 

burn
Implementation | 1000000 | 1000000**5 | 1000000**10
--- | --- | --- | --- 
erc20-openzeppelin | 24392 | 24325 | 24398
erc20-assembly | 0 | 0 | 0 

transfer
Implementation | 1000000 | 1000000**5 | 1000000**10
--- | --- | --- | --- 
erc20-openzeppelin | 43140 | 43163 | 43197
erc20-assembly | 0 | 0 | 0 

transferFrom
Implementation | 1000000 | 1000000**5 | 1000000**10
--- | --- | --- | --- 
erc20-openzeppelin | 52641 | 52695 | 52698
erc20-assembly | 0 | 0 | 0 