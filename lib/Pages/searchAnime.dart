import 'package:flutter/material.dart';
import '../Models/anime_api.dart';
import '../Models/searchAnime.dart';

class SearchAnimePage extends StatefulWidget {
  const SearchAnimePage({super.key});

  @override
  State<SearchAnimePage> createState() => _SearchAnimePageState();
}

class _SearchAnimePageState extends State<SearchAnimePage> {
  bool isLoading = true;
  int pages = 1;
  final scrolling = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Search Anime",
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(
                      context: context, delegate: CustomSearchDelegate());
                },
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                ))
          ],
        ),
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  List<SearchAnime> liskuanime = [];
  int page = 1;

  Future<void> tunnguSearch() async {
    await GetAnimeFromJikan.getSearchAnime(query, page).then((value) {
      liskuanime = value;
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
        page = 1;
      } else if (nama != liskuanime) {
        page = page + 1;
        tunnguSearch();
      }
    }
    return ListView.builder(
      itemCount: matchquery.length,
      itemBuilder: (context, index) {
        var hasil = matchquery[index];
        return ListTile(
          title: Text(hasil.judul),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<SearchAnime> matchquery = [];
    for (var nama in liskuanime) {
      if (nama.judul.toLowerCase().contains(query.toLowerCase())) {
        matchquery.add(nama);
        page = 1;
      } else if (nama != liskuanime) {
        page = page + 1;
        tunnguSearch();
      }
    }
    return ListView.builder(
      controller: ScrollController(),
      itemCount: matchquery.length,
      itemBuilder: (context, index) {
        var hasil = matchquery[index];
        return ListTile(
          title: Text(hasil.judul),
        );
      },
    );
  }
}
