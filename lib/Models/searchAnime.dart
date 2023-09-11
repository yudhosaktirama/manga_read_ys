class SearchAnime {
  String gambar;
  String judul;
  String tipe;
  String url;

  SearchAnime(
      {required this.gambar,
      required this.judul,
      required this.tipe,
      required this.url});

  factory SearchAnime.createListSearchAnime(Map<String, dynamic> json) {
    return SearchAnime(
        gambar: json['images']['jpg']['image_url'],
        judul: json['title'],
        tipe: json['type'],
        url: json['url']);
  }
}
