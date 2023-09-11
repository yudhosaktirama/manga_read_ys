import 'package:flutter/material.dart';
import 'package:manga_read_ys/Models/Recomendation.dart';
import 'package:manga_read_ys/Models/anime_api.dart';
import 'package:manga_read_ys/widget/Recomendation.dart';

// ignore: unused_import
import '../widget/gridView2Item.dart';

class RecomendationWidgget extends StatefulWidget {
  const RecomendationWidgget({super.key});

  @override
  State<RecomendationWidgget> createState() => _RecomendationWidggetState();
}

class _RecomendationWidggetState extends State<RecomendationWidgget> {
  List<Rekomendasi> listRekomendasi = [];
  bool isLoading = true;

  Future<void> tungguRekomendasi() async {
    await GetAnimeFromJikan.getRecomendation().then((value) {
      for (var i = 0; i < value.length; i++) {
        listRekomendasi.add(value[i]);
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
    tungguRekomendasi();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: CircularProgressIndicator(),
              )
            ],
          )
        : ListView(scrollDirection: Axis.vertical, children: [
            Column(
              children: [
                RecomendationPage(inilistRekomendasi: listRekomendasi),
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
