class Rekomendasi {
  List<Entry> rekomendasiSaya;

  Rekomendasi({required this.rekomendasiSaya});

  factory Rekomendasi.CreateRekomendasiJSON(Map<String,dynamic> json){
    return Rekomendasi(
      rekomendasiSaya: List<Entry>.from(json['entry'].map((x) => Entry.CreateEntryJson(x)))
      );
  }
}

class Entry {
  int malId;
  String gambar;
  String judul;

  Entry({required this.gambar, required this.judul, required this.malId});

  factory Entry.CreateEntryJson(Map<String, dynamic> json) {
    return Entry(
        gambar: json['images']['jpg']['image_url'],
        judul: json['title'],
        malId: json['mal_id']);
  }

  Map<String, dynamic> toJson() =>
      {'image_url': gambar, 'title': judul, 'mal_id': malId};
}
