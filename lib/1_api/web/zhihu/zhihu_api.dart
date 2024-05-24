import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:zhihuribao/1_api/fun/log.dart';

import '../../../2_model/data/zhihu/zhihu_m.dart';

//这是应用的api接口部分
//根据代码约定,我们希望所有的api函数根据若干个参数获取特定的json内容,并统一转为map<string,dynamic>类型,如果发生错误则返回null

class ZhiHuApi {
  //获取最新新闻
  Future<Map<String, dynamic>?> getLastNews() async {

    var headers = {
      'User-Agent': 'Apifox/1.0.0 (https://apifox.com)'
    };
    var request = http.Request('GET', Uri.parse('https://news-at.zhihu.com/api/4/news/latest?appid=paimai&functionId=getPaimaiRealTimeData&body={%22paimaiId%22:276304054}'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var s = await response.stream.bytesToString();
      //print(s);
      return jsonDecode(s) as Map<String,dynamic>;
    }
    else {
      print(response.reasonPhrase);
      return null;
    }
  }

  //获取新闻的具体内容
  Future<Map<String, dynamic>?> getNewsContent(int id) async {
    var headers = {
      'User-Agent': 'Apifox/1.0.0 (https://apifox.com)'
    };
    var request = http.Request('GET', Uri.parse('http://news-at.zhihu.com/api/4/news/$id'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var s = await response.stream.bytesToString();
      return jsonDecode(s) as Map<String,dynamic>;
    }
    else {
      print(response.reasonPhrase);
      return null;
    }
  }

  //获取某一天的新闻
  Future<Map<String, dynamic>?> getPastNews(Date date) async {
    var headers = {
      'User-Agent': 'Apifox/1.0.0 (https://apifox.com)'
    };
    var request = http.Request('GET', Uri.parse('http://news-at.zhihu.com/api/4/news/before/${date.json}'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var s = await response.stream.bytesToString();
      return jsonDecode(s) as Map<String,dynamic>;
    }
    else {
      print(response.reasonPhrase);
      return null;
    }
  }

  //获取新闻的额外信息
  Future<Map<String, dynamic>?> getNewsExtraInfo(int id) async {
    var headers = {
      'User-Agent': 'Apifox/1.0.0 (https://apifox.com)'
    };
    var request = http.Request('GET', Uri.parse('http://news-at.zhihu.com/api/4/story-extra/$id'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var s = await response.stream.bytesToString();
      return jsonDecode(s) as Map<String,dynamic>;
    }
    else {
      print(response.reasonPhrase);
      return null;
    }
  }

  //获取长评论
  Future<Map<String, dynamic>?> getLongComments(int id) async {
    var headers = {
      'User-Agent': 'Apifox/1.0.0 (https://apifox.com)'
    };
    var request = http.Request('GET', Uri.parse('http://news-at.zhihu.com/api/4/story/$id/long-comments'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var s = await response.stream.bytesToString();
      return jsonDecode(s) as Map<String,dynamic>;
    }
    else {
      print(response.reasonPhrase);
      return null;
    }
  }

  //获取短评论
  Future<Map<String, dynamic>?> getShortComments(int id) async {
    var headers = {
      'User-Agent': 'Apifox/1.0.0 (https://apifox.com)'
    };
    var request = http.Request('GET', Uri.parse('http://news-at.zhihu.com/api/4/story/$id/short-comments'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var s = await response.stream.bytesToString();
      return jsonDecode(s) as Map<String,dynamic>;
    }
    else {
      print(response.reasonPhrase);
      return null;
    }
  }



}