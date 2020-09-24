import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../model/FocusModel.dart';
import '../../config/Config.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _focusList;

  @override
  void initState() {
    super.initState();
    this._getCategoryList();
  }

  _getCategoryList() async {
    var dio = Dio();
    Response response = await dio.get(UrlConfig.FOCUS_URL);
    print(response.data);
    var focusList = FocusModel.fromJson(response.data);
    print(focusList.result);
    setState(() {
      this._focusList = focusList.result;
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: true);
    return ListView(
      children: <Widget>[
        _renderSwiper(),
        SizedBox( height: 10 ),
        _renderTitle('猜你喜欢'),
        _renderLikes(),
        SizedBox( height: 10 ),
        _renderTitle('热门推荐'),
        _renderHotItems(),
      ],
    );
  }

  // 幻灯片
  Widget _renderSwiper() {
    if (this._focusList.length > 0) {
      return Container(
        child: AspectRatio(
          aspectRatio: 2/0.8,
          child: Swiper(
            itemBuilder: (BuildContext context, int index) {
              return new Image.network(
                this._focusList[index].pic,
                fit: BoxFit.fill,
              );
            },
            autoplay: true,
            itemCount: this._focusList.length,
            pagination: new SwiperPagination(),
            control: new SwiperControl(),
          ),
        ),
      );
    } else {
      return Center(
        child: Text('数据加载中...'),
      );
    }
  }

  // 标题
  Widget _renderTitle(value) {
    return Container(
      height: ScreenUtil().setHeight(32),
      margin: EdgeInsets.only(left: ScreenUtil().setWidth(20)),
      padding: EdgeInsets.only(left: ScreenUtil().setWidth(20)),
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: Colors.red,
            width: ScreenUtil().setWidth(6)
          ),
        )
      ),
      child: Text(
        value,
        style: TextStyle(
          color: Colors.black54,
        ),
      ),
    );
  }

  Widget _renderLikes() {
    return Container(
      height: ScreenUtil().setHeight(200),
      padding: EdgeInsets.all(ScreenUtil().setWidth(20)),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index){
          return Column(
            children: <Widget>[
              Container(
                height: ScreenUtil().setWidth(140),
                width: ScreenUtil().setHeight(140),
                margin: EdgeInsets.only(right: ScreenUtil().setWidth(20)),
                child: Image.network(
                  'https://www.itying.com/images/flutter/hot${index+1}.jpg',
                  fit: BoxFit.cover
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: ScreenUtil().setWidth(10)),
                height: ScreenUtil().setHeight(44),
                child: Text('第${index}条'),
              ),
            ],
          );
        }
      ),
    );
  }

  Widget _renderHotItems() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Wrap(
        runSpacing: 10,
        spacing: 10,
        children: <Widget>[
          _renderHotItem(),
          _renderHotItem(),
          _renderHotItem(),
          _renderHotItem(),
          _renderHotItem(),
          _renderHotItem(),
          _renderHotItem(),
          _renderHotItem(),
          _renderHotItem(),
          _renderHotItem(),
          _renderHotItem(),
          _renderHotItem(),
        ],
      ),
    );
  }

  Widget _renderHotItem() {
    var itemsWidth = (ScreenUtil.screenWidth -30) / 2;

    return Container(
      width: itemsWidth,
      padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(233, 233, 233, 0.9), width: 1)
      ),
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            child: AspectRatio(
              aspectRatio: 1/1,
              child: Image.network(
                'https://www.itying.com/images/flutter/list1.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
            child: Text(
              '2020夏季新款气质高贵洋气阔太太有女人味中长款宽松大码',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.black54),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '199.50',
                    style: TextStyle(color: Colors.red, fontSize: 16),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    '1888.00',
                    style: TextStyle(fontSize: 14, color: Colors.black54, decoration: TextDecoration.lineThrough),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}