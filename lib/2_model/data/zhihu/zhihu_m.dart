//该数据结构用于表示新闻内容
import 'dart:convert';
import 'dart:math';

import 'package:json_annotation/json_annotation.dart';

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
@JsonSerializable()
class Date {
  String json = "";
  String year = "";
  String month = "";
  String day = "";

  Date.fromApi(String? json) {
    print(json);
    // 解析json
    if (json != null) {
      this.json = json;
      year = json.substring(0, 4);

      month = json.substring(4, 6);
      if (month[0] == "0") {
        month = month.substring(1, 2);
      }

      day = json.substring(6, 8);
      if (day[0] == "0") {
        day = day.substring(1, 2);
      }
    } else {
      year = "";
      month = "";
      day = "";
    }
  }

  // 将 Date 类转换为 DateTime 类
  DateTime toDateTime() {
    return DateTime(
      int.parse(year),
      int.parse(month),
      int.parse(day),
    );
  }

  // 比较两个 Date 对象
  bool isBefore(Date other) {
    return toDateTime().isBefore(other.toDateTime());
  }

  bool isAfter(Date other) {
    return toDateTime().isAfter(other.toDateTime());
  }

  bool isEqual(Date other) {
    return toDateTime().isAtSameMomentAs(other.toDateTime());
  }

  // 加减天数
  Date addDays(int days) {
    DateTime newDate = toDateTime().add(Duration(days: days));
    return Date.fromApi(
        "${newDate.year}${newDate.month.toString().padLeft(2, '0')}${newDate.day.toString().padLeft(2, '0')}");
  }

  Date subtractDays(int days) {
    DateTime newDate = toDateTime().subtract(Duration(days: days));
    return Date.fromApi(
        "${newDate.year}${newDate.month.toString().padLeft(2, '0')}${newDate.day.toString().padLeft(2, '0')}");
  }

  // 重载运算符
  bool operator ==(Object other) {
    if (other is Date) {
      return isEqual(other);
    }
    return false;
  }

  bool operator <(Date other) {
    return isBefore(other);
  }

  bool operator >(Date other) {
    return isAfter(other);
  }

  bool operator <=(Date other) {
    return isBefore(other) || isEqual(other);
  }

  bool operator >=(Date other) {
    return isAfter(other) || isEqual(other);
  }

  Date operator +(int days) {
    return addDays(days);
  }

  Date operator -(int days) {
    return subtractDays(days);
  }

  @override
  int get hashCode => toDateTime().hashCode;
}
//////////////////////////////////////////////////////////////////////////

/*
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
 */
///故事
@JsonSerializable()
class Story {
  var image_hue="0x000000";
  var title="";
  var url="";
  var hint="";
  var ga_prefix="";
  var images=[];
  var type=0;
  var id=0;

  Story.fromApi(Map<String, dynamic>? json) {

    print("gogogo "+json.toString());
    //解析json
    if (json != null) {
      image_hue = json['image_hue'];
      title = json['title'];
      url = json['url'];
      hint = json['hint'];
      images = json['images'];
      type = json['type'];
      id = json['id'];
    }
  }
}

///顶部故事
/*
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
 */
@JsonSerializable()
class TopStory {
  var image_hue="0x000000";
  var hint="";
  var url="";
  var image="";
  var title="";
  var ga_prefix="";
  var type=0;
  var id=0;

  TopStory.fromApi(Map<String, dynamic>? json) {
    //解析json
    if (json != null) {
      image_hue = json['image_hue'];
      hint = json['hint'];
      url = json['url'];
      image = json['image'];
      title = json['title'];
      ga_prefix = json['ga_prefix'];
      type = json['type'];
      id = json['id'];
    }
  }
}
//////////////////////////////////////////////////////////////////////////
///故事列表(list顶部)
@JsonSerializable()
class Stories {
  var stories = List<Story>.generate(5, (index) => Story.fromApi(null));

  Stories.fromApi(List<dynamic>? json) {
    print("121221");
    //解析json
    if (json != null) {
      stories = List.generate(json.length, (index) => Story.fromApi(json[index]));
    }
  }
}
//////////////////////////////////////////////////////////////////////////
///故事列表(list之外)
@JsonSerializable()
class TopStories {
  var top_stories = List<TopStory>.generate(5, (index) => TopStory.fromApi(null));

