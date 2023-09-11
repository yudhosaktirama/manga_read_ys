import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:manga_read_ys/Models/anime_api.dart';

class AnimeTunggal {
  int id;
  String judul;
  String judulinggris;
  String gambar;
  List<Judul> tipeku;

  AnimeTunggal(
      {required this.id,
      required this.judul,
      required this.judulinggris,
      required this.gambar,
      required this.tipeku});

  factory AnimeTunggal.createAnim(Map<String, dynamic> object) {
    return AnimeTunggal(
        id: object['mal_id'] as int,
        judul: object['title'],
        judulinggris: object['title'],
        gambar: object['images']['jpg']['image_url'],
        tipeku:
            List<Judul>.from(object['genres'].map((x) => Judul.fromJson(x))));
  }

  

  Map<String, dynamic> toJson() =>
      {"titles": List<dynamic>.from(tipeku.map((e) => e.toJson()))};

  static Future<List<AnimeTunggal>> connectToApi() async {
    int index = 1;
    GetAnimeFromJikan.getTopAnime(1);
    List<AnimeTunggal> listku = [];
      Uri apiUrl = Uri.parse("https://api.jikan.moe/v4/anime/$index");
      var apiResult = await http.get(apiUrl);

      if (apiResult.statusCode == 200) {
        var jsonObject = json.decode(apiResult.body);
        var userData = (jsonObject as Map<String, dynamic>)['data'];
        var dataSatu = AnimeTunggal.createAnim(userData);
        listku.add(dataSatu);
      } else {

      }
    return listku;
  }
}

class Judul {
  String tipe;

  Judul({required this.tipe});

  factory Judul.fromJson(Map<String, dynamic> json) {
    return Judul(tipe: json['name']);
  }

  Map<String, dynamic> toJson() => {
        "name": tipe,
      };
}
