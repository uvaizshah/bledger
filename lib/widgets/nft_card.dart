import 'package:flutter/material.dart';

class NFTCard extends StatelessWidget {
  final String id;
  final String owner;
  final bool isDeveloperView;

  const NFTCard({
    super.key,
    required this.id,
    required this.owner,
    this.isDeveloperView = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              id,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Owner: $owner',
              style: const TextStyle(fontSize: 14),
              overflow: TextOverflow.ellipsis,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    // Placeholder for viewing on blockchain
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Viewing on blockchain...'),
                      ),
                    );
                  },
                  child: const Text('View on Blockchain'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}