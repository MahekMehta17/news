import 'dart:convert';

import 'package:breaking_news/utils/custom_widgets.dart';
import 'package:http/http.dart' as http;

import '../models/article_model.dart';
import '../utils/strings_util.dart';

class NewsApiService {
  static Future<List<NewsArticle>?> fetchNews(String query) async {
    final response = await http.get(
      Uri.parse('${StringUtils.baseUrl}/$query&apiKey=${StringUtils.apiKey}'),
    );
    final data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      return (data['articles'] as List).map((e) => NewsArticle.fromJson(e)).toList();
    } else {
      print('r=> ${response.body}');
      CustomWidgets.toastValidation(msg: data['message']);
    }
    return null;
  }
}
