import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: true);
    return Center(
      child: Padding(
      padding: EdgeInsets.only(top: ScreenUtil().setHeight(220)),
        child: Column(
          children: [
            CircularProgressIndicator(
              strokeWidth: 1.0,
            ),
            Container(
              margin: EdgeInsets.only(top: ScreenUtil().setHeight(40)),
              child: Text(
                '加载中...',
                style: TextStyle(fontSize: 16.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}