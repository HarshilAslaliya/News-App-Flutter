import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:news_app/views/screens/search_page.dart';
import 'package:provider/provider.dart';
import '../../global.dart';
import '../../helpers/news_api_helper.dart';
import '../../providers/news_provider.dart';
import '../../providers/theme_provider.dart';
import '../component/futureBuilder.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  PageController pageController = PageController();

  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: Global.category.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.teal,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: "Home",
            tooltip: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            activeIcon: Icon(Icons.search),
            label: "Search",
            tooltip: "Search",
          ),
        ],
        currentIndex: Provider.of<NewsProvider>(context).index,
        onTap: (index) {
          Provider.of<NewsProvider>(context, listen: false)
              .changeIndex(i: index);
          pageController.jumpToPage(index);
        },
      ),
      body: PageView(
        onPageChanged: (index) {
          Provider.of<NewsProvider>(context, listen: false)
              .changeIndex(i: index);
        },
        controller: pageController,
        children: [
          Column(
            children: [
              SizedBox(
                height: height * 0.05,
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Your \nbreifing",
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 35,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Text(
                            DateFormat('EEEE, dd MMM').format(DateTime.now()),
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          Provider.of<ThemeProvider>(context, listen: false)
                              .changeTheme();
                        },
                        child: Container(
                          height: height * 0.1,
                          width: width * 0.2,
                          decoration: BoxDecoration(
                              color: (Provider.of<ThemeProvider>(context).isDark)
                                  ? Colors.grey[800]
                                  : Colors.grey[200],
                              shape: BoxShape.circle),
                          child: Icon(
                              (Provider.of<ThemeProvider>(context).isDark)
                                  ? Icons.brightness_4_outlined
                                  : Icons.brightness_7_rounded,
                              color: Colors.amber,
                              // themeProvider.isDark
                              //     ? Colors.yellow
                              // Colors.grey,
                              size: 40),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: ButtonsTabBar(
                    controller: tabController,
                    backgroundColor: Colors.teal,
                    unselectedBackgroundColor:
                        (Provider.of<ThemeProvider>(context).isDark)
                            ? Colors.grey[800]
                            : Colors.grey[300],
                    unselectedLabelStyle: TextStyle(
                        color: (Provider.of<ThemeProvider>(context).isDark)
                            ? Colors.white
                            : Colors.black),
                    labelStyle: GoogleFonts.poppins(textStyle:  const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),),
                    tabs: const [
                      Tab(
                        text: "   Sports   ",
                      ),
                      Tab(
                        text: " Technology ",
                      ),
                      Tab(
                        text: " Bussiness ",
                      ),
                      Tab(
                        text: "   Health   ",
                      ),
                      Tab(
                        text: " Science ",
                      ),
                      Tab(
                        text: " Entertainment ",
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 10,
                child: TabBarView(
                  physics: BouncingScrollPhysics(),
                  controller: tabController,
                  children: Global.category
                      .map(
                        (e) => futureBuilder(
                          future: NewsHelper.newsHelper
                              .categoryNews(category: e.category),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
          const SearchPage(),
        ],
      ),
    );
  }
}
