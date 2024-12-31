import 'package:flutter/material.dart';

class ProductDetailsPage extends StatefulWidget {
  final Map<String, dynamic> product;

  const ProductDetailsPage({Key? key, required this.product}) : super(key: key);

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int currentQuantity = 1;

  void updateQuantity(bool increment) {
    setState(() {
      if (increment) {
        currentQuantity++;
      } else if (currentQuantity > 1) {
        currentQuantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final productDetails = widget.product;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          productDetails['name'],
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.grey[900],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              productDetails['image'],
              height: 200,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            const SizedBox(height: 16),
            Text(
              productDetails['name'],
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white60),
            ),
            const SizedBox(height: 8),
            Text(
              'Seller: ${productDetails['seller']}',
              style: TextStyle(color: Colors.white60),
            ),
            const SizedBox(height: 8),
            Text(
              'Price: \$${productDetails['price']}',
              style: TextStyle(color: Colors.white60),
            ),
            const SizedBox(height: 8),
            Text(
              'Rating: ${productDetails['rating']}',
              style: TextStyle(color: Colors.white60),
            ),
            const SizedBox(height: 8),
            Text(
              'Stock: ${productDetails['stock']}',
              style: TextStyle(color: Colors.white60),
            ),
            const SizedBox(height: 8),
            Text(
              'Sold: ${productDetails['sold']}',
              style: TextStyle(color: Colors.white60),
            ),
            const SizedBox(height: 16),
            Text(
              'Description:\n${productDetails['description']}',
              style: const TextStyle(fontSize: 16,color: Colors.white60),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text('Quantity:',style: TextStyle(color: Colors.white60)),
                IconButton(
                  onPressed:
                      currentQuantity > 1 ? () => updateQuantity(false) : null,
                  icon: const Icon(Icons.remove,color: Colors.amber,),
                ),
                Text('$currentQuantity',style: TextStyle(color: Colors.white60),),
                IconButton(
                  onPressed: () => updateQuantity(true),
                  icon: const Icon(Icons.add,color: Colors.amber),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                padding: const EdgeInsets.symmetric(vertical: 12.0),
              ),
              child: const Text('Add to Cart'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey,
                padding: const EdgeInsets.symmetric(vertical: 12.0),
              ),
              child: const Text('Add to Favorites'),
            ),
            const SizedBox(height: 16),
            const Text(
              'Reviews:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ListTile(
              title: const Text('User 1'),
              subtitle: const Text('Great product!'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.thumb_up, color: Colors.green),
                  SizedBox(width: 4),
                  Text('10'),
                  SizedBox(width: 16),
                  Icon(Icons.thumb_down, color: Colors.red),
                  SizedBox(width: 4),
                  Text('2'),
                ],
              ),
            ),
            ListTile(
              title: const Text('User 2'),
              subtitle: const Text('Not what I expected.'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.thumb_up, color: Colors.green),
                  SizedBox(width: 4),
                  Text('4'),
                  SizedBox(width: 16),
                  Icon(Icons.thumb_down, color: Colors.red),
                  SizedBox(width: 4),
                  Text('8'),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey[850],
    );
  }
}
