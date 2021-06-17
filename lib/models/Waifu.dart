class Waifu {
  late String author, file, previewImg, sample, title;
  late List<Map> fields;

  Waifu({
    required this.author,
    required this.file,
    required this.sample,
    required this.previewImg,
  });

  Waifu.fromMap(Map<String, dynamic> json) {
    title = json["title"];
    fields = json["fields"];
  }
}