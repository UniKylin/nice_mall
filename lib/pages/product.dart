import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class ProductPage extends StatefulWidget {
  Map arguments;
  ProductPage({Key key, this.arguments}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: true);
    return Scaffold(
      appBar: AppBar(
        title: Text('商品列表'),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(
            ScreenUtil().setWidth(20),
            ScreenUtil().setHeight(15),
            ScreenUtil().setWidth(20),
            ScreenUtil().setHeight(15)),
        child: ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: ScreenUtil().setWidth(180),
                        height: ScreenUtil().setHeight(180),
                        child: Image.network(
                          'https://www.itying.com/images/flutter/list2.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: ScreenUtil().setHeight(180),
                          margin:
                              EdgeInsets.only(left: ScreenUtil().setWidth(20)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '戴尔(DELL)灵越3670 英特尔酷睿i5 高性能 台式电脑整机(九代i5-9400 8G 256G)',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: ScreenUtil().setSp(28),
                                ),
                              ),
                              Text(
                                '￥880',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: ScreenUtil().setSp(26),
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                        right: ScreenUtil().setWidth(20)),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: ScreenUtil().setWidth(20),
                                      vertical: ScreenUtil().setHeight(5),
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 1,
                                        color: Colors.red,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                          ScreenUtil().setWidth(20)),
                                    ),
                                    child: Text(
                                      '官方自营',
                                      style: TextStyle(
                                        fontSize: ScreenUtil().setSp(20),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    height: 20,
                  )
                ],
              );
            }),
      ),
    );
  }
}
