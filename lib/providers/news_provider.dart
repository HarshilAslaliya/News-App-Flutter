import 'package:flutter/cupertino.dart';

import '../modals/news.dart';

class NewsProvider extends ChangeNotifier {
  News? selectedNews;
  int index = 0;
  List searchList = [];

  setSearchList({required List<News> search}) {
    searchList = search;
    notifyListeners();
  }

  clearSearchList() {
    searchList = [];
    notifyListeners();
  }

  setSelectedNews({required News news}) {
    selectedNews = news;
    notifyListeners();
  }

  changeIndex({required int i}) {
    index = i;
    notifyListeners();
  }
}
