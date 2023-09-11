import 'package:flutter/material.dart';
import 'package:manga_read_ys/Models/randomManga.dart';
// ignore: unused_import
import '../Models/anime_api.dart';
import 'itemview.dart';

class WebtoonDailyWiget extends StatefulWidget {
  const WebtoonDailyWiget({
    super.key,
  });

  @override
  State<WebtoonDailyWiget> createState() => _WebtoonDailyWigetState();
}

class _WebtoonDailyWigetState extends State<WebtoonDailyWiget> {
  List<RandomManga> _manga = [];
  bool _isLoading = true;

  Future<void> getRecipes() async {
    await GetAnimeFromJikan.getRandomManga().then(
      (value) {
        _manga = value;
        setState(() {
          _isLoading = false;
        });
      },
    );
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
    getRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.25,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _manga.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            width: MediaQuery.of(context).size.width * 0.30,
            height: MediaQuery.of(context).size.height * 0.50,
            child: _isLoading
                ? const CircularProgressIndicator()
                : ItemVuew(
                    urlku: _manga[index].url,
                    gambar: _manga[index].gambar,
                    genre: _manga[index].tipe,
                    judul: _manga[index].judul,
                  ),
          );
        },
      ),
    );
  }
}
