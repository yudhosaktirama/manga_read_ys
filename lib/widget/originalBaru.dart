import 'package:flutter/material.dart';
import 'package:manga_read_ys/Models/anime_api.dart';
import 'package:manga_read_ys/Models/rekomendasiManga.dart';
import 'package:url_launcher/url_launcher.dart';

class OriginalBaruWidget extends StatefulWidget {
  const OriginalBaruWidget({
    super.key,
  });

  @override
  State<OriginalBaruWidget> createState() => _OriginalBaruWidgetState();
}

class _OriginalBaruWidgetState extends State<OriginalBaruWidget> {
  List<RekomendasiManga> lisRekomManga = [];
  String notlauch = "";
  bool isLoading = true;

  _launchURL(int index) async {
    final Uri url = Uri.parse(lisRekomManga[index].rekomendasiSaya[0].url);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $notlauch');
    }
  }

  Future<void> tungguRekomManga() async {
    await GetAnimeFromJikan.getRecomendationManga().then((value) {
      lisRekomManga = value;
      setState(() {
        isLoading = false;
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
    tungguRekomManga();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [CircularProgressIndicator()],
          )
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.40,
              child: ListView.builder(
                itemCount: 8,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Card(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.35,
                      height: MediaQuery.of(context).size.height,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.35,
                            height: MediaQuery.of(context).size.height * 0.25,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(lisRekomManga[index]
                                        .rekomendasiSaya[0]
                                        .gambar),
                                    fit: BoxFit.fill)),
                          ),
                          Expanded(
                              child: Container(
                            child: Column(
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),
                                Flexible(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4),
                                    child: RichText(
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      text: TextSpan(
                                          style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600),
                                          text: lisRekomManga[index]
                                              .rekomendasiSaya[0]
                                              .judul),
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 4),
                                      child: Text("Mal Id : " +lisRekomManga[index]
                                          .rekomendasiSaya[0]
                                          .malId.toString()),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.07,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.25,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.05,
                                      child: ElevatedButton(
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStatePropertyAll(
                                                      Colors.white)),
                                          onPressed: () {
                                            _launchURL(index);
                                          },
                                          child: Text(
                                            'To MAL',
                                            style:
                                                TextStyle(color: Colors.black),
                                          )),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ))
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          );
  }
}
