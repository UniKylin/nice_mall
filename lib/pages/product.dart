import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  Map arguments;
  ProductPage({Key key, this.arguments}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('商品列表'),
        backgroundColor: Colors.red,
      ),
      body: Text('${widget.arguments}'),
    );
  }
}