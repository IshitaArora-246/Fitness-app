import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  Future<Map<String, dynamic>> getCancerNews() async {
    String apiKey = '41cd1b7e3d914c648832163efa158946';
    Map<String, dynamic> newsArticles;
    try {
      String url =
          "http://newsapi.org/v2/everything?qinTitle=fitness+workout&apiKey=$apiKey";
      http.Response r = await http.get(url);
      newsArticles = jsonDecode(r.body);
    } catch (e) {
      print("error $e");
    }
    print(newsArticles['articles'][0]["source"]);

    return newsArticles;
  }
}
