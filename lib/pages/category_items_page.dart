import 'package:flutter/material.dart';

class CategoryItemsPage extends StatelessWidget {
  final String categoryName;
  final List<Map<String, dynamic>> items;

  const CategoryItemsPage({Key? key, required this.categoryName, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
        backgroundColor: Colors.grey[900],
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Card(
            color: Colors.grey[800],
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ListTile(
              title: Text(item['name'], style: const TextStyle(color: Colors.white)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Price: \$${item['price']}', style: const TextStyle(color: Colors.amber)),
                  Text('Rating: ${item['rating']}', style: const TextStyle(color: Colors.white)),
                  Text('Sales: ${item['sales']}', style: const TextStyle(color: Colors.white)),
                ],
              ),
              onTap:(){}
            ),
          );
        },
      ),
      backgroundColor: Colors.grey[850],
    );
  }
}
