import 'package:flutter/material.dart';
import 'package:trello_clone/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'trello clone',
      home: HomePage(),
    );
  }
}
