# NoteBoard dApp - MG3012 Assignment 2

A small decentralized app: a Solidity smart contract on the **Sepolia testnet** plus a single-page HTML/CSS/JS frontend that talks to it through **MetaMask** and **ethers.js**.

**Student:** SHAYAN HAYAT, I245618
**Contract address (Sepolia):** `0x8370231dc1695928e64c5276da27514b3f84a683`
**Etherscan:** https://sepolia.etherscan.io/address/0x8370231dc1695928e64c5276da27514b3f84a683

## What it does
Anyone can post a short note (max 140 characters) and like other people's notes. All data lives on the blockchain.

## Smart contract functions
| Function | Type | Purpose |
|---|---|---|
| `postNote(string)` | write | Adds a new note |
| `likeNote(uint256)` | write | Adds a like to a note |
| `getTotalNotes()` | read | Number of notes |
| `getNote(uint256)` | read | Author, text, likes, time of a note |

## Setup
1. Install MetaMask, switch to Sepolia, get test ETH from a faucet.
2. Open [Remix](https://remix.ethereum.org), paste `SmartContract.sol`, compile (0.8.20+).
3. Deploy tab -> Environment: *Injected Provider - MetaMask* -> Deploy -> confirm.
4. Copy the deployed address and paste it into `CONTRACT_ADDRESS` in `index.html` (and above in this README).
5. Open `index.html` (best via VS Code *Live Server* or `python -m http.server`, since MetaMask can be unreliable on `file://`).
6. Click **Connect MetaMask**, post a note, like a note.

## Screenshots
See the `screenshots/` folder:
1. `1_deployment.png` - contract deployed in Remix
2. `2_connected.png` - UI connected to MetaMask
3. `3_transaction.png` - successful post/like transaction

## Tech
Solidity 0.8.20, Remix IDE, MetaMask, ethers.js v6, HTML/CSS/JS.
