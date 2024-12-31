import 'package:flutter/material.dart';
import 'pages/cart_page.dart';
import 'pages/category_items_page.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';
import 'pages/payment_page.dart';
import 'pages/product_details_page.dart';
import 'pages/profile_page.dart';
import 'pages/sign_up_page.dart';
import 'pages/categories_page.dart';

void main() {
  runApp(const ShopApp());
}

class ShopApp extends StatelessWidget {
  const ShopApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/sign_up': (context) => SignUpScreen(),
        '/categories': (context) => CategoriesPage(),
        '/category_items': (context) => CategoryItemsPage(
              categoryName: 'Selected Category',
              items: [
                {
                  'name': 'Smartphone',
                  'price': 800,
                  'rating': 4.7,
                  'sales': 200,
                  'description': 'A high-quality smartphone.',
                  'image': 'https://via.placeholder.com/200',
                },
                {
                  'name': 'Laptop',
                  'price': 1200,
                  'rating': 4.5,
                  'sales': 150,
                  'description': 'A powerful laptop for daily use.',
                  'image': 'https://via.placeholder.com/200',
                },
              ],
            ),
        '/product_details': (context) => ProductDetailsPage(
              product: {
                'name': 'Laptop',
                'image': 'https://via.placeholder.com/200',
                'seller': 'Tech Store',
                'price': 1000,
                'rating': 4.5,
                'stock': 20,
                'sold': 50,
                'description': 'A high-performance laptop for all your needs.',
              },
            ),
        '/cart': (context) => CartPage(),
        '/payment': (context) => PaymentPage(
              totalAmount: 1500.00, // نمونه مقدار
            ),
        '/profile': (context) => ProfileScreen(),
        '/home': (context) => HomePage(),
        //  agha masir ham dorost  shod
      },
    );
  }
}
