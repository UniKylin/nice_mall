import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: true);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: ScreenUtil().setWidth(500),
              height: ScreenUtil().setHeight(50),
              padding: EdgeInsets.only(top: ScreenUtil().setHeight(10)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromRGBO(233, 233, 233, .9),
              ),
              child: TextField(
                autofocus: true,
                maxLines: 1,
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(
                      bottom: ScreenUtil().setHeight(10),
                    ),
                    child: Icon(
                      Icons.search,
                      size: 24,
                      color: Colors.black54,
                    ),
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      print('>>>>> search page: begin search');
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                        bottom: ScreenUtil().setHeight(15),
                      ),
                      child: Icon(
                        Icons.camera_alt,
                        size: 24,
                        color: Colors.black38,
                      ),
                    ),
                  ),
                  hintText: '小米游戏笔记本',
                  hintStyle: TextStyle(
                    color: Colors.black38,
                  ),
                  contentPadding: EdgeInsets.all(10),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onTap: () {
                  // todo
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: ScreenUtil().setWidth(20),
              ),
              child: Text(
                '搜索',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: ScreenUtil().setSp(32),
                ),
              ),
            )
          ],
        ),
      ),
      body: Container(
        child: ListView(
          children: [
            Container(
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(
                ScreenUtil().setWidth(15),
                ScreenUtil().setHeight(20),
                ScreenUtil().setWidth(15),
                ScreenUtil().setHeight(5),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      '搜索历史',
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(26),
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // todo
                      print('>>>>>>>>>>> search page: delete action...');
                    },
                    child: Icon(
                      Icons.delete_outline,
                      size: 24,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(
                ScreenUtil().setWidth(15),
                ScreenUtil().setHeight(5),
                ScreenUtil().setWidth(15),
                ScreenUtil().setHeight(25),
              ),
              child: Wrap(
                children: [
                  InkWell(
                    onTap: (){
                      print('>>>> search page: label click aciton...');
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(
                        ScreenUtil().setWidth(15),
                        ScreenUtil().setHeight(5),
                        ScreenUtil().setWidth(15),
                        ScreenUtil().setHeight(5),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                        child: Text(
                          '小米笔记本',
                          style: TextStyle(
                              color: Colors.black87, fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      print('>>>> search page: label click aciton...');
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(
                        ScreenUtil().setWidth(15),
                        ScreenUtil().setHeight(5),
                        ScreenUtil().setWidth(15),
                        ScreenUtil().setHeight(5),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                        child: Text(
                          'iPhone 11 pro max',
                          style: TextStyle(
                              color: Colors.black87, fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      print('>>>> search page: label click aciton...');
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(
                        ScreenUtil().setWidth(15),
                        ScreenUtil().setHeight(5),
                        ScreenUtil().setWidth(15),
                        ScreenUtil().setHeight(5),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                        child: Text(
                          '小米笔记本',
                          style: TextStyle(
                              color: Colors.black87, fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      print('>>>> search page: label click aciton...');
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(
                        ScreenUtil().setWidth(15),
                        ScreenUtil().setHeight(5),
                        ScreenUtil().setWidth(15),
                        ScreenUtil().setHeight(5),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                        child: Text(
                          '手环',
                          style: TextStyle(
                              color: Colors.black87, fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      print('>>>> search page: label click aciton...');
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(
                        ScreenUtil().setWidth(15),
                        ScreenUtil().setHeight(5),
                        ScreenUtil().setWidth(15),
                        ScreenUtil().setHeight(5),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                        child: Text(
                          '小米笔记本',
                          style: TextStyle(
                              color: Colors.black87, fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      print('>>>> search page: label click aciton...');
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(
                        ScreenUtil().setWidth(15),
                        ScreenUtil().setHeight(5),
                        ScreenUtil().setWidth(15),
                        ScreenUtil().setHeight(5),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                        child: Text(
                          '小米笔记本',
                          style: TextStyle(
                              color: Colors.black87, fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      print('>>>> search page: label click aciton...');
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(
                        ScreenUtil().setWidth(15),
                        ScreenUtil().setHeight(5),
                        ScreenUtil().setWidth(15),
                        ScreenUtil().setHeight(5),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                        child: Text(
                          '小米笔记本',
                          style: TextStyle(
                              color: Colors.black87, fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      print('>>>> search page: label click aciton...');
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(
                        ScreenUtil().setWidth(15),
                        ScreenUtil().setHeight(5),
                        ScreenUtil().setWidth(15),
                        ScreenUtil().setHeight(5),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                        child: Text(
                          '小米笔记本',
                          style: TextStyle(
                              color: Colors.black87, fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      print('>>>> search page: label click aciton...');
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(
                        ScreenUtil().setWidth(15),
                        ScreenUtil().setHeight(5),
                        ScreenUtil().setWidth(15),
                        ScreenUtil().setHeight(5),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                        child: Text(
                          '小米笔记本',
                          style: TextStyle(
                              color: Colors.black87, fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      print('>>>> search page: label click aciton...');
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(
                        ScreenUtil().setWidth(15),
                        ScreenUtil().setHeight(5),
                        ScreenUtil().setWidth(15),
                        ScreenUtil().setHeight(5),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                        child: Text(
                          '小米笔记本',
                          style: TextStyle(
                              color: Colors.black87, fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
