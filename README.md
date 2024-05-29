# Types of Functions

## Introduction
This repository contains a simple Ethereum smart contract written in Solidity. The contract implements a basic ERC20 token functionality with three types of functions: `transfer`, `mint`, and `burn`. It also includes an additional option in the `transfer` function to specify the sender's address and in the `burn` function to specify the account from which tokens are burnt.

## Contract Details
- **Name:** MetaToken
- **Symbol:** META
- **Total Supply:** User-defined
- **Functions:**
  1. `transfer(address _from, address _to, uint256 _value)`: Transfer tokens from one address to another. The `_from` parameter allows specifying the sender's address.
  2. `mint(address _to, uint256 _value)`: Mint new tokens and add them to the specified address.
  3. `burn(address _from, uint256 _value)`: Burn tokens from the specified address.

## Author
- **Gamalliel Tamaca**

## License
This project is licensed under the [MIT License](LICENSE).
