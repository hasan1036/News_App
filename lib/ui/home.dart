import 'package:flutter/material.dart';
// import 'package:news_app/ui/all_news_screen.dart';
// import 'package:news_app/ui/breaking_news_screen.dart';

import 'all_news_screen.dart';
import 'breaking_news_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2, child: Scaffold(
      appBar: AppBar(title: Text("Flutter News App"),
      bottom: TabBar(tabs: [
        Tab(text:  "Breaking",),
        Tab(text:  "All News",),
      ]),
      ),
      body: TabBarView(
          children:[
           BreakingNewsScreen(),
           AllNewsScreen()
          ]

      ),

    ));
  }
}
