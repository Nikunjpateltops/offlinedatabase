import 'package:flutter/material.dart';
import 'package:offline_database_practice/view_contact_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.purple),
      home: view_contact_page(),
    );
  }
}
