import 'package:flutter/material.dart';
import 'package:manga_read_ys/Models/anime_api.dart';
import 'package:manga_read_ys/Models/searchAnime.dart';

class CustomSearchDelegate extends SearchDelegate {
  List<SearchAnime> liskuanime = [];
  int pages = 1;
  final scrolling = ScrollController();

  Future<void> tunnguSearch() async {
    await GetAnimeFromJikan.getSearchAnime(query, pages).then((value) {
      liskuanime = value;
      scrolling.addListener(_scrolController);
    });
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "n";
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    tunnguSearch();
    List<SearchAnime> matchquery = [];
    for (var nama in liskuanime) {
      if (nama.judul.toLowerCase().contains(query.toLowerCase())) {
        matchquery.add(nama);
      }
    }
    scrolling.addListener(_scrolController);
    return ListView.builder(
      controller: scrolling,
      itemCount: matchquery.length,
      itemBuilder: (context, index) {
        var hasil = matchquery[index];
        return ListTile(
          leading: CircleAvatar(backgroundImage: NetworkImage(hasil.gambar)),
          title: Text(hasil.judul),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    tunnguSearch();
    List<SearchAnime> matchquery = [];
    for (var nama in liskuanime) {
      if (nama.judul.toLowerCase().contains(query.toLowerCase())) {
        matchquery.add(nama);
      }
    }
    

    return Builder(
      builder: (context) {
        scrolling.addListener(_scrolController);
        return ListView.builder(
          controller: scrolling,
          itemCount: matchquery.length,
          itemBuilder: (context, index) {
            var hasil = matchquery[index];
            return ListTile(
              leading: CircleAvatar(backgroundImage: NetworkImage(hasil.gambar)),
              title: Text(hasil.judul),
            );
          },
        );
      }
    );
  }

  void _scrolController() {
    if (scrolling.position.pixels == scrolling.position.maxScrollExtent) {
      pages = pages + 1;
      tunnguSearch();
    } else {}
  }
}
