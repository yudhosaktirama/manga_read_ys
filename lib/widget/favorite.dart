import 'package:flutter/material.dart';
import 'package:manga_read_ys/Models/anime_api.dart';
import 'package:manga_read_ys/Models/randomAnime.dart';
import 'package:url_launcher/url_launcher.dart';

class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({
    super.key,
  });

  @override
  State<FavoriteWidget> createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  List<RandomAnime> listRandom = [];
  bool isLoading = true;
  String notlaunch = "";

  Future<void> tungguRandomAnime() async {
    await GetAnimeFromJikan.getRandomANime().then((value) {
      listRandom = value;
      setState(() {
        isLoading = false;
      });
    });
  }

  _launchURL(int index) async {
    final Uri url = Uri.parse(listRandom[index].url);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $notlaunch');
    }
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
    tungguRandomAnime();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Column(
            children: [CircularProgressIndicator()],
          )
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.38,
              child: ListView.builder(
                itemCount: listRandom.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(border: Border.all()),
                    width: MediaQuery.of(context).size.width * 0.40,
                    height: MediaQuery.of(context).size.height,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Card(
                          borderOnForeground: true,
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.23,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          listRandom[index].gambar),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 3,
                            ),
                            Flexible(
                              child: RichText(
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                text: TextSpan(
                                    style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                    text: listRandom[index].judul),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 3,
                            ),
                            Text(
                              "Type : ${listRandom[index].tipe}",
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.25,
                              child: ElevatedButton(
                                  style: const ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          Colors.white)),
                                  onPressed: () {
                                    _launchURL(index);
                                  },
                                  child: const Text(
                                    "To MAL",
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  )),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          );
  }
}
