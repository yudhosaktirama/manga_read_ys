import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:manga_read_ys/Models/topAnime.dart';
import 'package:manga_read_ys/Models/topManga.dart';
import 'package:manga_read_ys/Pages/detailManga.dart';

class GridDuaItemManga extends StatelessWidget {
  final List<TopMangaYudho> listANimeatauMangaatauRecomen;
  const GridDuaItemManga({
    required this.listANimeatauMangaatauRecomen,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.8,
      margin: const EdgeInsets.all(8),
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: listANimeatauMangaatauRecomen.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: MediaQuery.of(context).size.height * 0.5,
            crossAxisCount: 2),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return DetailMangaPage(
                      gambar: listANimeatauMangaatauRecomen[index].gambar,
                      judul: listANimeatauMangaatauRecomen[index].judul,
                      sinopsis: listANimeatauMangaatauRecomen[index].Sinopsis,
                      episode: listANimeatauMangaatauRecomen[index].chapter,
                      tipe: listANimeatauMangaatauRecomen[index].tipe,
                      genre: listANimeatauMangaatauRecomen[index]
                          .genre[0]
                          .genreManga,
                      urlMal: listANimeatauMangaatauRecomen[index].urlMal,
                      rank: listANimeatauMangaatauRecomen[index].rank,
                      source: listANimeatauMangaatauRecomen[index]
                          .volume
                          .toString(),
                      durasi:
                          listANimeatauMangaatauRecomen[index].skor.toString(),
                      status: listANimeatauMangaatauRecomen[index].status);
                },
              ));
            },
            child: Card(
              child: Container(
                margin: const EdgeInsets.all(7),
                height: MediaQuery.of(context).size.height * 0.5,
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.35,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  listANimeatauMangaatauRecomen[index].gambar),
                              fit: BoxFit.fill)),
                    ),
                    Expanded(
                        child: Container(
                      child: Column(
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Builder(builder: (context) {
                                    if (listANimeatauMangaatauRecomen[index]
                                            .genre
                                            .length ==
                                        1) {
                                      return Text(
                                        "${listANimeatauMangaatauRecomen[index]
                                                .genre[0]
                                                .genreManga} ",
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                      );
                                    } else if (listANimeatauMangaatauRecomen[
                                                index]
                                            .genre
                                            .length ==
                                        2) {
                                      return Text(
                                        "${listANimeatauMangaatauRecomen[index]
                                                .genre[0]
                                                .genreManga} ${listANimeatauMangaatauRecomen[index]
                                                .genre[1]
                                                .genreManga}",
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                      );
                                    } else {
                                      return Text(
                                        "${listANimeatauMangaatauRecomen[index]
                                                .genre[0]
                                                .genreManga} ${listANimeatauMangaatauRecomen[index]
                                                .genre[1]
                                                .genreManga} ${listANimeatauMangaatauRecomen[index]
                                                .genre[2]
                                                .genreManga}",
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                      );
                                    }
                                  }),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Text(
                                  listANimeatauMangaatauRecomen[index].judul,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.010,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 3),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Type : ${listANimeatauMangaatauRecomen[index].tipe}",
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.014,
                                  ),
                                  Builder(builder: (context) {
                                    return Text(
                                      "Rank : ${listANimeatauMangaatauRecomen[index].rank}",
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    );
                                  })
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ))
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
