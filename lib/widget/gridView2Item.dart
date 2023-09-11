import 'package:flutter/material.dart';
import 'package:manga_read_ys/Models/topAnime.dart';
import 'package:manga_read_ys/Pages/detail.dart';
// ignore: unused_import
import 'package:manga_read_ys/Pages/home.dart';
import 'package:manga_read_ys/class/hapus.dart';
import 'package:provider/provider.dart';

class ItemViewWidgetDuaItem extends StatefulWidget {
  final List<AnimeTopYudho> listANimeatauMangaatauRecomen;
  final ScrollController scrollController;
  const ItemViewWidgetDuaItem({
    required this.scrollController,
    required this.listANimeatauMangaatauRecomen,
    super.key,
  });

  @override
  State<ItemViewWidgetDuaItem> createState() => _ItemViewWidgetDuaItemState();
}

class _ItemViewWidgetDuaItemState extends State<ItemViewWidgetDuaItem> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CobaProvider(),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.8,
        margin: const EdgeInsets.all(8),
        child: GridView.builder(
          controller: widget.scrollController,
          shrinkWrap: true,
          itemCount: widget.listANimeatauMangaatauRecomen.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: MediaQuery.of(context).size.height * 0.5,
              crossAxisCount: 2),
          itemBuilder: (context, index) {
            return Consumer<CobaProvider>(
              builder: (context, value, child) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return DetailPage(
                          durasi: widget
                              .listANimeatauMangaatauRecomen[index].durasi,
                          episode: widget
                              .listANimeatauMangaatauRecomen[index].episode!,
                          gambar: widget
                              .listANimeatauMangaatauRecomen[index].gambar,
                          judul:
                              widget.listANimeatauMangaatauRecomen[index].judul,
                          genre: widget.listANimeatauMangaatauRecomen[index]
                              .genre[0].tipegenre,
                          rank:
                              widget.listANimeatauMangaatauRecomen[index].rank!,
                          sinopsis: widget
                              .listANimeatauMangaatauRecomen[index].Sinopsis,
                          source: widget
                              .listANimeatauMangaatauRecomen[index].sourcee,
                          status: widget
                              .listANimeatauMangaatauRecomen[index].status,
                          tipe:
                              widget.listANimeatauMangaatauRecomen[index].tipe,
                          urlMal: widget
                              .listANimeatauMangaatauRecomen[index].urlMal,
                          coverLandscape: widget
                              .listANimeatauMangaatauRecomen[index]
                              .coverLandscapeImage,
                        );
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
                                    image: NetworkImage(widget
                                        .listANimeatauMangaatauRecomen[index]
                                        .gambar),
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
                                          if (widget
                                                  .listANimeatauMangaatauRecomen[
                                                      index]
                                                  .genre
                                                  .length ==
                                              1) {
                                            return Text(
                                              "${widget.listANimeatauMangaatauRecomen[index].genre[0].tipegenre} ",
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400),
                                            );
                                          } else if (widget
                                                  .listANimeatauMangaatauRecomen[
                                                      index]
                                                  .genre
                                                  .length ==
                                              2) {
                                            return Text(
                                              "${widget.listANimeatauMangaatauRecomen[index].genre[0].tipegenre} ${widget.listANimeatauMangaatauRecomen[index].genre[1].tipegenre}",
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400),
                                            );
                                          } else {
                                            return Text(
                                              "${widget.listANimeatauMangaatauRecomen[index].genre[0].tipegenre} ${widget.listANimeatauMangaatauRecomen[index].genre[1].tipegenre} ${widget.listANimeatauMangaatauRecomen[index].genre[2].tipegenre}",
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
                                  height:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      Text(
                                        widget
                                            .listANimeatauMangaatauRecomen[
                                                index]
                                            .judul,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.010,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 3),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Type : ${widget.listANimeatauMangaatauRecomen[index].tipe}",
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.014,
                                        ),
                                        Text(
                                          "Episode : ${widget.listANimeatauMangaatauRecomen[index].episode.toString()}",
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400),
                                        )
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
            );
          },
        ),
      ),
    );
  }
}
