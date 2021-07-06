class Waifu {
  late String author, file, previewImg, sample, title;

  Waifu({
    required this.author,
    required this.file,
    required this.sample,
    required this.previewImg,
  });

  Waifu.fromMap(Map<String, dynamic> json) {
    author = json["author"];
    file = json["file_url"];
    sample = json["sample_url"];
    previewImg = json["preview_url"];
  }
}
