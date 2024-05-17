//该数据结构用于表示新闻内容
import 'dart:convert';
import 'dart:math';

//////////////////////////////////////////////////////////////////////////
/*
{
    "date": "20240517",
    "stories": [
        {
            "image_hue": "0xb3927d",
            "title": "有什么关于大脑的冷知识？",
            "url": "https://daily.zhihu.com/story/9772370",
            "hint": "Gold RIch Money · 3 分钟阅读",
            "ga_prefix": "051707",
            "images": [
                "https://picx.zhimg.com/v2-e28731b0c131020a53d4e605b36c3703.jpg?source=8673f162"
            ],
            "type": 0,
            "id": 9772370
        },
        {
            "image_hue": "0xb37f4b",
            "title": "为什么红外吸收是因为偶极矩的变化，而拉曼散射是因为极化率的变化？",
            "url": "https://daily.zhihu.com/story/9772352",
            "hint": "花开见佛 · 8 分钟阅读",
            "ga_prefix": "051707",
            "images": [
                "https://pic1.zhimg.com/v2-e3d3aaab8484ca257a351e134a00cd86.jpg?source=8673f162"
            ],
            "type": 0,
            "id": 9772352
        },
        {
            "image_hue": "0x201313",
            "title": "世界考古发现中有没有什么重大发现让人觉得不真实？",
            "url": "https://daily.zhihu.com/story/9772359",
            "hint": "槿年 · 1 分钟阅读",
            "ga_prefix": "051707",
            "images": [
                "https://picx.zhimg.com/v2-837ad60163ff45a5c41bc787b6c9a22f.jpg?source=8673f162"
            ],
            "type": 0,
            "id": 9772359
        },
        {
            "image_hue": "0x4d4d4d",
            "title": "请问你见过的最强的公式是什么？",
            "url": "https://daily.zhihu.com/story/9772365",
            "hint": "Aries · 1 分钟阅读",
            "ga_prefix": "051707",
            "images": [
                "https://pic1.zhimg.com/v2-aac1d75dfd460c607ce052a051c7373b.jpg?source=8673f162"
            ],
            "type": 0,
            "id": 9772365
        },
        {
            "image_hue": "0x48374f",
            "title": "瞎扯 · 如何正确地吐槽",
            "url": "https://daily.zhihu.com/story/9772377",
            "hint": "VOL.3352",
            "ga_prefix": "051706",
            "images": [
                "https://picx.zhimg.com/v2-ebbd1421b20ac1697b689cf776045726.jpg?source=8673f162"
            ],
            "type": 0,
            "id": 9772377
        }
    ],
    "top_stories": [
        {
            "image_hue": "0xb3927d",
            "hint": "作者 / Gold RIch Money",
            "url": "https://daily.zhihu.com/story/9772370",
            "image": "https://picx.zhimg.com/v2-6fdd795670ff1f79d34c5bca7a1bd94a.jpg?source=8673f162",
            "title": "有什么关于大脑的冷知识？",
            "ga_prefix": "051707",
            "type": 0,
            "id": 9772370
        },
        {
            "image_hue": "0x689494",
            "hint": "作者 / Congyu",
            "url": "https://daily.zhihu.com/story/9772334",
            "image": "https://picx.zhimg.com/v2-24a906ebc13ed091eb05fdf3caa65c5a.jpg?source=8673f162",
            "title": "霸王龙前面两只小手手是干嘛用的？",
            "ga_prefix": "051607",
            "type": 0,
            "id": 9772334
        },
        {
            "image_hue": "0x8f7c64",
            "hint": "作者 / KnowYourself",
            "url": "https://daily.zhihu.com/story/9772317",
            "image": "https://pica.zhimg.com/v2-94750fcb796710e223cd7cf4b31c653a.jpg?source=8673f162",
            "title": "什么是情绪价值？",
            "ga_prefix": "051507",
            "type": 0,
            "id": 9772317
        },
        {
            "image_hue": "0x89200e",
            "hint": "作者 / 杂然赋流形丶",
            "url": "https://daily.zhihu.com/story/9772276",
            "image": "https://picx.zhimg.com/v2-42b4660e4b6851c0f9eb6ac312f6eb7e.jpg?source=8673f162",
            "title": "【科普】一张图了解物理学",
            "ga_prefix": "051407",
            "type": 0,
            "id": 9772276
        },
        {
            "image_hue": "0x8e6034",
            "hint": "作者 / 元武",
            "url": "https://daily.zhihu.com/story/9772237",
            "image": "https://pica.zhimg.com/v2-75f1ff5b9eb01dc392d36b3727323917.jpg?source=8673f162",
            "title": "皇帝的一天是怎样度过的？",
            "ga_prefix": "051307",
            "type": 0,
            "id": 9772237
        }
    ]
}
 */
//////////////////////////////////////////////////////////////////////////
///时间
class Date {
  String? year;
  String? month;
  String? day;
  Date.fromJson(String? json) {
    //解析json
    if (json != null) {
      year = json.substring(0, 4);

      month = json.substring(5, 7);
      if(month![0] == "0") {
        month = month!.substring(1, 2);
      }

      day = json.substring(8, 10);
      if(day![0] == "0") {
        day = day!.substring(1, 2);
      }
    }
    else {
      year = "";
      month = "";
      day = "";
    }
  }
}
//////////////////////////////////////////////////////////////////////////
///故事
class Story {
  String? image_hue;
  String? title;
  String? url;
  String? hint;
  String? images;
  String? type;
  String? id;

  Story.fromJson(Map<String, dynamic>? json) {
    //解析json
    if (json != null) {
      image_hue = json['image_hue'];
      title = json['title'];
      url = json['url'];
      hint = json['hint'];
      images = json['images'][0];
      type = json['type'];
      id = json['id'];
    }
    else {
      image_hue = "0x000000";
      title = "";
      url = "";
      hint = "";
      images = "";
      type = "";
      id = "";
    }
  }
}
//////////////////////////////////////////////////////////////////////////
///故事列表(list顶部)
class Stories {
  List<Story>? stories;

  Stories.fromJson(Map<String, dynamic>? json) {
    //解析json
    if (json != null) {
      List list = json['stories'];
      stories = list.map((e) => Story.fromJson(e)).toList();
    }
    else {
      List list = [null,null,null,null,null];
      stories = list.map((e) => Story.fromJson(e)).toList();
    }
  }
}
//////////////////////////////////////////////////////////////////////////
///故事列表(list之外)
class TopStories {
  List<Story>? top_stories;

  TopStories.fromJson(Map<String, dynamic>? json) {
    //解析json
    if (json != null) {
      List list = json['top_stories'];
      top_stories = list.map((e) => Story.fromJson(e)).toList();
    }
    else {
      List list = [null,null,null,null,null];
      top_stories = list.map((e) => Story.fromJson(e)).toList();
    }
  }
}
//////////////////////////////////////////////////////////////////////////
///最新
class LatestNews {
  Date? date;
  Stories? stories;
  TopStories? top_stories;

  LatestNews.fromJson(Map<String, dynamic>? json) {
    //解析json
    if (json != null) {
      date = Date.fromJson(json['date']);
      stories = Stories.fromJson(json['stories']);
      top_stories = TopStories.fromJson(json['top_stories']);
    }
    else {
      date = Date.fromJson(null);
      stories = Stories.fromJson(null);
      top_stories = TopStories.fromJson(null);
    }
  }
}
//////////////////////////////////////////////////////////////////////////