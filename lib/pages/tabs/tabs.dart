import 'package:flutter/material.dart';
import 'package:nicemart/pages/tabs/cart.dart';
import 'package:nicemart/pages/tabs/category.dart';
import 'package:nicemart/pages/tabs/home.dart';
import 'package:nicemart/pages/tabs/mine.dart';

class TabsPage extends StatefulWidget {
  TabsPage({Key key}) : super(key: key);

  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  int _currentIndex = 0;

  List _tabPages = [
    HomePage(),
    CategoryPage(),
    CartPage(),
    MinePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('麒麟商场'),
        ),
        body: this._tabPages[this._currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              this._currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              title: Text('首页'),
              icon: Icon(Icons.home)
            ),
            BottomNavigationBarItem(
              title: Text('分类'),
              icon: Icon(Icons.category)
            ),
            BottomNavigationBarItem(
              title: Text('购物车'),
              icon: Icon(Icons.shopping_cart)
            ),
            BottomNavigationBarItem(
              title: Text('我的'),
              icon: Icon(Icons.person)
            ),
          ]
        ),
      );
  }
}