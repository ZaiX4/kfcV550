
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zhihuribao/3_service/data/zhihu/zhihu_s.dart';
import 'package:zhihuribao/5_view/fun/xiaomi13_mm.dart';
import 'package:zhihuribao/5_view/usr/main/story_ui.dart';
import '../../../2_model/data/zhihu/zhihu_m.dart';

class StoryC extends GetxController{

  var scrollController = ScrollController();
  // 时间 => 列表 => 新闻
  var storyMap = Map<Date, OneDayStoryList>().obs;
  var lastTime = Date.fromApi("20771010");

  var isLoad = false;

  //数据排队
  var lastWidgetTime = Date.fromApi("20771010");

  RxList<Widget> widgetList = <Widget>[Container()].obs;
  
  load() async{
    //widgetList.add(Text("12312312312312321321312"));
    if(!isLoad){
      scrollController.addListener(() {
        if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) {
          getMore();
        }
      });
    }
    //widgetList.add(Text("999"));
    LatestNews latestNews = await zhiHuS.getLatestNews();
   // widgetList.add(Text(latestNews.date.json));

    var today = latestNews.date+2;
    //widgetList.add(Text(today.json));
    if(lastTime<=today){
      return;
    }
    lastTime = today;
    getMore();
    widgetList.removeAt(0);
  }

  //将story数据转换为组件列表
  List<Widget> getOneDayWidget(Date date){
    List<Widget> o = <Widget>[];
    try{
      assert(storyMap[date]!=null);
      var oneDayStory = storyMap[date]!;
      o.add(DateLine(date: date));

      for(var i=0;i< oneDayStory.titleList.length;++i){
        o.add(StoryUI(date: date,index: i,));
      }
      //print("7777777777777777777777777777777777777777");
      print(o);
      return o;
    }
    catch(e){
      //print("getOneDayWidgetgetOneDayWidgetgetOneDayWidgetgetOneDayWidgetgetOneDayWidgetgetOneDayWidgetgetOneDayWidget");
      print(e);
      return o;
    }
  }

  //获取某一天的新闻
  Future<OneDayStoryList> getOneDayStoryList(Date date) async{
    //此句卡死
    var pastNews = await zhiHuS.getPastNews(date);
    //widgetList.add(Text("114514"));
    return OneDayStoryList.fromStories(pastNews.stories);
  }

  //获取更多数据
  getMore() async{
    //widgetList.add(Text("moremoremore"));
    lastTime-=1;
    var c_lastTime = lastTime;
    var oneDayStory = await getOneDayStoryList(c_lastTime);
    //widgetList.add(Text(oneDayStory.titleList.toString()));
    storyMap[c_lastTime] = oneDayStory;

    //如果还没轮到这个线程,那么就等待100ms
    while(lastWidgetTime-1!=c_lastTime && lastWidgetTime!=Date.fromApi("20771010")){
      await Future.delayed(Duration(milliseconds: 100));
    }
    widgetList.addAll(getOneDayWidget(c_lastTime));
    lastWidgetTime = c_lastTime;
    update();
  }
}

class OneDayStoryList{
  var titleList = <String>[].obs;
  var hintList = <String>[].obs;
  var imgUrlList = <String>[].obs;

  OneDayStoryList.fromNull();

  OneDayStoryList.fromTopStories(TopStories topStories){
    titleList.clear();
    hintList.clear();
    imgUrlList.clear();
    for(var story in topStories.top_stories){
      titleList.add(story.title);
      hintList.add(story.hint);
      imgUrlList.add(story.image);
    }
  }
  OneDayStoryList.fromStories(Stories stories){
    titleList.clear();
    hintList.clear();
    imgUrlList.clear();
    for(var story in stories.stories){
      titleList.add(story.title);
      hintList.add(story.hint);
      imgUrlList.add(story.images[0]);
    }
  }
}