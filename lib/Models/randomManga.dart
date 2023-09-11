class RandomManga {
  String gambar;
  String judul;
  String tipe;
  String url;

  RandomManga(
      {required this.gambar,
      required this.judul,
      required this.tipe,
      required this.url});

  factory RandomManga.createRandomManga(Map<String, dynamic> json) {
    return RandomManga(
        gambar: json['images']['jpg']['image_url'],
        judul: json['title'],
        tipe: json['type'],
        url: json['url']);
  }
}
