import 'package:flutter/material.dart';

class CategoryItemsPage extends StatefulWidget {
  final String categoryTitle;
  final List<Map<String, dynamic>> items;

  const CategoryItemsPage({
    Key? key,
    required this.categoryTitle,
    required this.items,
  }) : super(key: key);

  @override
  _CategoryItemsPageState createState() => _CategoryItemsPageState();
}

class _CategoryItemsPageState extends State<CategoryItemsPage> {
  late List<Map<String, dynamic>> visibleItems;

  @override
  void initState() {
    super.initState();
    visibleItems = widget.items;
  }

  void filterItems(String query) {
    setState(() {
      visibleItems = widget.items
          .where((item) =>
          item['name'].toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void sortItems(String type) {
    setState(() {
      if (type == 'highPrice') {
        visibleItems.sort((a, b) => b['price'].compareTo(a['price']));
      } else if (type == 'lowPrice') {
        visibleItems.sort((a, b) => a['price'].compareTo(b['price']));
      } else if (type == 'sales') {
        visibleItems.sort((a, b) => b['sales'].compareTo(a['sales']));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.categoryTitle,
          style: TextStyle(color: Colors.amber),
        ),
        backgroundColor: Colors.grey[900],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              onChanged: filterItems,
              decoration: InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search, color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () => sortItems('highPrice'),
                child: Text('High Price'),
              ),
              ElevatedButton(
                onPressed: () => sortItems('lowPrice'),
                child: Text('Low Price'),
              ),
              ElevatedButton(
                onPressed: () => sortItems('sales'),
                child: Text('Best Sellers'),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16.0),
              itemCount: visibleItems.length,
              itemBuilder: (context, index) {
                final item = visibleItems[index];
                return Card(
                  color: Colors.grey[700],
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  child: ListTile(
                    title: Text(item['name'], style: TextStyle(color: Colors.white)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Price: \$${item['price']}', style: TextStyle(color: Colors.amber)),
                        Text('Rating: ${item['rating']}', style: TextStyle(color: Colors.white)),
                        Text('Sales: ${item['sales']}', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      backgroundColor: Colors.grey[800],
    );
  }
}
