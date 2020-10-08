import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartPage extends StatefulWidget {
  CartPage({Key key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    print('>>>>>>>>>>>>>>>>>>> cart page init');
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: true);
    double safeTopHeight = MediaQuery.of(context).padding.top;

    return Container(
      margin: EdgeInsets.only(top: safeTopHeight,),
      child: Text('购物车'),
    );
  }
}