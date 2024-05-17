import 'dart:convert';
import 'package:http/http.dart' as http;

//获取最新新闻
Future<Map<String, dynamic>?> getLastNews() async {
  var headers = {
    'User-Agent': 'Apifox/1.0.0 (https://apifox.com)'
  };
  var request = http.Request('GET', Uri.parse('https://news-at.zhihu.com/api/4/news/latest?appid=paimai&functionId=getPaimaiRealTimeData&body={%22paimaiId%22:276304054}'));

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    String responseBody = await response.stream.bytesToString();
    return jsonDecode(responseBody) as Map<String, dynamic>;
  } else {
    print('Request failed with status: ${response.statusCode}.');
    return null;
  }
}
