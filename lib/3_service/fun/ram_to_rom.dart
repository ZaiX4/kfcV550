import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs; // 全局shared

//如文件名,此段代码目的在于将手机的ROM当作RAM使用
//步骤:将任意类型变量序列化为json字符串,利用SharedPreferences,以唯一的hash键值存储于硬盘中,从而节约内存与网络消耗,提高性能
RamToRom ramToRom = RamToRom();

class RamToRom {

  //首先是序列化,将model类中的数据结构加上 @JsonSerializable() 标识

  SharedPreferences getPrefs() {
    return prefs;
  }
  initPrefs() async{
    prefs = await SharedPreferences.getInstance();
  }

}
