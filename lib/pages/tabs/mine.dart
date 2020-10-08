import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MinePage extends StatefulWidget {
  MinePage({Key key}) : super(key: key);

  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> with AutomaticKeepAliveClientMixin{

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    print('>>>>>>>>>>>>>>>>>>> mine page init');
  }
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: true);
    double safeTopHeight = MediaQuery.of(context).padding.top;

    return Container(
      margin: EdgeInsets.only(top: safeTopHeight,),
      child: Text('个人中心'),
    );
  }
}