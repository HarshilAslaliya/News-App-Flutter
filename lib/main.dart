import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:news_app/providers/news_provider.dart';
import 'package:news_app/providers/theme_provider.dart';
import 'package:news_app/views/screens/details_page.dart';
import 'package:news_app/views/screens/homepage.dart';
import 'package:news_app/views/screens/search_page.dart';
import 'package:provider/provider.dart';

import 'global.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider<NewsProvider>(
          create: (context) => NewsProvider(),
        ),
      ],
      builder: (context, _) => GetMaterialApp(
        themeMode: (Provider.of<ThemeProvider>(context).isDark)
            ? ThemeMode.dark
            : ThemeMode.light,
        theme: lightTheme(),
        darkTheme: darkTheme(),
        debugShowCheckedModeBanner: false,
        routes: {
          "/": (context) => const HomePage(),
          "details_page": (context) => const DetailsPage(),
          "search_page": (context) => const SearchPage(),
        },
      ),
    );
  }
}