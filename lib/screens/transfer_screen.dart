import 'package:flutter/material.dart';

class TransferScreen extends StatefulWidget {
  @override
  _TransferScreenState createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _recipientController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transfer Money'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Heading for the screen
            Text(
              'Transfer Details',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 20),

            // Recipient Input Field
            Text(
              'Recipient Phone Number / Name:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 8),
            TextField(
              controller: _recipientController,
              decoration: InputDecoration(
                hintText: 'Enter recipient\'s name or phone number',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              ),
            ),
            SizedBox(height: 20),

            // Transfer Amount Input Field
            Text(
              'Transfer Amount:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 8),
            TextField(
              controller: _amountController,
              decoration: InputDecoration(
                hintText: 'Enter amount to transfer',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 30),

            // Transfer Button
            Center(
              child: 
ElevatedButton(
  onPressed: () {
    String amount = _amountController.text;
    String recipient = _recipientController.text;

    if (amount.isEmpty || recipient.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill in all fields.')),
      );
      return;
    }

    // Handle the transfer logic here
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Transfer successful to $recipient')),
    );
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.green, // Changed from 'primary' to 'backgroundColor'
    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
    textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ),
  child: Text('Transfer Now'),
),
            ),
          ],
        ),
      ),
    );
  }
}
