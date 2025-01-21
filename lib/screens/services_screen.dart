import 'package:flutter/material.dart';

class ServicesScreen extends StatelessWidget {
  // List of services with corresponding icons and labels
  final List<Map<String, dynamic>> services = [
    {'icon': Icons.credit_card_outlined, 'label': 'Payments'},
    {'icon': Icons.business_center, 'label': 'Business Services'},
    {'icon': Icons.local_shipping, 'label': 'Shipping'},
    {'icon': Icons.account_balance_wallet, 'label': 'Wallet Services'},
    {'icon': Icons.headset_mic, 'label': 'Support'},
    {'icon': Icons.security, 'label': 'Security'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Services'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns in the grid
            crossAxisSpacing: 10, // Horizontal spacing between items
            mainAxisSpacing: 10, // Vertical spacing between items
          ),
          itemCount: services.length, // The number of items in the grid
          itemBuilder: (context, index) {
            return ServiceCard(
              icon: services[index]['icon'], // Passing the IconData
              label: services[index]['label'], // Passing the label
            );
          },
        ),
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final IconData icon;
  final String label;

  const ServiceCard({
    Key? key,
    required this.icon,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // Rounded corners for the card
      ),
      child: InkWell(
        onTap: () {
          // Handle service tap here
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Tapped on $label service')),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 50, // Icon size
              color: Colors.green, // Icon color
            ),
            const SizedBox(height: 10), // Space between icon and label
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16, // Font size of the label
                fontWeight: FontWeight.w500, // Font weight of the label
              ),
            ),
          ],
        ),
      ),
    );
  }
}
