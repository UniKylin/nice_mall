import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nicemart/config/Config.dart';
import 'package:nicemart/model/CategoryModel.dart';
import 'package:nicemart/model/ProductModel.dart';

class CategoryPage extends StatefulWidget {
  CategoryPage({Key key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {

  // selected menu
  var _selectedIndex = 0;
  List _categoryList = [];
  List _productList = [];

  @override
  void initState() {
    super.initState();
    this._fetchCategoryList();
  }

  _fetchCategoryList() async {
    Response response = await Dio().get(Config.CATEGORY_URL);
    var categoryList = CategoryModel.fromJson(response.data);

    categoryList.result.forEach((element) {
      print(element.sId);
    });

    setState(() {
      this._categoryList = categoryList.result;
    });
    this._fetchProductById(categoryList.result[0].sId);
  }

  _fetchProductById(categoryId) async {
    Response response = await Dio().get('http://jd.itying.com/api/pcate?pid=${categoryId}');
    var productList = ProductModel.fromJson(response.data);
    print(productList.result);
    setState(() {
      this._productList = productList.result;
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
                        this._fetchProductById(this._categoryList[index].sId);
                        print('>>>>>>>>>>>>${this._categoryList[index].sId}');
                      });
                    },
                    child: Container(
                      width: double.infinity,
                      height: ScreenUtil().setHeight(80),
                      padding: EdgeInsets.only(top: ScreenUtil().setHeight(24)),
                      color: this._selectedIndex == index ? Colors.red : Colors.white,
                      child: Text(
                        '${this._categoryList[index].title}', textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: this._selectedIndex == index ? Colors.white : Colors.black87,
                        ),
                      ),
                    ),
                  ),
                  Divider(height: 1,),
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
              itemCount: this._productList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: rightItemWidth / rightItemHeight,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                String pic=this._productList[index].pic;
                pic = 'http://jd.itying.com/' + pic.replaceAll('\\', '/');

                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/products', arguments: {
                      'categoryId': this._productList[index].sId,
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        AspectRatio(
                          aspectRatio: 1 / 1,
                          child: Image.network(
                            '${pic}',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          height: 18,
                          child: Text('${this._productList[index].title}'),
                        )
                      ],
                    ),
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