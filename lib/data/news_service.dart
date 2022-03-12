import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:haberler_yeni/models/article.dart';
import 'package:haberler_yeni/models/news.dart';

class NewsService {
  static NewsService _singleton = NewsService._internal();
  NewsService._internal();

  factory NewsService() {
    return _singleton;
  }

  static Future<List<Articles>?> getNews() async {
    Uri url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=tr&category=business&apiKey=189c31ef86e14b5c8653ce1ca53135f8");

    final response = await http.get(url);

    if (response.body.isNotEmpty) {
      final responseJson = json.decode(response.body);
      News news = News.fromJson(responseJson);
      return news.articles;
    }
    return null;
  }
}
