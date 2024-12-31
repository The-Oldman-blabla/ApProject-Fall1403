import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> bestSellingProducts = [
    {'name': 'Laptop', 'image': 'assets/laptop.jpg', 'price': 1000, 'rating': 4.5, 'sales': 120},
    {'name': 'Smartphone', 'image': 'assets/images.jpg', 'price': 800, 'rating': 4.7, 'sales': 200},
  ];

  final List<Map<String, dynamic>> discountProducts = [
    {'name': 'Headphones', 'image': 'assets/headphone.jpg', 'originalPrice': 200, 'discountPrice': 150, 'rating': 4.2, 'timeLeft': '2h 30m'},
    {'name': 'TV', 'image': 'assets/tv.jpg', 'originalPrice': 1200, 'discountPrice': 1000, 'rating': 4.6, 'timeLeft': '5h 15m'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text(
          'Home',
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
            color: Colors.amber,
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Best Selling Products',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              SizedBox(
                height: 250,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: bestSellingProducts.length,
                  itemBuilder: (context, index) {
                    final product = bestSellingProducts[index];
                    return Card(
                      color: Colors.grey[700],
                      margin: EdgeInsets.only(right: 8.0),
                      child: SizedBox(
                        width: 150,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(product['image'], height: 100, width: double.infinity, fit: BoxFit.cover),
                            SizedBox(height: 8),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(product['name'], style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                                  Text('\$${product['price']}', style: TextStyle(color: Colors.amber)),
                                  Text('Rating: ${product['rating']}', style: TextStyle(color: Colors.white)),
                                  Text('Sales: ${product['sales']}', style: TextStyle(color: Colors.white)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 24),
              Text(
                'Discounted Products',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              SizedBox(
                height: 250,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: discountProducts.length,
                  itemBuilder: (context, index) {
                    final product = discountProducts[index];
                    return Card(
                      color: Colors.grey[700],
                      margin: EdgeInsets.only(right: 8.0),
                      child: SizedBox(
                        width: 150,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(product['image'], height: 100, width: double.infinity, fit: BoxFit.cover),
                            SizedBox(height: 8),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(product['name'], style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                                  Text('Original: \$${product['originalPrice']}', style: TextStyle(color: Colors.white)),
                                  Text('Discount: \$${product['discountPrice']}', style: TextStyle(color: Colors.amber)),
                                  Text('Rating: ${product['rating']}', style: TextStyle(color: Colors.white)),
                                  Text('Time Left: ${product['timeLeft']}', style: TextStyle(color: Colors.amber)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.grey[800],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.grey,
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
        currentIndex: 0,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/home');
              break;
            case 1:
              Navigator.pushNamed(context, '/cart');
              break;
            case 2:
              Navigator.pushNamed(context, '/categories');
              break;
            case 3:
              Navigator.pushNamed(context, '/profile');
              break;
          }
        },
      ),
    );
  }
}
