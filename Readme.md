# Cairo Lang

This repository hold the libs setup for starknet-foundry setup (for testing), scarb (for building), starkli (for declaring & deploying)

### Scarb.toml (basic)

```toml
[package]
name = "hello_starknet"
version = "0.1.0"

[[target.starknet-contract]]
sierra = true
# casm = true # needed for snforge

[dependencies]
snforge_std = { git = "https://github.com/foundry-rs/starknet-foundry", tag = "v0.7.1" }
starknet = ">=2.2.0"

[cairo]
sierra-replace-ids = true
```

### Protostar

```sh
# To declare the project
$ protostar init --minimal <Project_name>
$ protostar init <Project_name>
```

### Scarb

```sh
# To declare a project
$ scarb init
# To build a project
$ scarb build
# To run the scarb
$ scarb cairo-run
```

### Foundry

```sh
# installation in existing scarb project
$ scarb add snforge_std  --git https://github.com/foundry-rs/starknet-foundry.git  --tag v0.7.1

# To run test :

$ snforge test
```

Essential option (Scarb.toml) for running `snforge` test :

```toml
.......
[[target.starknet-contract]]
casm = true
.......
```

### Starkli

- Setup

```sh
$ export STARKNET_ACCOUNT=~/.starkli-wallets/deployer/account.json
$ export STARKNET_KEYSTORE=~/.starkli-wallets/deployer/keystore.json
$ export STARKNET_RPC=https://starknet-goerli.infura.io/v3/<API_KEY>
```

- Setting up the account

```sh
# Setting up the wallet
$ starkli signer keystore from-key ~/.starkli-wallets/deployer/keystore.json

# O/P
Enter private key: <Enter_wallet_priv_key>
Enter password: <Setup_up_wallet_passkey>
Created new encrypted keystore file: /home/<user>/.starkli-wallets/deployer/keystore.json
Public key: <Wallet_key_will_be_shown_here>

# Fetching up the wallet config
$ starkli account fetch <YOUR_WALLET_ADDRESS> --output ~/.starkli-wallets/deployer/account.json
```

- Declaring & Deploying the smart contract

```sh
$ starkli declare target/dev/hello_starknet_Storage.contract_class.json

# O/P
Class hash:
0x05f0a5f0f8e14fba4c282c50a2b4e81393ce5e0812b1619542f5aa461d411219

$ starkli deploy <CLASS_HASH_DECLARED>
```

### Contract Details (Deployed)

```sh
Class Hash : 0x05f0a5f0f8e14fba4c282c50a2b4e81393ce5e0812b1619542f5aa461d411219

Contract Address : 0x0729c749170c14a07f25034a79962a7377b73fc3e9b68f580e3d35371c965a3c

Voyager Link : https://goerli.voyager.online/contract/0x0729c749170c14a07f25034a79962a7377b73fc3e9b68f580e3d35371c965a3c#transactions
```

### Resources :

- https://docs.starknet.io/documentation/quick_start/deploy_a_smart_contract/
- https://docs.starknet.io/documentation/quick_start/environment_setup/
- https://docs.swmansion.com/scarb/
- https://book.cairo-lang.org/ch00-00-introduction.html
- https://docs.swmansion.com/protostar/docs/cairo-1/introduction
- https://medium.com/starknet-edu/starkli-the-new-starknet-cli-86ea914a2933
- https://foundry-rs.github.io/starknet-foundry/
- https://github.com/shramee/starklings-cairo1
