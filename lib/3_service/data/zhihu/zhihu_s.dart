import 'package:zhihuribao/2_model/data/zhihu/zhihu_m.dart';
import '../../../1_api/web/zhihu/zhihu_api.dart';
import '../../../3_service/fun/ram_to_rom.dart';

//服务类
class ZhiHuS {
  //缓存功能
  var prefs = ramToRom.getPrefs();
  Future<LatestNews>? getLatestNews() async {
    return LatestNews.fromApi(await ZhiHuApi().getLastNews());
  }
}