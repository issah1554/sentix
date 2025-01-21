import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final String fullName;

  const HomeScreen({Key? key, required this.fullName}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Variable to manage balance visibility
  bool _isBalanceVisible = false;

  // Function to toggle balance visibility
  void _toggleBalanceVisibility() {
    setState(() {
      _isBalanceVisible = !_isBalanceVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SENTIX'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.account_circle, size: 40),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "21612733",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          widget.fullName,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                // Green outlined container for balance and visibility toggle
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.green, // Green border
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(12), // Rounded corners for the outline
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _isBalanceVisible ? "500,000 TZS" : "**** TZS",  // Hide balance if not visible
                        style: TextStyle(
                          fontSize: 24, 
                          fontWeight: FontWeight.bold,
                          color: Colors.green, // Green text color
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          _isBalanceVisible ? Icons.visibility_off : Icons.visibility,
                          color: Colors.green, // Green icon color
                        ),
                        onPressed: _toggleBalanceVisibility, // Toggle visibility
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                // Styled Row with TextButtons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildStyledButton("Statement Mini"),
                    _buildStyledButton("Statement Full"),
                  ],
                ),
              ],
            ),
          ),
          // GridView with background color and top corners radius
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), // Top left corner radius
                topRight: Radius.circular(20), // Top right corner radius
                bottomRight: Radius.circular(20), // Bottom right corner radius
                bottomLeft: Radius.circular(20), // Bottom left corner radius
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.green.shade100, // Lighter background color for the grid
                ),
                child: GridView.count(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  padding: EdgeInsets.all(16),
                  children: [
                    // Grid item 1 (Send)
                    _buildGridButton(Icons.send, "Send"),
                    // Grid item 2 (Pay)
                    _buildGridButton(Icons.payment, "Pay"),
                    // Grid item 3 (Withdraw)
                    _buildGridButton(Icons.remove_circle, "Withdraw"),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper function to build styled TextButtons
  Widget _buildStyledButton(String label) {
    return TextButton(
      onPressed: () {},
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(horizontal: 16, vertical: 10)),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.green.shade50), // Light green background
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // Rounded corners
            side: BorderSide(color: Colors.green, width: 1.5), // Green border
          ),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600, // Slightly bolder text
          color: Colors.green, // Green text color
        ),
      ),
    );
  }

  // Helper function to build grid buttons with icons
  Widget _buildGridButton(IconData icon, String label) {
    return GestureDetector(
      onTap: () {
        // Handle navigation or action
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Tapped on $label')),
        );
      },
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Rectangular items with rounded corners
        ),
        margin: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 40,
              color: Colors.green,
            ),
            const SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
