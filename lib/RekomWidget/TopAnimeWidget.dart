import 'package:flutter/material.dart';
import 'package:manga_read_ys/Models/anime_api.dart';
import 'package:manga_read_ys/Models/topAnime.dart';

import '../widget/gridView2Item.dart';

class TopAnimeWidgett extends StatefulWidget {
  const TopAnimeWidgett({super.key});

  @override
  State<TopAnimeWidgett> createState() => _TopAnimeWidgettState();
}

class _TopAnimeWidgettState extends State<TopAnimeWidgett> {
  List<AnimeTopYudho> topAnime = [];
  bool isLoading = true;
  int pages = 1;
  final scrolling = ScrollController();

  Future<void> tungguTopAnime() async {
    await GetAnimeFromJikan.getTopAnime(pages).then((value) {
      for (var i = 0; i < value.length; i++) {
        topAnime.add(value[i]);
        setState(() {
          isLoading = false;
        });
      }
    });
  }

  @override
  void setState(fn) {
    if(mounted) {
      super.setState(fn);
    }
  }

  @override
  void initState() {
    super.initState();
    scrolling.addListener(_scrolController);
    tungguTopAnime();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: CircularProgressIndicator()),
            ],
          )
        : ListView(scrollDirection: Axis.vertical, children: [
            Column(
              children: [
                ItemViewWidgetDuaItem(
                    scrollController: scrolling,
                    listANimeatauMangaatauRecomen: topAnime),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: const Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Data diambil dari : ",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 20),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "https://docs.api.jikan.mo",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w400),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ]);
  }

  void _scrolController() {
    if (scrolling.position.pixels == scrolling.position.maxScrollExtent) {
      pages = pages + 1;
      tungguTopAnime();
    } else {}
  }
}
