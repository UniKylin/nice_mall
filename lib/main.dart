import 'package:flutter/material.dart';
import 'package:nicemart/pages/tabs/tabs.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TabsPage()
    );
  }
}

