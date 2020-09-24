import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nicemart/config/Config.dart';
import 'package:nicemart/model/CategoryModel.dart';

class CategoryPage extends StatefulWidget {
  CategoryPage({Key key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {

  // selected menu
  var _selectedIndex = 0;
  List _categoryList = [];

  @override
  void initState() {
    super.initState();
    this._fetchCategoryList();
  }

  _fetchCategoryList() async {
    Response response = await Dio().get(Config.CATEGORY_URL);
    var categoryList = CategoryModel.fromJson(response.data);
    print(categoryList);
    setState(() {
      this._categoryList = categoryList.result;
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: true);
    var screenWidth = ScreenUtil.screenWidth;
    var leftMenuWidth = screenWidth / 4;
    var rightItemWidth = (screenWidth - leftMenuWidth - 20 - 20) / 3;
    rightItemWidth = ScreenUtil().setWidth(rightItemWidth);
    var rightItemHeight = rightItemWidth + ScreenUtil().setHeight(18);

    return Row(
      children: <Widget>[
        Container(
          width: leftMenuWidth,
          height: double.infinity,
          child: ListView.builder(
            itemCount: this._categoryList.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        this._selectedIndex = index;
                      });
                    },
                    child: Container(
                      width: double.infinity,
                      height: ScreenUtil().setHeight(56),
                      padding: EdgeInsets.only(top: ScreenUtil().setHeight(24)),
                      color: this._selectedIndex == index ? Colors.red : Colors.white,
                      child: Text('${this._categoryList[index].title}', textAlign: TextAlign.center,),
                    ),
                  ),
                  Divider(),
                ],
              );
            },
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            height: double.infinity,
            color: Color.fromRGBO(240, 246, 246, .9),
            child: GridView.builder(
              itemCount: 25,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: rightItemWidth / rightItemHeight,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      AspectRatio(
                        aspectRatio: 1 / 1,
                        child: Image.network(
                          'https://www.itying.com/images/flutter/list8.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        height: 18,
                        child: Text('小米10青春版'),
                      )
                    ],
                  ),
                );
              }
            ),
          ),
        )
      ],
    );
  }
}