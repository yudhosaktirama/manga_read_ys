class RekomendasiManga {
  List<Entry> rekomendasiSaya;

  RekomendasiManga({required this.rekomendasiSaya});

  factory RekomendasiManga.CreateRekomendasiJSON(Map<String, dynamic> json) {
    return RekomendasiManga(
        rekomendasiSaya: List<Entry>.from(
            json['entry'].map((x) => Entry.CreateEntryJson(x))));
  }
}

class Entry {
  int malId;
  String url;
  String gambar;
  String judul;

  Entry({required this.gambar, required this.judul, required this.url, required this.malId});

  factory Entry.CreateEntryJson(Map<String, dynamic> json) {
    return Entry(
        gambar: json['images']['jpg']['image_url'],
        judul: json['title'],
        url: json['url'],
        malId: json['mal_id']);
  }

  Map<String, dynamic> toJson() =>
      {'image_url': gambar, 'title': judul, 'url': url};
}
