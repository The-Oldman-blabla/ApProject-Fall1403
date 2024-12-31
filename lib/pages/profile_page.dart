import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String userName = 'golmohammad fazmetri';
  String userEmail = 'fazgol81@gmail.com';
  String userSubscription = 'Regular';
  String userPassword = '15 ta  1';

  void editUserInfo() {
    final TextEditingController nameController = TextEditingController(text: userName);
    final TextEditingController emailController = TextEditingController(text: userEmail);
    final TextEditingController passwordController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Profile'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: 'Username'),
                ),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                  keyboardType: TextInputType.emailAddress,
                ),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(labelText: 'New Password'),
                  obscureText: true,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  userName = nameController.text;
                  userEmail = emailController.text;
                  if (passwordController.text.isNotEmpty) {
                    userPassword = passwordController.text;
                  }
                });
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void upgradeToPremium() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'My Profile',
          style: TextStyle(color: Colors.amber),
        ),
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
                backgroundImage: AssetImage('assets/ghayoor_mard.webp'),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {},
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
            const SizedBox(height: 8),
            Text(
              'Password: $userPassword',
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
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.shopping_bag, color: Colors.amber),
              title: const Text('Previous Purchases'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.add_shopping_cart, color: Colors.amber),
              title: const Text('Future Purchases'),
              onTap: () {},
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[850],
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,color: Colors.grey[850],),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart,color: Colors.grey[850],),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category,color: Colors.grey[850],),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle,color: Colors.grey[850],),
            label: 'Profile',
          ),
        ],
        currentIndex: 3,
        onTap: (index) {},
      ),
    );
  }
}
