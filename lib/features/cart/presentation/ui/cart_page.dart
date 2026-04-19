import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 150,
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              icon: Icon(Icons.menu, color: Colors.black),
              onPressed: () {
                print("Menu clicked");
              },
            ),
            IconButton(
              icon: Icon(Icons.search, color: Colors.black),
              onPressed: () {
                print("Search clicked");
              },
            ),
            IconButton(
              icon: Icon(Icons.compare_arrows, color: Colors.black),
              onPressed: () {
                print("Compare clicked");
              },
            ),
          ],
        ),
        title: null,
        actions: [
           Image.asset("assets/images/logo.png"),
        ],
      ),
      body: Center(child: Text("Cart Items")),
    );
  }
}