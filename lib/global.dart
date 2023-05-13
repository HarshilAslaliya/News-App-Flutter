import 'package:flutter/material.dart';

import 'modals/category.dart';

class Global {
  static final List<Category> category = [
    Category(category: "Sports"),
    Category(category: "Technology"),
    Category(category: "Business"),
    Category(category: "Health"),
    Category(category: "Science"),
    Category(category: "Entertainment"),
  ];
}

darkTheme() {
  return ThemeData.dark(
    useMaterial3: true,
  );
}

lightTheme() {
  return ThemeData.light(
    useMaterial3: true,
  );
}