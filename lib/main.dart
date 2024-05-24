import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zhihuribao/4_controller/usr/main_pg/top_picture_c.dart';
import 'package:zhihuribao/4_controller/usr/main_pg/story_c.dart';
import 'package:zhihuribao/5_view/usr/main_page.dart';
import 'dart:developer' as developer;

void main() async {

  // 设置 debugPrint 为一个空函数
  debugPrint = (String? message, {int? wrapWidth}) {};

  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {

    //GetX引入
    Get.put(TopPictureC());
    Get.put(StoryC());
    
    return const MainPage();
  }
}
