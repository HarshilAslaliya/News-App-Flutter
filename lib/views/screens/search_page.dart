import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/providers/news_provider.dart';
import 'package:provider/provider.dart';
import '../../helpers/news_api_helper.dart';
import '../component/newsContainer.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 50, 10, 0),
            child: TextField(
              autofocus: true,
              onChanged: (val) async {
                await NewsHelper.newsHelper
                    .searchNews(search: val, context: context);
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(5),
                prefixIcon: const Icon(Icons.search),
                label: const Text(
                  "Search",
                ),
                hintText: "Search News",
                filled: true,
                focusedBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.teal, width: 2)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.teal)),
              ),
            ),
          ),
          (Provider.of<NewsProvider>(context).searchList.isNotEmpty)
              ? Expanded(
                  child: ListView.builder(
                    itemCount:
                        Provider.of<NewsProvider>(context).searchList.length,
                    itemBuilder: (context, i) {
                      return newsContainer(
                          news:
                              Provider.of<NewsProvider>(context).searchList[i],
                          context: context);
                    },
                  ),
                )
              : Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.search,
                        size: 40,
                        color: Colors.grey,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Search News",
                        style: GoogleFonts.poppins(
                          textStyle:
                              const TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
