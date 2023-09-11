class RandomAnime {
  String gambar;
  String judul;
  String tipe;
  String url;

  RandomAnime(
      {required this.gambar,
      required this.judul,
      required this.tipe,
      required this.url});

  factory RandomAnime.createRandomAnime(Map<String, dynamic> json) {
    return RandomAnime(
        gambar: json['images']['jpg']['image_url'],
        judul: json['title'],
        tipe: json['type'],
        url: json['url']);
  }
}
