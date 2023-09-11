import 'package:flutter/material.dart';

import '../Models/anime_api.dart';
import '../Models/topAnime.dart';
import '../widget/genreWidgetView.dart';

class DramaWidget extends StatefulWidget {
  const DramaWidget({super.key});

  @override
  State<DramaWidget> createState() => _DramaWidgetState();
}

class _DramaWidgetState extends State<DramaWidget> {
  List<AnimeTopYudho> topAnime = [];
  List<AnimeTopYudho> listTerfilter = [];
  bool isLoading = true;
  final scrolling = ScrollController();
  int pages = 1;

  Future<void> tungguTopAnime() async {
    await GetAnimeFromJikan.getTopAnime(pages).then((value) {
      for (var i = 0; i < value.length; i++) {
        topAnime.add(value[i]);
      }
      Pengecekan();
      setState(() {
        isLoading = false;
        topAnime.clear();
      });
    });
  }

  @override
  void setState(fn) {
    if (mounted) {
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
        ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
          ],
        )
        : GenreWidgetView(
            controller: scrolling,
            lisku: listTerfilter,
          );
  }

  void _scrolController() {
    if (scrolling.position.pixels == scrolling.position.maxScrollExtent) {
      pages = pages + 1;
      tungguTopAnime();
    } else {}
  }

  void Pengecekan() {
    for (var i = 0; i < topAnime.length; i++) {
      if (topAnime[i].genre.isEmpty) {
        topAnime[i].genre.length.compareTo(0);
      } else if (topAnime[i].genre.length == 1) {
        if (topAnime[i].genre[0].tipegenre == 'Drama') {
          listTerfilter.add(topAnime[i]);
        }
      } else if(topAnime[i].genre.length == 2){
        if (topAnime[i].genre[0].tipegenre == 'Drama' ||
            topAnime[i].genre[1].tipegenre == 'Drama') {
          listTerfilter.add(topAnime[i]);
        }
      }else{
         if (topAnime[i].genre[0].tipegenre == 'Drama' ||
            topAnime[i].genre[1].tipegenre == 'Drama' ||
             topAnime[i].genre[2].tipegenre == 'Drama') {
          listTerfilter.add(topAnime[i]);
        }
      }
    }
  }
}
