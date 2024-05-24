
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zhihuribao/2_model/data/zhihu/zhihu_m.dart';
import 'package:zhihuribao/3_service/data/zhihu/zhihu_s.dart';

class TopPictureC extends GetxController {
  //组件包含如下信息
  //1.五个最新的信息(每个信息都是Story类型)
  //2.当前展示的信息

  //控制器
  var pageController = PageController(); //pageController

  //数据列表
  var imgUrlList = ["","","","",""].obs;
  var titleList = ["","","","",""].obs;
  //作者列表
  var authorList = ["","","","",""].obs;
  var idList = [0,0,0,0,0].obs;
  //颜色列表
  var imageHueList = [Colors.black,Colors.black,Colors.black,Colors.black,Colors.black].obs;

  //循环周期
  var cycle = 5;

  var topStories = TopStories.fromApi(null);

  var nowStoryIndex = 0.0.obs;

  var isLoad = false;

  //初始化数据获取最新信息
  load() async{

    if(!isLoad){
      Timer t = Timer.periodic(const Duration(seconds: 4), (timer) {
        pageController.animateToPage(pageController.page!.round()+1, duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
      });
      pageController.addListener(() {
        changeStory();
        //暂停t
        t.cancel();
        t = Timer.periodic(const Duration(seconds: 3), (timer) {
          pageController.animateToPage(pageController.page!.round()+1, duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
        });
      });
      //每隔三秒页面+1
    }
    isLoad = true;

    //获取最新消息中的顶部消息
    await zhiHuS.getLatestNews().then((value) =>
      topStories = value.top_stories
    );

    print(topStories.top_stories.toString());

    print("6789");
    imgUrlList.clear();
    titleList.clear();
    authorList.clear();
    idList.clear();
    imageHueList.clear();

    cycle = topStories.top_stories.length;
    for(int i=0;i<1000;i++){
      topStories.top_stories.forEach( (_) {
        imgUrlList.add(_.image);
        titleList.add(_.title);
        authorList.add(_.hint);
        idList.add(_.id);
        imageHueList.add(_.image_hue != null ? Color(int.parse(_.image_hue)) : Colors.black);
      } );
    }
    print("6789$imgUrlList");

    pageController.jumpToPage(500*cycle);
    changeStory();
    update();
  }

  //切换顶部消息
  void changeStory(){
    nowStoryIndex.value = pageController.page!.toInt() % cycle + (pageController.page! - pageController.page!.toInt());
    update();
  }
  //获取当前展示的信息
  TopStory getNowStory(){
    try{
      return
        topStories
            .top_stories[nowStoryIndex.value.round()];
    }
    catch(e){
      return TopStory.fromApi(null);
    }
  }

  TopStory getStory(int index){
    try{
      return
        topStories
            .top_stories[index];
    }
    catch(e){
      return TopStory.fromApi(null);
    }
  }
}