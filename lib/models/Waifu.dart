class Waifu {
  late String author, file, previewImg, sample, title;
  late List<Map> fields;

  Waifu.fromMap(Map<String, dynamic> json) {
    title = json["title"];
    fields = json["fields"];
  }
}
