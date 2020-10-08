import 'package:flutter/material.dart';
import 'package:nicemart/pages/tabs/cart.dart';
import 'package:nicemart/pages/tabs/category.dart';
import 'package:nicemart/pages/tabs/home.dart';
import 'package:nicemart/pages/tabs/mine.dart';
import 'package:flutter_screenutil/screenutil.dart';

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
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: true);
    return Scaffold(
      appBar: (
        (this._currentIndex == 0 || this._currentIndex == 1) ? (
          AppBar(
            leading: IconButton(
              icon: Icon(
                Icons.center_focus_weak,
                size: 28,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/search');
              },
            ),
            title: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/search');
              },
              child: Container(
                height: ScreenUtil().setHeight(52),
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: ScreenUtil().setWidth(20),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      size: ScreenUtil().setWidth(52),
                      color: Colors.red,
                    ),
                    Text(
                      '小米笔记本',
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(28),
                        color: Colors.black54,
                      ),
                    )
                  ],
                ),
              ),
            ),
            backgroundColor: Colors.red,
            actions: [],
          )
        ) : (
          AppBar(
            title: Text('这就是一个表头啊'),
          )
        )
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
            BottomNavigationBarItem(title: Text('首页'), icon: Icon(Icons.home)),
            BottomNavigationBarItem(
                title: Text('分类'), icon: Icon(Icons.category)),
            BottomNavigationBarItem(
                title: Text('购物车'), icon: Icon(Icons.shopping_cart)),
            BottomNavigationBarItem(
                title: Text('我的'), icon: Icon(Icons.person)),
          ]),
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
