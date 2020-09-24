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
          backgroundColor: Colors.red,
        ),
        body: this._tabPages[this._currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          fixedColor: Colors.red,
          onTap: (index) {
            setState(() {
              this._currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          currentIndex: this._currentIndex,
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
        // floatingActionButton: Container(
        //   height: 80,
        //   width: 80,
        //   margin: EdgeInsets.all(10),
        //   padding: EdgeInsets.all(10),
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(40)
        //   ),
        //   child: FloatingActionButton(
        //     child: Icon(Icons.add),
        //     backgroundColor: Colors.pink,
        //     mini: true,
        //   ),
        // ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      );
  }
}