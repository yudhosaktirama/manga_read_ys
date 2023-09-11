import 'package:flutter/material.dart';
import 'package:manga_read_ys/Models/anime_api.dart';
import 'package:manga_read_ys/Models/topManga.dart';
import 'package:manga_read_ys/widget/gridView2ItemManga.dart';

// ignore: unused_import
import '../widget/gridView2Item.dart';

class TopMangaWidge extends StatefulWidget {
  const TopMangaWidge({super.key});

  @override
  State<TopMangaWidge> createState() => _TopMangaWidgeState();
}

class _TopMangaWidgeState extends State<TopMangaWidge> {
  bool isLoading = true;
  List<TopMangaYudho> lisManga = [];

  Future<void> getManga() async {
    await GetAnimeFromJikan.getMangaTop().then((value) {
      for (var i = 0; i < value.length; i++) {
        lisManga.add(value[i]);
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
    getManga();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading ? const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: CircularProgressIndicator(),),
            ],
          ) : ListView(scrollDirection: Axis.vertical, children: [
      Column(
        children: [
          GridDuaItemManga(listANimeatauMangaatauRecomen: lisManga),
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
}
