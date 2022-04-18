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

# forking from existing state
# -vvv = very very verbose
# forge test -f http://127.0.0.1:8545 -vvv

# To access the debugger
# forge run --debug src/test/Contract.t.sol --sig "testExample()"
```

# Benchmarks
Benchmarks are separated by method. Check the description of each table.

mint
Implementation | 1 | 2 | 3 
--- | --- | --- | --- 
openzeppelin | 0 | 0 | 0 
assembly-erc20 | 0 | 0 | 0 