class AnimeTopYudho {
  List<GenreYudho> genre;
  String gambar;
  String tipe;
  String judul;
  int? episode;
  String Sinopsis;
  String sourcee;
  String durasi;
  String rating;
  int? rank;
  String status;
  String urlMal;
  String? coverLandscapeImage;

  AnimeTopYudho(
      {this.episode = 0,
      this.gambar = "a",
      required this.coverLandscapeImage,
      required this.genre,
      required this.judul,
      required this.Sinopsis,
      required this.sourcee,
      required this.tipe,
      required this.durasi,
      required this.rank,
      required this.status,
      required this.urlMal,
      required this.rating});

  factory AnimeTopYudho.createListAnime(Map<String, dynamic>? json) {
    return AnimeTopYudho(
        episode: json!['episodes'],
        gambar: json['images']['jpg']['image_url'],
        genre: List<GenreYudho>.from(
            json['genres'].map((x) => GenreYudho.createGenre(x))),
        judul: json['title'],
        tipe: json['type'],
        Sinopsis: json['synopsis'],
        sourcee: json['source'],
        durasi: json['duration'],
        rank: json['rank'],
        rating: json['rating'],
        status: json['status'],
        urlMal: json['url'],
        coverLandscapeImage: json['trailer']['images']['medium_image_url']);
  }
}

class GenreYudho {
  String tipegenre;

  GenreYudho({this.tipegenre = "tidak ada"});

  factory GenreYudho.createGenre(Map<String, dynamic> json) {
    return GenreYudho(tipegenre: json['name']);
  }

  Map<String, dynamic> toJson() => {
        'name': tipegenre,
      };
}
