import 'package:flutter/material.dart';
import 'package:geoloacator/get_lat_long_address.dart';
import 'package:geoloacator/screens/homescreen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
     
        primarySwatch: Colors.blue,
      ),
      home:HomeScreen(),
    );
  }
}