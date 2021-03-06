import 'package:flutter/material.dart';
import 'routers/router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: TabsPage()
      initialRoute: '/',
      onGenerateRoute: onGenerateRoute,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
    );
  }
}

