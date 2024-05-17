import 'package:flutter/material.dart';
import 'package:zhihuribao/3_service/fun/ram_to_rom.dart';
import 'package:zhihuribao/5_view/usr/main_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //变量持久化
  await ramToRom.initPrefs();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MainPage();
  }
}
