import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/wallet_provider.dart';
import '../widgets/nft_card.dart';

class PublicDashboard extends StatelessWidget {
  const PublicDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final walletProvider = Provider.of<WalletProvider>(context);
    
    // Mock data for demonstration
    final totalCarbonCredits = 12500;
    
    // Mock NFT data
    final nftList = List.generate(
      8,
      (index) => {
        'id': 'NFT #${1000 + index}',
        'owner': '0x${index}abc...def${index}',
      },
    );
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('BLedger Registry'),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_balance_wallet),
            onPressed: () {
              // Show wallet info or disconnect option
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Wallet Info'),
                  content: Text('Address: ${walletProvider.walletAddress}'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        walletProvider.disconnectWallet();
                        Navigator.pushReplacementNamed(context, '/welcome');
                      },
                      child: const Text('Disconnect'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Close'),
                    ),
                  ],
                ),
              );
            },
          ),
          if (walletProvider.userRole == UserRole.buyer)
            IconButton(
              icon: const Icon(Icons.swap_horiz),
              onPressed: () {
                // Switch role for demo purposes
                walletProvider.switchRole();
                Navigator.pushReplacementNamed(context, '/developer_dashboard');
              },
              tooltip: 'Switch to Developer View',
            ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'BLedger',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Public Registry',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text('Dashboard'),
              selected: true,
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.map),
              title: const Text('Project Map'),
              onTap: () {
                Navigator.pop(context);
                // Navigate to map screen (not implemented)
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_cart),
              title: const Text('Marketplace'),
              onTap: () {
                Navigator.pop(context);
                // Navigate to marketplace screen (not implemented)
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Total Carbon Credits Counter
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text(
                      'Total Carbon Credits Minted',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '$totalCarbonCredits',
                      style: const TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Equivalent to removing 2,500 cars from the road for a year',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Map Placeholder
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.map, size: 48),
                    SizedBox(height: 8),
                    Text(
                      'Project Locations Map',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Map integration placeholder',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Registry Section
            const Text(
              'Carbon Credit Registry',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            
            // NFT Grid
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.5,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: nftList.length,
              itemBuilder: (context, index) {
                return NFTCard(
                  id: nftList[index]['id']!,
                  owner: nftList[index]['owner']!,
                  isDeveloperView: false,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: walletProvider.userRole == UserRole.buyer
          ? FloatingActionButton(
              onPressed: () {
                // Placeholder for buying carbon credits
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Opening marketplace...'),
                  ),
                );
              },
              child: const Icon(Icons.shopping_cart),
            )
          : null,
    );
  }
}