class TopMangaYudho {
  String judul;
  List<GenreManga> genre;
  String? tipe;
  String gambar;
  int? rank;
  String? status;
  int? chapter;
  dynamic skor;
  int? volume;
  String Sinopsis;
  String urlMal;

  TopMangaYudho(
      {this.judul = "",
      this.gambar = "",
      required this.genre,
      required this.urlMal,
      required this.Sinopsis,
      this.chapter = 0,
      this.skor = 1.0,
      required this.status,
      this.volume = 1,
      required this.tipe,
      required this.rank});
  factory TopMangaYudho.CreateListManga(Map<String, dynamic> json) {
    return TopMangaYudho(
        rank: json['rank'],
        judul: json['title'],
        gambar: json['images']['jpg']['image_url'],
        genre: List<GenreManga>.from(
            json['genres'].map((x) => GenreManga.createGenreManga(x))),
        tipe: json['type'],
        Sinopsis: json['synopsis'],
        chapter: json['chapters'],
        skor: json['score'],
        status: json['status'],
        volume: json['volumes'],
        urlMal: json['url']);
  }
}

class GenreManga {
  String genreManga;

  GenreManga({required this.genreManga});

  factory GenreManga.createGenreManga(Map<String, dynamic> json) {
    return GenreManga(genreManga: json['name']);
  }

  Map<String, dynamic> toJson() => {'name': genreManga};
}
