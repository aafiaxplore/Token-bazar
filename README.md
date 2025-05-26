# 🛒 TokenBazaar

**TokenBazaar** is a decentralized digital marketplace built on Ethereum. It allows users to list and purchase digital items using ERC20 tokens. Simple, secure, and censorship-resistant.

---

## 🚀 Features

- ✅ List digital items for sale with a name and price
- ✅ Purchase items using any approved ERC20 token
- ✅ Transparent, decentralized payments via smart contracts
- ✅ Emission of events for frontend integrations
- ✅ No middlemen or admin access

---

## 📄 Smart Contract Overview

TokenBazaar is written in Solidity and deployed to the Ethereum blockchain (or compatible chains like Polygon, Arbitrum, etc.).

### Core Smart Contract: `DigitalMarketplace.sol`

```solidity
struct Item {
    uint id;
    address seller;
    string name;
    uint price;
    bool isSold;
}



