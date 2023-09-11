import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class ItemVuew extends StatelessWidget {
  final String judul;
  final String genre;
  final String gambar;
  final String urlku;

  ItemVuew({
    required this.judul,
    required this.genre,
    required this.gambar,
    required this.urlku,
    super.key,
  });

  String notlaunch = "";

  _launchURL() async {
    final Uri url = Uri.parse(urlku);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $notlaunch');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            _launchURL();
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.17,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                image: DecorationImage(
                    image: NetworkImage(gambar), fit: BoxFit.fitWidth)),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [Text("Type : " + genre)],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              RichText(
                  text: TextSpan(
                      text: judul,
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w600)))
            ],
          ),
        )
      ],
    );
  }
}
