import 'package:flutter/material.dart';
import 'payment_page.dart';

List<Map<String, dynamic>> cartItems = [
  {'name': 'Laptop', 'price': 1000, 'quantity': 1},
  {'name': 'Smartphone', 'price': 800, 'quantity': 2},
];

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<String> savedAddresses = ['123 Main St', '456 Elm St'];
  String? currentAddress;

  double calculateTotalPrice() {
    double total = 0.0;
    for (var item in cartItems) {
      total += item['price'] * item['quantity'];
    }
    return total;
  }

  void addAddressDialog() {
    TextEditingController addressController = TextEditingController();
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: Text('New Address'),
          content: TextField(
            controller: addressController,
            decoration: InputDecoration(hintText: 'Enter your address'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (addressController.text.isNotEmpty) {
                  setState(() {
                    savedAddresses.add(addressController.text);
                    currentAddress = addressController.text;
                  });
                  Navigator.of(ctx).pop();
                }
              },
              child: Text('Save'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        backgroundColor: Colors.grey[900],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (ctx, idx) {
                final product = cartItems[idx];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    title: Text(product['name']),
                    subtitle: Text('Price: \$${product['price']}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () {
                            setState(() {
                              product['quantity'] =
                              (product['quantity'] > 1) ? product['quantity'] - 1 : 1;
                            });
                          },
                        ),
                        Text('${product['quantity']}'),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            setState(() {
                              product['quantity'] += 1;
                            });
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            setState(() {
                              cartItems.removeAt(idx);
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                DropdownButton<String>(
                  value: currentAddress,
                  hint: Text('Choose Address'),
                  items: savedAddresses.map((address) {
                    return DropdownMenuItem(
                      value: address,
                      child: Text(address),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      currentAddress = value;
                    });
                  },
                ),
                TextButton(
                  onPressed: addAddressDialog,
                  child: Text('Add New Address'),
                ),
                SizedBox(height: 16),
                Text(
                  'Total: \$${calculateTotalPrice().toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: currentAddress != null
                      ? () {
                    double total = calculateTotalPrice();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => PaymentPage(totalAmount: total),
                      ),
                    );
                  }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    padding: EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: Text('Proceed to Payment'),
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Colors.grey[800],
    );
  }
}
