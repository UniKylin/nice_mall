import 'package:flutter/material.dart';
import 'dart:convert';

class CategoryPage extends StatefulWidget {
  CategoryPage({Key key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {

  @override
  void initState() {
    super.initState();

    var mapData = {
      "name": "James Gosling",
      "age": 23
    };

    var strData = '{"name": "James Gosling","age": 23}';
    print(json.encode(mapData));
    print(json.decode(strData)['name']);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 120,
          height: double.infinity,
          child: Text('菜单'),
          color: Colors.red,
        ),
        Expanded(
          flex: 1,
          child: Container(
            height: double.infinity,
            color: Colors.blue,
          ),
        )
      ],
    );
  }
}