import 'package:zhihuribao/2_model/data/zhihu/zhihu_m.dart';
import '../../../1_api/web/zhihu/zhihu_api.dart';

//服务类
class ZhiHuS {

  LatestNews? latestNews;
  var pastNewsMap = Map<Date,PastNews>();

  //进入app时,会调用此函数,以获取最新消息

  //获取最新的消息
  Future<LatestNews> getLatestNews() async {
    if(latestNews != null){
      return latestNews!;
    }
    else{
      try{
        var s = await ZhiHuApi().getLastNews();
        print(s.toString());
        latestNews = LatestNews.fromApi(s);
      }
      catch(e){
        print("99999$e");
        return LatestNews.fromApi(null);
      }
      return latestNews!;
    }
  }

  //获取某一天的信息捏
  Future<PastNews> getPastNews(Date date) async {
    if(pastNewsMap[date] != null){
      return pastNewsMap[date]!;
    }
    try{
      pastNewsMap[date] = PastNews.fromApi(await ZhiHuApi().getPastNews(date));
    }
    catch(e){
      return PastNews.fromApi(null);
    }
    return pastNewsMap[date]!;
  }
}

ZhiHuS zhiHuS = ZhiHuS();