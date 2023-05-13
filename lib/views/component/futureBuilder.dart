import 'package:flutter/material.dart';
import '../../modals/news.dart';
import 'newsContainer.dart';

Widget futureBuilder({required Future future}) {
  return FutureBuilder(
    future: future,
    builder: (context, snapShot) {
      if (snapShot.hasError) {
        return Center(child: Text("Error : ${snapShot.error}"));
      } else if (snapShot.hasData) {
        List<News> newsList = snapShot.data as List<News>;

        return ListView.builder(
          itemCount: newsList.length,
          itemBuilder: (context, i) {
            return newsContainer(news: newsList[i], context: context);
          },
        );
      }
      return const Center(child: CircularProgressIndicator());
    },
  );
}
