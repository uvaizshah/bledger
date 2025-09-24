import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/wallet_provider.dart';
import '../widgets/nft_card.dart';

class DeveloperDashboard extends StatelessWidget {
  const DeveloperDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final walletProvider = Provider.of<WalletProvider>(context);
    
    // Mock data for demonstration
    final projectName = "Sundarbans Mangrove Restoration";
    final progressPercentage = 0.85;
    
    // Mock NFT data
    final nftList = List.generate(
      5,
      (index) => {
        'id': 'NFT #${1000 + index}',
        'owner': '0x${index}abc...def${index}',
      },
    );
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Developer Dashboard'),
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
          IconButton(
            icon: const Icon(Icons.swap_horiz),
            onPressed: () {
              // Switch role for demo purposes
              walletProvider.switchRole();
              Navigator.pushReplacementNamed(context, '/public_dashboard');
            },
            tooltip: 'Switch to Buyer View',
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
                    'Project Developer',
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
              leading: const Icon(Icons.add_circle),
              title: const Text('New Project'),
              onTap: () {
                Navigator.pop(context);
                // Navigate to new project screen (not implemented)
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                // Navigate to settings screen (not implemented)
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
            const Text(
              'My Projects',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            
            // Project Card
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      projectName,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        SizedBox(
                          height: 100,
                          width: 100,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              CircularProgressIndicator(
                                value: progressPercentage,
                                strokeWidth: 10,
                                backgroundColor: Colors.grey.shade300,
                              ),
                              Text(
                                '${(progressPercentage * 100).toInt()}%',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Project Status',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text('Verification in progress'),
                              const SizedBox(height: 8),
                              const Text('85% of Goal'),
                              const SizedBox(height: 16),
                              ElevatedButton(
                                onPressed: () {
                                  // Placeholder for minting function
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Minting carbon credits...'),
                                    ),
                                  );
                                },
                                child: const Text('Mint Carbon Credits'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 24),
            
            // NFT Section
            const Text(
              'Minted Carbon Credits',
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
                  isDeveloperView: true,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add new project or mint new credits
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Creating new project...'),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}