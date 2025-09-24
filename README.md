# BLedger: The Blue Carbon Registry

A decentralized platform for verifiable carbon credits built with Flutter.

## Overview

BLedger is a web application that uses wallet-based authentication to provide different interfaces for Project Developers and Carbon Credit Buyers. The application allows for tracking, minting, and viewing carbon credits as NFTs.

## Features

- Wallet-based authentication
- Role-based UI (Project Developer and Carbon Credit Buyer)
- Project status tracking
- Carbon credit minting
- Public registry of carbon credits

## Setup Instructions

1. **Install Flutter**
   
   Make sure you have Flutter installed. If not, follow the [official installation guide](https://flutter.dev/docs/get-started/install).

2. **Clone the Repository**

   ```
   git clone <repository-url>
   cd bledger
   ```

3. **Install Dependencies**

   ```
   flutter pub get
   ```

4. **Run the Application**

   ```
   flutter run -d chrome
   ```

## Project Structure

- `lib/screens/` - Contains the main screens of the application
- `lib/widgets/` - Reusable UI components
- `lib/providers/` - State management using Provider

## Dependencies

- `provider` - For state management
- `web3dart` - For blockchain interaction
- `fl_chart` - For charts and data visualization
- `google_maps_flutter` - For map integration

## License

This project is licensed under the MIT License - see the LICENSE file for details.