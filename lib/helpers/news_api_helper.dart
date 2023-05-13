import 'package:dio/dio.dart';
import 'package:news_app/modals/news.dart';
import 'package:provider/provider.dart';

import '../providers/news_provider.dart';

class NewsHelper {
  NewsHelper._();

  static final NewsHelper newsHelper = NewsHelper._();

  Dio dio = Dio();

  // ignore: non_constant_identifier_names
  String MyApiKey = "b60fc9a303304dd7991af7db872ff028";

  headlineNews() async {
    Response response = await dio.get(
        "https://newsapi.org/v2/top-headlines?country=in&apiKey=$MyApiKey");

    List data = response.data["articles"];

    List<News> newsList = data.map((e) => News.fromMap(data: e)).toList();

    return newsList;
  }

  categoryNews({required String category}) async {
    Response response = await dio.get(
        "https://newsapi.org/v2/top-headlines?q=$category&apiKey=$MyApiKey");
    List data = response.data["articles"];

    List<News> newsList = data.map((e) => News.fromMap(data: e)).toList();

    return newsList;
  }

  searchNews({required String search, context}) async {
    Response response = await dio
        .get("https://newsapi.org/v2/top-headlines?q=$search&apiKey=$MyApiKey");

    List data = response.data["articles"];

    List<News> newsList = data.map((e) => News.fromMap(data: e)).toList();

    Provider.of<NewsProvider>(context, listen: false).setSearchList(
      search: newsList,
    );
  }
}
