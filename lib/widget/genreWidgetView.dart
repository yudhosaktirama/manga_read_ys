import 'package:flutter/material.dart';
import 'package:manga_read_ys/Models/topAnime.dart';
import 'package:manga_read_ys/Pages/detail.dart';
import 'package:readmore/readmore.dart';

class GenreWidgetView extends StatelessWidget {
  final List<AnimeTopYudho> lisku;
  final ScrollController controller;
  const GenreWidgetView({
    required this.controller,
    required this.lisku,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.72,
          child: ListView.builder(
            controller: controller,
            itemCount: lisku.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return DetailPage(
                            coverLandscape: lisku[index].coverLandscapeImage,
                            gambar: lisku[index].gambar,
                            judul: lisku[index].judul,
                            sinopsis: lisku[index].Sinopsis,
                            episode: lisku[index].episode!,
                            tipe: lisku[index].tipe,
                            genre: lisku[index].genre[0].tipegenre,
                            urlMal: lisku[index].urlMal,
                            rank: lisku[index].rank!,
                            source: lisku[index].sourcee,
                            durasi: lisku[index].durasi,
                            status: lisku[index].status);
                      },
                    ));
                  },
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: MediaQuery.of(context).size.height * 0.2,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(lisku[index].gambar))),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.65,
                          height: MediaQuery.of(context).size.height * 0.2,
                          child: Column(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.65,
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Text(
                                    overflow: TextOverflow.ellipsis,
                                    lisku[index].judul,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.65,
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Builder(builder: (context) {
                                    if (lisku[index].genre.length == 1) {
                                      return Text(
                                        overflow: TextOverflow.ellipsis,
                                        "${lisku[index].genre[0].tipegenre} ",
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                      );
                                    } else if (lisku[index].genre.length ==
                                        2) {
                                      return Text(
                                        overflow: TextOverflow.ellipsis,
                                        "${lisku[index].genre[0].tipegenre} ${lisku[index].genre[1].tipegenre}",
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                      );
                                    } else {
                                      return Text(
                                        overflow: TextOverflow.ellipsis,
                                        "${lisku[index].genre[0].tipegenre} ${lisku[index].genre[1].tipegenre} ${lisku[index].genre[2].tipegenre}",
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                      );
                                    }
                                  }),
                                ),
                              ),
                              Expanded(
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.65,
                                  height:
                                      MediaQuery.of(context).size.height * 0.06,
                                  child: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: ReadMoreText(
                                      trimLines: 2,
                                      trimCollapsedText: 'Show more',
                                      trimExpandedText: '\nShow less',
                                      lisku[index].Sinopsis,
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
