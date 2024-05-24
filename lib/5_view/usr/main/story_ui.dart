
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zhihuribao/5_view/fun/xiaomi13_mm.dart';
import 'package:zhihuribao/5_view/usr/main/top_picture_ui.dart';

import '../../../2_model/data/zhihu/zhihu_m.dart';
import '../../../4_controller/usr/main_pg/story_c.dart';

class StoryUI extends StatelessWidget {

  final Date date;
  final int index;
  const StoryUI({super.key, required this.date, required this.index});

  @override
  Widget build(BuildContext context) {
    double mm = getMM(context, 1);
    double screenWidth = MediaQuery.of(context).size.width;

    //初始化数据
    StoryC storyC = Get.find();
    /********************
     * 标题!!
     ********************/
    Widget w1;
    w1 = Container(
      width: 42*mm,
      child: Text(
        storyC.storyMap[date]!.titleList[index],
        style: TextStyle(
            fontFamily: 'WR',
            color: Colors.black.withOpacity(0.9),
            fontSize: 2.5*mm
        ),
      ),
    );

    /********************
     * 提示!!
     ********************/
    Widget w2;
    w2 = Container(
      width: 42*mm,
      child: Text(
        storyC.storyMap[date]!.hintList[index],
        style: TextStyle(
            fontFamily: 'WR',
            color: Colors.black.withOpacity(0.5),
            fontSize: 1.5*mm
        ),
      ),
    );

    /********************
     * 构成一列
     ********************/
    Widget w12;
    w12 = Column(
      children: [
        w1,
        Container(height: 1*mm,),
        w2
      ],
    );
    w12 = Container(
      child: w12,
    );

    /********************
     * 图片!!
     ********************/
    Widget w3;
    w3 = Container(
      width: 12*mm,
      height: 12*mm,
      child: CachedNetworkImage(
        imageUrl: storyC.storyMap[date]!.imgUrlList[index],
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
    //切割圆角
    w3 = ClipRRect(
      borderRadius: BorderRadius.circular(0.5*mm),
      child: w3,
    );

    /********************
     * 综合!!
     ********************/
    Widget w4;
    w4 = Row(
      children: [
        Spacer(),
        w12,
        Spacer(),
        w3,
        Spacer()
      ],
    );
    w4 = Container(
      child: Column(
        children: [
          Container(height: 4*mm,),
          w4
        ],
      )
    );

    return w4;
  }
}

class DateLine extends StatelessWidget {

  final Date date;
  const DateLine({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    double mm = getMM(context, 1);
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(height: 4*mm,),

    Container(
      width: screenWidth,
      child: Row(
      children: [
        Container(width: 3*mm,),
        Text(
          "${date.month}月${date.day}日",
          style: TextStyle(
            fontFamily: 'WR',
            color: Colors.black.withOpacity(0.5),
            fontSize: 1.5*mm
            ),
            ),
          Container(width: 3*mm,),
          Expanded(
            child: Container(
              height: 0.15*mm,
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          Container(width: 3*mm,),
      ],
      ),
    ),],
    );
  }
}


class StoryListUI extends StatelessWidget {

  final StoryC storyC = Get.find();
  List<String> stories = List.generate(20, (index) => 'Story ${index + 1}');
  ScrollController _scrollController = ScrollController();
  bool isLoading = false;

  Future<void> _refreshStories() async {
    await Future.delayed(Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    double mm = getMM(context, 1);
    double screenWidth = MediaQuery.of(context).size.width;

    storyC.load();

    return Obx(() {
      return Container(
        child: RefreshIndicator(
          onRefresh: _refreshStories,
          child: ListView.builder(
            controller: storyC.scrollController,
            padding: EdgeInsets.zero,
            itemCount: storyC.widgetList.length+1,
            itemBuilder: (context, index) {
              if(index == 0){
                return TopPictureUi();
              }
              if (index == storyC.widgetList.length) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return storyC.widgetList[index];
            },
          ),
        ),
      );
    });
  }
}