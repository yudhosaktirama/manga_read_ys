import 'package:flutter/material.dart';
import 'package:manga_read_ys/RekomWidget/RecomendationWidget.dart';
import 'package:manga_read_ys/RekomWidget/TopAnimeWidget.dart';
import 'package:manga_read_ys/RekomWidget/TopMangaWidget.dart';


class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(length: 3, child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height * 0.08),
          child: AppBar(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            bottom: const TabBar(
              tabs: [
            Tab(
              child: Text("Top Anime",style: TextStyle(color: Colors.black),),),
            Tab(child: Text("Top Manga",style: TextStyle(color: Colors.black),),),
            Tab(child: Text("Recomendation",style: TextStyle(color: Colors.black),),),
          ]),),
        ),
        body: const TabBarView(
          children: [
            TopAnimeWidgett(),
            TopMangaWidge(),
            RecomendationWidgget()
          ],
        ),
      )),
    );
  }
}