import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:nicemart/common/loading_widget.dart';
import 'package:nicemart/model/ProductModel.dart';

class ProductPage extends StatefulWidget {
  Map arguments;
  ProductPage({Key key, this.arguments}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  //Scaffold key
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  // 当前页
  int _currentPage = 1;

  // 每页显示多少条
  int _pageSize = 8;

  // 是否加锁
  bool lock = true;

  // 是否还有数据
  bool _hasMore = true;

  List _productList = [];

  // 上拉分页加载数据控制器
  ScrollController _scrollController = ScrollController();

  /*二级导航数据*/
  List _subHeaderList = [
    {
      "id": 1,
      "title": "综合",
      "fileds": "all",
      "sort":
          -1, //排序     升序：price_1     {price:1}        降序：price_-1   {price:-1}
    },
    {"id": 2, "title": "销量", "fileds": 'salecount', "sort": -1},
    {"id": 3, "title": "价格", "fileds": 'price', "sort": -1},
    {"id": 4, "title": "筛选"}
  ];

  int _selectedHeaderId = 1;

  // 分类id
  var _categoryId;

  // 搜索关键字
  var _keywords;

  // 初始化搜索框的值
  var _initKeywordsController = TextEditingController();

  // 分类
  var _sort;

  @override
  void initState() {
    super.initState();

    // 初始化参数
    this._categoryId = widget.arguments['categoryId'];
    this._keywords = widget.arguments['keywords'];
    this._initKeywordsController.text = this._keywords == null ? '' : this._keywords;

    this._fetchProducts();

    print('>>>>>>>>> search keyword: ${widget.arguments['keywords']}');

    _scrollController.addListener(() {
      // print(_scrollController.position.pixels);
      // print(_scrollController.position.maxScrollExtent);

      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 20) {
        if (this.lock && this._hasMore) {
          this._fetchProducts();
        }
      }
    });
  }

  _fetchProducts() async {
    setState(() {
      this.lock = false;
    });

    String categoryId = widget.arguments['categoryId'];

    String url = '';
    if (this._keywords == null) {
      url = 'http://jd.itying.com/api/plist?cid=${this._categoryId}&page=${this._currentPage}&sort=${this._sort}&pageSize=${this._pageSize}';
    } else {
      url = 'http://jd.itying.com/api/plist?search=${this._keywords}&page=${this._currentPage}sort=${this._sort}&pageSize=${this._pageSize}';
    }

    Response result = await Dio().get(url);
    var productList = ProductModel.fromJson(result.data);
    print('>>>>>>>>>>>');
    print(url);
    print(categoryId);
    print(productList.result.length);

    if (productList.result.length < this._pageSize) {
      setState(() {
        this._productList.addAll(productList.result);
        this._hasMore = false;
        this.lock = true;
      });
    } else {
      setState(() {
        this._productList.addAll(productList.result);
        this._currentPage++;
        this.lock = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: true);
    return Scaffold(
      key: _scaffoldKey,
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
                controller: this._initKeywordsController,
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
                onChanged: (value) {
                  setState(() {
                    this._keywords = value;
                  });
                },
              ),
            ),
            InkWell(
              onTap: () {
                this._fetchProducts();
              },
              child: Container(
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
              ),
            ),
          ],
        ),
      ),
      // endDrawer: Drawer(
      //   child: Container(
      //     padding: EdgeInsets.only(top: 50),
      //     color: Colors.blueAccent,
      //     child: Text('右侧抽屉...'),
      //   ),
      // ),
      body: Stack(
        children: [
          _renderProductList(),
          _renderTopHeader(),
        ],
      ),
    );
  }

  Widget _renderTopHeader() {
    return Positioned(
      top: 0,
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(80),
      child: Container(
        // color: Colors.pink,
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
          width: 1,
          color: Color.fromRGBO(233, 233, 233, 0.9),
        ))),
        child: Row(
          children: this._subHeaderList.map((e) => (
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: () {
                  _handleHeaderTabsChange(e['id']);
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: ScreenUtil().setHeight(20)),
                  child: Text(
                    '${e['title']}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(28),
                      color: (this._selectedHeaderId == e['id'] ? Colors.red : Colors.black54),
                    ),
                  ),
                ),
              ),
            )
          )).toList()
        ),
      ),
    );
  }

  _handleHeaderTabsChange(id) {
    if (id == 4) {
      _scaffoldKey.currentState.openEndDrawer();
      setState(() {
        this._selectedHeaderId = id;
      });
    } else {
      setState(() {
        this._selectedHeaderId = id;
        this._sort ='${this._subHeaderList[id - 1]["fileds"]}_${this._subHeaderList[id - 1]["sort"]}';

        //改变sort排序
        this._subHeaderList[id - 1]['sort'] = this._subHeaderList[id - 1]['sort'] * -1;

        this._currentPage = 1;
        this._hasMore = true;
        this._productList = [];
        _scrollController.jumpTo(0);
        this._fetchProducts();
      });
    }
  }

  Widget _showLoadingMore(index) {
    if (this._hasMore) {
      return (index == this._productList.length - 1)
          ? (CircularProgressIndicator(
              strokeWidth: 1.0,
            ))
          : Text('');
    } else {
      return (index == this._productList.length - 1)
          ? (Text('--- 我是有底线的 ---'))
          : Text('');
    }
  }

  Widget _renderProductList() {
    if (this._productList == null) {
      return LoadingWidget();
    }

    return Container(
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(80)),
      padding: EdgeInsets.fromLTRB(
        ScreenUtil().setWidth(20),
        ScreenUtil().setHeight(15),
        ScreenUtil().setWidth(20),
        ScreenUtil().setHeight(15),
      ),
      child: ListView.builder(
        controller: _scrollController,
        itemCount: this._productList.length,
        itemBuilder: (context, index) {
          String pic = this._productList[index].pic;
          pic = 'http://jd.itying.com/' + pic.replaceAll('\\', '/');
          return Column(
            children: [
              Row(
                children: [
                  Container(
                    width: ScreenUtil().setWidth(180),
                    height: ScreenUtil().setHeight(180),
                    child: Image.network(
                      '${pic}',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: ScreenUtil().setHeight(180),
                      margin: EdgeInsets.only(left: ScreenUtil().setWidth(20)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${this._productList[index].title}',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(28),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                '￥${this._productList[index].price}',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: ScreenUtil().setSp(32),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: ScreenUtil().setWidth(20)),
                                child: Text(
                                  '￥${this._productList[index].oldPrice}',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: ScreenUtil().setSp(26),
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              ),
                            ],
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
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
                height: 20,
              ),
              _showLoadingMore(index),
            ],
          );
        },
      ),
    );
  }
}
