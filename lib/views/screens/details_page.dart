import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
          ),
        ),
        title: Text(
          (news!.sourceName == "null") ? "" : news.sourceName,
          style: GoogleFonts.poppins(),
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
                      GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: Colors.teal,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
              ),
              const SizedBox(height: 10),
              Divider(),
              const SizedBox(height: 10),
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
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
              Divider(),
              const SizedBox(height: 10),
              Text(
                (news.description == "null") ? "" : news.description,
                style: GoogleFonts.poppins(),
              ),
              const SizedBox(height: 10),
              Text(
                (news.content == "null") ? "" : news.content,
                style: GoogleFonts.poppins(),
              ),
              const SizedBox(height: 10),
              Divider(),
              const SizedBox(height: 5),
              TextButton(
                style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    textStyle: GoogleFonts.poppins()),
                onPressed: () {
                  if (news.url != "null") {
                    launchUrl(
                      Uri.parse(news.url),
                    );
                  }
                },
                child: const Text("Read more"),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
