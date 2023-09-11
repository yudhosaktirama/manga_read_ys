import 'package:flutter/material.dart';
import 'package:manga_read_ys/Models/anime_api.dart';
import 'package:manga_read_ys/Models/schedule.dart';

import 'itemview.dart';

class JadwalWidget extends StatefulWidget {
  const JadwalWidget({
    super.key,
  });

  @override
  State<JadwalWidget> createState() => _JadwalWidgetState();
}

class _JadwalWidgetState extends State<JadwalWidget> {
  List<Schedule> anime = [];
  bool _isLoading = true;

  Future<void> getRecipes() async {
    await GetAnimeFromJikan.getScedule(1).then((value) {
      for (var i = 0; i < value.length; i++) {
        anime.add(value[i]);
        setState(() {
      _isLoading = false;
    });
      }
      
    });
    
  }

  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: _isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.50,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: anime.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisExtent:
                              MediaQuery.of(context).size.height * 0.25,
                          crossAxisCount: 3),
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 5),
                          width: MediaQuery.of(context).size.width * 0.25,
                          height: MediaQuery.of(context).size.height * 0.5,
                          child: Builder(
                            builder: (context) {
                              if (anime[index].genre.isEmpty) {
                                return ItemVuew(
                                  urlku: anime[index].url,
                                gambar: anime[index].gambar,
                                genre: "Unkown",
                                judul: anime[index].judul,
                              );
                              }else{
                                 return ItemVuew(
                                  urlku: anime[index].url,
                                gambar: anime[index].gambar,
                                genre: anime[index].genre[0].genrenya,
                                judul: anime[index].judul,
                              );
                              }
                            }
                          ),
                        );
                      },
                    ),
                  ),
                ),
        )
      ],
    );
  }
}
