import 'package:flutter/material.dart';
import 'package:nicemart/pages/product.dart';
import '../pages/search.dart';
import '../pages/tabs/tabs.dart';

//配置路由
final routes = {
  '/': (context) => TabsPage(),
  '/search': (context) => SearchPage(),
  '/products': (context, { arguments }) => ProductPage(arguments: arguments),
};

//固定写法
var onGenerateRoute = (RouteSettings settings) {
// 统一处理
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};
