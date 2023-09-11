class Schedule {
  String url;
  String gambar;
  String judul;
  List<Genreku> genre;

  Schedule(
      {required this.url,
      required this.gambar,
      required this.genre,
      required this.judul});

  factory Schedule.createListSchedule(Map<String, dynamic> json) {
    return Schedule(
        url: json['url'],
        gambar: json['images']['jpg']['image_url'],
        genre: List<Genreku>.from(
            json['genres'].map((x) => Genreku.createGenreSchedule(x))),
        judul: json['title']);
  }
}

class Genreku {
  String genrenya;

  Genreku({required this.genrenya});

  factory Genreku.createGenreSchedule(Map<String, dynamic> json) {
    return Genreku(genrenya: json['name']);
  }

  Map<String, dynamic> toJson() => {'name': genrenya};
}
