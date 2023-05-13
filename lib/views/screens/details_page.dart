import 'package:flutter/material.dart';
import 'package:news_app/providers/news_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../modals/news.dart';


class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    News? news = Provider.of<NewsProvider>(context).selectedNews;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          (news!.sourceName == "null") ? "" : news.sourceName,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                (news.title == "null") ? "" : news.title,
                style: Theme.of(context).textTheme.titleLarge?.merge(
                      TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
              ),
              const SizedBox(height: 10),
              Divider(color: Theme.of(context).colorScheme.primary),
              const SizedBox(height: 10),
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      (news.image == "null")
                          ? "https://puducherry-dt.gov.in/wp-content/themes/district-theme-2/images/blank.jpg"
                          : news.image,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Divider(color: Theme.of(context).colorScheme.primary),
              const SizedBox(height: 10),
              Text(
                (news.description == "null") ? "" : news.description,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 10),
              Text(
                (news.content == "null") ? "" : news.content,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 10),
              Divider(color: Theme.of(context).colorScheme.primary),
              const SizedBox(height: 10),
              Text(
                (news.author == "null") ? "" : news.author,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 5),
              Text((news.publishAtTime == "null") ? "" : news.publishAtTime),
              const SizedBox(height: 10),
              Divider(color: Theme.of(context).colorScheme.primary),
              const SizedBox(height: 5),
              TextButton(
                style: TextButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  textStyle: Theme.of(context).textTheme.titleMedium,
                ),
                onPressed: () {
                  if (news.url != "null") {
                    launchUrl(
                      Uri.parse(news.url),
                    );
                  }
                },
                child: const Text("Read more"),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
