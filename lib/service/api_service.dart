import 'dart:convert';
import 'package:http/http.dart';
import '../model/news_model.dart';

class ApiService {

  final String baseUrl = 'https://newsapi.org/v2/';
  static const endpointAllNews = 'everything?q=bitcoin&apiKey=6593e92582204d3cab2e421d7d4898d4';
  static const endpointBreakingNews = 'top-headlines?country=us&apiKey=6593e92582204d3cab2e421d7d4898d4';

  Future<List<NewsModel>> getAllNews() async {
    try {
      final response = await get(Uri.parse(baseUrl+endpointAllNews));

      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        List<dynamic> body = json['articles'];
        List<NewsModel> articles = body.map((dynamic item) =>
            NewsModel.fromJson(item)).toList();
        return articles;
      } else {
        throw ('No news found');
      }
    } catch (e) {
      throw ('Failed to load news: $e');
    }
  }



  Future<List<NewsModel>> getBreakingNews() async {
    try {
      final response = await get(Uri.parse(baseUrl+endpointBreakingNews));

      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        print('Breaking news json: ${json}');
        List<dynamic> body = json['articles'];
        List<NewsModel> articles = body.map((dynamic item) =>
            NewsModel.fromJson(item)).toList();
        return articles;
      } else {
        throw ('No news found');
      }
    } catch (e) {
      throw ('Failed to load news: $e');
    }
  }

}