  TopStories.fromApi(List<dynamic>? json) {
    //解析json
    if (json != null) {
      top_stories = List.generate(json.length, (index) => TopStory.fromApi(json[index]));
    }
  }
}
//////////////////////////////////////////////////////////////////////////
///最新
@JsonSerializable()
class LatestNews {
  Date date = Date.fromApi(null);
  Stories stories = Stories.fromApi(null);
  TopStories top_stories = TopStories.fromApi(null);

  LatestNews.fromApi(Map<String, dynamic>? json) {
    //解析json
    if (json != null) {
      try{
        date = Date.fromApi(json['date']);
      }
      catch(e){
        print("date error"+e.toString());
      }
      try{
        stories = Stories.fromApi(json['stories'] as List<dynamic>);
      }
      catch(e){
        print("story error $e");
      }
      try{
        top_stories = TopStories.fromApi(json['top_stories']);
      }
      catch(e){
        print(e);
      }
    }
  }
}
//////////////////////////////////////////////////////////////////////////
/*
{
    "date": "20240522",
    "stories": [
        {
            "image_hue": "0x85807e",
            "title": "有什么关于大脑的冷知识？",
            "url": "https://daily.zhihu.com/story/9772505",
            "hint": "京师心理大学堂 · 3 分钟阅读",
            "ga_prefix": "052207",
            "images": [
                "https://pic1.zhimg.com/v2-fbc008ec9babdfdf79fe69b70916c3ab.jpg?source=8673f162"
            ],
            "type": 0,
            "id": 9772505
        },
        {
            "image_hue": "0x1b1924",
            "title": "有什么软件官方已经停更了或者公司已经倒闭了，但是你还在用并且觉得很好用的？",
            "url": "https://daily.zhihu.com/story/9772510",
            "hint": "黄亮 · 1 分钟阅读",
            "ga_prefix": "052207",
            "images": [
                "https://picx.zhimg.com/v2-aa8f2ac811875d87783d82a12c8539a0.jpg?source=8673f162"
            ],
            "type": 0,
            "id": 9772510
        },
        {
            "image_hue": "0x332824",
            "title": "蜘蛛结网捕食只是本能，还是存在类似人类的思考过程？",
            "url": "https://daily.zhihu.com/story/9772519",
            "hint": "赵泠 · 1 分钟阅读",
            "ga_prefix": "052207",
            "images": [
                "https://picx.zhimg.com/v2-841a6689ff62cdce8ab361cb321f829c.jpg?source=8673f162"
            ],
            "type": 0,
            "id": 9772519
        },
        {
            "image_hue": "0xb37c46",
            "title": "有哪些关于人体的冷知识？",
            "url": "https://daily.zhihu.com/story/9772522",
            "hint": "好奇博士 · 1 分钟阅读",
            "ga_prefix": "052207",
            "images": [
                "https://pic1.zhimg.com/v2-85613477d663c1a4c2c16a6974ca0cb0.jpg?source=8673f162"
            ],
            "type": 0,
            "id": 9772522
        },
        {
            "image_hue": "0xb39d7b",
            "title": "瞎扯 · 如何正确地吐槽",
            "url": "https://daily.zhihu.com/story/9772532",
            "hint": "VOL.3355",
            "ga_prefix": "052206",
            "images": [
                "https://picx.zhimg.com/v2-bbbb78bcb62b6b68a0e4513db7ffe127.jpg?source=8673f162"
            ],
            "type": 0,
            "id": 9772532
        }
    ]
}
 */
class PastNews {
  Date date = Date.fromApi(null);
  Stories stories = Stories.fromApi(null);

  PastNews.fromApi(Map<String, dynamic>? json) {
    //解析json
    if (json != null) {
      try {
        date = Date.fromApi(json['date']);
      }
      catch (e) {
        print("date error" + e.toString());
      }
      try {
        stories = Stories.fromApi(json['stories']);
      }
      catch (e) {
        print("story error123123" + e.toString());
      }
    }
  }
}