import 'package:flutter/material.dart';

enum UserRole {
  none,
  developer,
  buyer
}

class WalletProvider extends ChangeNotifier {
  String? _walletAddress;
  UserRole _userRole = UserRole.none;
  bool _isConnected = false;

  String? get walletAddress => _walletAddress;
  UserRole get userRole => _userRole;
  bool get isConnected => _isConnected;

  // Connect wallet and determine user role
  Future<void> connectWallet() async {
    // Placeholder for actual wallet connection logic
    // In a real implementation, this would connect to MetaMask or another wallet
    
    // Simulate successful connection
    _walletAddress = '0x1234...5678';
    _isConnected = true;
    
    // For demo purposes, we'll simulate a developer role
    // In a real app, this would be determined by checking the wallet address
    // against a list of registered developers or by checking contract roles
    _userRole = UserRole.developer;
    
    notifyListeners();
  }

  // Disconnect wallet
  void disconnectWallet() {
    _walletAddress = null;
    _isConnected = false;
    _userRole = UserRole.none;
    notifyListeners();
  }

  // Switch user role (for demo purposes)
  void switchRole() {
    if (_userRole == UserRole.developer) {
      _userRole = UserRole.buyer;
    } else {
      _userRole = UserRole.developer;
    }
    notifyListeners();
  }
}