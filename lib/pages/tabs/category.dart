import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  CategoryPage({Key key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {

  @override
  void initState() {
    super.initState();
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