import 'package:flutter/material.dart';
import 'package:influencer_index_app/pages/home.page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Influence Index',
      home: HomeScreen(),
    );
  }
}