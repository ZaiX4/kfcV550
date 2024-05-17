import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zhihuribao/5_view/fun/xiaomi13_mm.dart';
import 'package:zhihuribao/5_view/usr/main/top_ui.dart';

//主页面
class MainPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double mm = getMM(context, 1);
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // 设置状态栏为透明
      statusBarIconBrightness: Brightness.dark, // 设置状态栏图标颜色
      systemNavigationBarColor: Colors.transparent, // 设置导航栏为透明
      systemNavigationBarIconBrightness: Brightness.dark, // 设置导航栏图标颜色
    ));
    Widget body = Container(
        width: screenWidth,
        height: screenHeight,
        color: Colors.white,
        child: Column(
            children: [
              Container(
                width: screenWidth,
                height: 8*mm,
                color: Colors.white,
              ),
              TopUi(),
            ]
        )
    );
    return MaterialApp(
      home: Scaffold(
        body: body,
      ),
    );
  }

}