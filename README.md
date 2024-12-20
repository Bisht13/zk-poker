# ZK Poker

A zero-knowledge proof-based poker implementation that enables trustless and verifiable online poker games.

## Overview

ZK Poker leverages zero-knowledge proofs to create a transparent and cheat-proof online poker environment. Players can enjoy Texas Hold'em poker without trusting a central authority or other players, as all game actions are cryptographically verified.

## Features

- **Trustless Gameplay**: No need to trust a central server or other players
- **Cryptographic Verification**: All game actions are provably fair
- **Zero-Knowledge Proofs**: Player hands remain private while ensuring valid gameplay
- **Decentralized**: Runs on blockchain technology
- **Texas Hold'em Rules**: Standard poker gameplay

## Prerequisites

- Noir >= 0.36.0
- nargo (Noir's package manager)

## How It Works

ZK Poker uses Noir, a domain-specific language for zero-knowledge proofs, to:
- Verify card shuffling and dealing
- Prove hand validity without revealing cards
- Ensure players can't see others' hole cards
- Validate all betting actions

The system combines Noir circuits with smart contracts to create a fully verifiable poker environment.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- [Noir](https://noir-lang.org/) - Zero-knowledge proof programming language
- [Aztec Network](https://aztec.network/) - The team behind Noir
