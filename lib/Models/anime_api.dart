import 'dart:convert';
// ignore: unused_import
import 'package:manga_read_ys/Models/Recomendation.dart';
// ignore: unused_import
import 'package:manga_read_ys/Models/anime.dart';
import 'package:http/http.dart' as http;
// ignore: unused_import
import 'package:manga_read_ys/Models/modelApi.dart';
import 'package:manga_read_ys/Models/randomAnime.dart';
import 'package:manga_read_ys/Models/randomManga.dart';
import 'package:manga_read_ys/Models/rekomendasiManga.dart';
import 'package:manga_read_ys/Models/schedule.dart';
import 'package:manga_read_ys/Models/searchAnime.dart';
import 'package:manga_read_ys/Models/topAnime.dart';
import 'package:manga_read_ys/Models/topManga.dart';

class GetAnimeFromJikan {
  static Future getTopAnime(int pages) async {
    List<AnimeTopYudho> listanimetopku = [];
    Uri apiUrl = Uri.parse("https://api.jikan.moe/v4/top/anime?page=$pages");
    var apiResult = await http.get(apiUrl);
    if (apiResult.statusCode == 200) {
      var jsonObject = json.decode(apiResult.body);
      List<dynamic> lisuser = (jsonObject as Map<String, dynamic>)['data'];
      for (var i = 0; i < lisuser.length; i++) {
        listanimetopku.add(AnimeTopYudho.createListAnime(lisuser[i]));
      }
    } else {}

    return listanimetopku;
  }

  static Future getMangaTop() async {
    List<TopMangaYudho> listanimetopku = [];
    Uri apiUrl = Uri.parse("https://api.jikan.moe/v4/top/manga");
    var apiResult = await http.get(apiUrl);
    if (apiResult.statusCode == 200) {
      var jsonObject = json.decode(apiResult.body);
      List<dynamic> lisuser = (jsonObject as Map<String, dynamic>)['data'];
      for (var i = 0; i < lisuser.length; i++) {
        listanimetopku.add(TopMangaYudho.CreateListManga(lisuser[i]));
      }
    } else {}

    return listanimetopku;
  }

  static Future getRecomendation() async {
    List<Rekomendasi> listanimetopku = [];

    Uri apiUrl = Uri.parse("https://api.jikan.moe/v4/recommendations/anime");
    var apiResult = await http.get(apiUrl);
    if (apiResult.statusCode == 200) {
      var jsonObject = json.decode(apiResult.body);
      List<dynamic> lisuser = (jsonObject as Map<String, dynamic>)['data'];
      for (var i = 0; i < lisuser.length; i++) {
        listanimetopku.add(Rekomendasi.CreateRekomendasiJSON(lisuser[i]));
      }
    } else {}

    return listanimetopku;
  }

  static Future getScedule(int pages) async {
    List<Schedule> listanimetopku = [];
    Uri apiUrl = Uri.parse("https://api.jikan.moe/v4/schedules?page=$pages");
    var apiResult = await http.get(apiUrl);
    if (apiResult.statusCode == 200) {
      var jsonObject = json.decode(apiResult.body);
      List<dynamic> lisuser = (jsonObject as Map<String, dynamic>)['data'];
      for (var i = 0; i < lisuser.length; i++) {
        listanimetopku.add(Schedule.createListSchedule(lisuser[i]));
      }
    } else {}

    return listanimetopku;
  }

  static Future getTopAnimeByGenre(String genre) async {
    List<AnimeTopYudho> listanimetopku = [];
    List<AnimeTopYudho> listTerfilter = [];
    for (var i = 1; i < 3; i++) {
      Uri apiUrl = Uri.parse("https://api.jikan.moe/v4/top/anime?page=$i");
      var apiResult = await http.get(apiUrl);
      if (apiResult.statusCode == 200) {
        var jsonObject = json.decode(apiResult.body);
        List<dynamic> lisuser = (jsonObject as Map<String, dynamic>)['data'];
        for (var i = 0; i < lisuser.length; i++) {
          listanimetopku.add(AnimeTopYudho.createListAnime(lisuser[i]));
          if (listanimetopku[i].genre[0].tipegenre == genre) {
            listTerfilter.add(AnimeTopYudho.createListAnime(lisuser[i]));
          }
        }
      } else {}
    }

    return listTerfilter;
  }

  static Future getRandomANime() async {
    List<RandomAnime> listanimetopku = [];
    int index = 1;
    for (index; index < 5; index++) {
      Uri apiUrl = Uri.parse("https://api.jikan.moe/v4/random/anime");
      var apiResult = await http.get(apiUrl);
      if (apiResult.statusCode == 200) {
        var jsonObject = json.decode(apiResult.body);
        var dataku = (jsonObject as Map<String, dynamic>)['data'];
        listanimetopku.add(RandomAnime.createRandomAnime(dataku));
      } else {}
    }

    return listanimetopku;
  }

  static Future getRecomendationManga() async {
    List<RekomendasiManga> listanimetopku = [];

    Uri apiUrl = Uri.parse("https://api.jikan.moe/v4/recommendations/manga");
    var apiResult = await http.get(apiUrl);
    if (apiResult.statusCode == 200) {
      var jsonObject = json.decode(apiResult.body);
      List<dynamic> lisuser = (jsonObject as Map<String, dynamic>)['data'];
      for (var i = 0; i < lisuser.length; i++) {
        listanimetopku.add(RekomendasiManga.CreateRekomendasiJSON(lisuser[i]));
      }
    } else {}

    return listanimetopku;
  }

  static Future getRandomManga() async {
    List<RandomManga> listanimetopku = [];
    int index = 1;
    for (index; index < 5; index++) {
      Uri apiUrl = Uri.parse("https://api.jikan.moe/v4/random/manga");
      var apiResult = await http.get(apiUrl);
      if (apiResult.statusCode == 200) {
        var jsonObject = json.decode(apiResult.body);
        var dataku = (jsonObject as Map<String, dynamic>)['data'];
        listanimetopku.add(RandomManga.createRandomManga(dataku));
      } else {}
    }

    return listanimetopku;
  }

  static Future getSearchAnime(String key, int pages) async {
    List<SearchAnime> listanimetopku = [];
    Uri apiUrl =
        Uri.parse("https://api.jikan.moe/v4/anime?letter=$key&page=$pages");
    var apiResult = await http.get(apiUrl);
    if (apiResult.statusCode == 200) {
      var jsonObject = json.decode(apiResult.body);
      List<dynamic> lisuser = (jsonObject as Map<String, dynamic>)['data'];
      for (var i = 0; i < lisuser.length; i++) {
        listanimetopku.add(SearchAnime.createListSearchAnime(lisuser[i]));
      }
    } else {}

    return listanimetopku;
  }
}
