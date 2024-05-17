//主页顶部
import 'package:flutter/material.dart';
import 'package:zhihuribao/5_view/fun/xiaomi13_mm.dart';

//宽度70,高度10
class TopUi extends StatelessWidget {
  const TopUi({super.key});

  //根据当前时间判断是早上,中午,晚上
  String getTop() {
    int hour = DateTime.now().hour;
    if (hour < 6) {
      return "凌晨好!";
    } else if (hour < 12) {
      return "上午好!";
    } else if (hour < 18) {
      return "下午好!";
    } else {
      return "晚上好!";
    }
  }

  @override
  Widget build(BuildContext context) {
    double mm = getMM(context,1);
    double screenWidth = MediaQuery.of(context).size.width;
    /******************************
     * 左侧的日历
     ******************************/
    Widget left = SizedBox(
      width: 5*mm,
      height: 10*mm,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
              DateTime.now().day.toString(),
              style: TextStyle(
                  fontFamily: 'WR',
                  color: Colors.black.withOpacity(0.8),
                  fontSize: 2*1.5*mm,
              )
          ),
          Text(
            "${DateTime.now().month}月",
            style: TextStyle(
              fontFamily: 'WR',
              color: Colors.black.withOpacity(0.8),
              fontSize: 1.2*1.5*mm,
            ),
          )
        ]
    ),
    );
    /******************************
     * 中间的晚上好
     ******************************/
    Widget center = SizedBox(
      height: 10*mm,
      child: Center(
        child: Text(
            "${getTop()}",
            style: TextStyle(
              fontFamily: 'WR',
              color: Colors.black,
              fontSize: 3*1.3*mm,
            )
        ),
      )
    );
    /******************************
     * 右侧的圆形,灰色,直径五毫米
     ******************************/
    Widget right = Container(
      width: 10*mm,
      height: 10*mm,
      child: Center(
        child: Container(
            width: 6*mm,
            height: 6*mm,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey
            )
        ),
      )
    );
    right = SizedBox(
      width: 11*mm,
      height: 10*mm,
      child: right,
    );
    /******************************
     * all in one
     ******************************/
    Widget allInOne = SizedBox(
      width: screenWidth,
      height: 10*mm,
      child: Row(
        children: [
          Container(
            width: 2*mm,
          ),
          left,
          VerticalDivider(
            color: Colors.grey,
            thickness: 0.2*mm,
            width: 20,
            indent: 10,
            endIndent: 10,
          ),
          center,
          const Spacer(),
          right
        ]
      ),
    );

    return allInOne;
  }
}