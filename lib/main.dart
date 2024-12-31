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
          categoryTitle: 'Selected Category', items: [],
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
