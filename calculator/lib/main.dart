import 'package:flutter/material.dart';
import 'HomePage.dart';

void main() => runApp(Myapp());

class Myapp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculator App",
      theme: ThemeData(primarySwatch: Colors.red),
      home: HomePage(),
    );
  }
}
