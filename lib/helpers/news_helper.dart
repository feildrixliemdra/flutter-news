import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutternews/models/article_model.dart';

const String apiKey = "a673215a5883405cbda0c3705bb4a882";

class News {
  List<ArticleModel> articles = [];

  Future<void> getNews(String category) async {
    String url =
        'https://newsapi.org/v2/top-headlines?country=id&apiKey=a673215a5883405cbda0c3705bb4a882';

    if (category != 'all') {
      url = url + '&category=${category}';
    }

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel article = ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            publshedAt: DateTime.parse(element['publishedAt']),
            content: element['content'],
            articleUrl: element['url'],
          );
          articles.add(article);
        }
      });
    }
  }
}
