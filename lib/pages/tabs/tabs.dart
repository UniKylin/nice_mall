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
  // 当前页面索引
  int _currentIndex = 0;

  // 页面控制器
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    print('>>>>>>>>>>>>>>>>>>> tab page init');
    _pageController = new PageController(
      keepPage: true,
      initialPage: this._currentIndex,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('麒麟商场'),
          backgroundColor: Colors.red,
        ),
        body: PageView(
          controller: _pageController,
          children: <Widget>[
            HomePage(),
            CategoryPage(),
            CartPage(),
            MinePage(),
          ],
          onPageChanged: (index) {
            print('>>>>>>>>>>> page changed...${index}');
            setState(() {
              this._currentIndex = index;
            });
          },

          // 禁止左右滑动，体验下降
          // physics: NeverScrollableScrollPhysics(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: this._currentIndex,
          onTap: (index) {
            print('>>>>>>>>>>> bottom changed...${index}');
            setState(() {
              this._currentIndex = index;
              // _pageController.jumpToPage(this._currentIndex);
              _pageController.animateToPage(
                this._currentIndex,
                duration: Duration(milliseconds: 500),
                curve: Curves.ease,
              );
            });
          },
          fixedColor: Colors.red,
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