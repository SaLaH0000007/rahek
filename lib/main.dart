import 'package:flutter/material.dart';
import 'package:rahek/sheredcomponent/bottomNavigationBar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Honey App',
      home: const CustomBottomNavBar(),
    );
  }
}