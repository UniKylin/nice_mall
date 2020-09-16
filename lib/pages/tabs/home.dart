import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        _renderSwiper(),
        SizedBox(
          height: 20,
          child: Container(
            color: Colors.red,
          ),
        ),
      ],
    );
  }

  Widget _renderSwiper() {
    List<Map> imgList = [
      {"url": "https://www.itying.com/images/flutter/slide01.jpg"},
      {"url": "https://www.itying.com/images/flutter/slide02.jpg"},
      {"url": "https://www.itying.com/images/flutter/slide03.jpg"},
    ];

    return Container(
      child: AspectRatio(
        aspectRatio: 2/1,
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return new Image.network(
              imgList[index]['url'],
              fit: BoxFit.fill,
            );
          },
          autoplay: true,
          itemCount: imgList.length,
          pagination: new SwiperPagination(),
          control: new SwiperControl(),
        )),
      );
  }
}