import 'package:flutter/material.dart';
import 'category_items_page.dart';

class CategoriesPage extends StatelessWidget {
  final List<Map<String, dynamic>> categories = [
    {
      'name': 'Electronics',
      'products': [
        {'name': 'Laptop', 'price': 1000, 'rating': 4.5},
        {'name': 'Smartphone', 'price': 800, 'rating': 4.7},
      ],
    },
    {
      'name': 'Home Appliances',
      'products': [
        {'name': 'Microwave', 'price': 200, 'rating': 4.3},
        {'name': 'Blender', 'price': 150, 'rating': 4.1},
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
        backgroundColor: Colors.grey[900],
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(16.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryItemsPage(
                    categoryName: category['name'],
                    items: category['products'],
                  ),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  category['name'],
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          );
        },
      ),
      backgroundColor: Colors.grey[800],
    );
  }
}
