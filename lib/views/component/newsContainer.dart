// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../modals/news.dart';
import '../../providers/news_provider.dart';
import '../../providers/theme_provider.dart';

Widget newsContainer({required News news, required BuildContext context}) {
  var size = MediaQuery.of(context).size;
  return Padding(
    padding: const EdgeInsets.all(10),
    child: GestureDetector(
      onTap: () {
        Provider.of<NewsProvider>(context, listen: false)
            .setSelectedNews(news: news);
        Navigator.of(context).pushNamed("details_page");
      },
      child: Neumorphic(
        style: NeumorphicStyle(
            shadowDarkColor: (Provider.of<ThemeProvider>(context).isDark)
                ? Colors.grey
                : Colors.black26,
            shadowLightColor: (Provider.of<ThemeProvider>(context).isDark)
                ? Colors.black
                : Colors.white,
            color: (Provider.of<ThemeProvider>(context).isDark)
                ? Colors.grey[800]
                : Colors.grey[300]),
        child: Container(
          height: size.height * 0.16,
          width: size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(7),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          (news.image == "null")
                              ? "https://puducherry-dt.gov.in/wp-content/themes/district-theme-2/images/blank.jpg"
                              : news.image,
                        ),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Text(
                      news.title,
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // child: Container(
      //   height: MediaQuery.of(context).size.height * 0.3,
      //   width: double.infinity,
      //   decoration: BoxDecoration(
      //     color: Colors.grey.shade400,
      //     borderRadius: BorderRadius.circular(20),
      //     image: DecorationImage(
      //       fit: BoxFit.cover,
      //       image: NetworkImage(
      //         (news.image == "null")
      //             ? "https://puducherry-dt.gov.in/wp-content/themes/district-theme-2/images/blank.jpg"
      //             : news.image,
      //       ),
      //     ),
      //   ),
      //   alignment: Alignment.bottomCenter,
      //   child: Container(
      //     width: double.infinity,
      //     decoration: BoxDecoration(
      //       color: Colors.black.withOpacity(0.7),
      //       borderRadius: const BorderRadius.only(
      //         bottomLeft: Radius.circular(20),
      //         bottomRight: Radius.circular(20),
      //       ),
      //     ),
      //     padding: const EdgeInsets.all(15),
      //     child: Text(
      //       (news.title == "null") ? "" : news.title,
      //       style: Theme.of(context).textTheme.titleMedium?.merge(
      //             const TextStyle(
      //               color: Colors.white,
      //             ),
      //           ),
      //     ),
      //   ),
      // ),
    ),
  );
}
