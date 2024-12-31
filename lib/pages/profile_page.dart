import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String userName = 'John Doe';
  String userEmail = 'john.doe@example.com';
  String userSubscription = 'Regular';

  void editUserInfo() {
    // Logic for editing user information
  }

  void upgradeToPremium() {
    // Navigate to payment page for subscription upgrade
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
        backgroundColor: Colors.grey[900],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage('https://via.placeholder.com/100'),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Logic for changing profile picture
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                child: const Text('Change Profile Picture'),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Username: $userName',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              'Email: $userEmail',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: editUserInfo,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
              child: const Text('Edit Profile'),
            ),
            const SizedBox(height: 24),
            Text(
              'Subscription Type: $userSubscription',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: upgradeToPremium,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey),
              child: const Text('Upgrade to Premium'),
            ),
            const SizedBox(height: 24),
            ListTile(
              leading: const Icon(Icons.favorite, color: Colors.amber),
              title: const Text('Favorites'),
              onTap: () {
                // Show user's favorite items
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_bag, color: Colors.amber),
              title: const Text('Previous Purchases'),
              onTap: () {
                // Show user's previous purchases
              },
            ),
            ListTile(
              leading: const Icon(Icons.add_shopping_cart, color: Colors.amber),
              title: const Text('Future Purchases'),
              onTap: () {
                // Show user's future purchases
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
        currentIndex: 3,
        onTap: (index) {
          // Navigate to corresponding pages
        },
      ),
    );
  }
}
