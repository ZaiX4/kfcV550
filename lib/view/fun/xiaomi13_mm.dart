import 'package:flutter/material.dart';

//获取小米13上1mm对应的相对宽度
double getMM(BuildContext context,double mm) {
  //获取当前屏幕宽度
  double width = MediaQuery.of(context).size.width;
  return width/68*mm;
}