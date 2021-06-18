class Waifu {
  late String author, file, previewImg, sample, title;
  late List<Map> fields;

  Waifu({
    required this.author,
    required this.file,
    required this.sample,
    required this.previewImg,
  });

  // Waifu.fromMap(Map<String, dynamic> json) {
  //   title = json["title"];
  //   fields = json["fields"];

  //   fields.forEach((element) {
  //     author = element["author"];
  //     file = element["file"];
  //     sample = element["sample"];
  //     previewImg = element["preview_img"];
  //   });
  // }

  Waifu.fromMap(Map<String, dynamic> json) {
    author = json["author"];
    file = json["file"];
    sample = json["sample"];
    previewImg = json["preview_img"];
  }
}
