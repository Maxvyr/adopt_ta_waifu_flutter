class Waifu {
  String? author, file, previewImg, sample, source;

  Waifu({
    required this.author,
    required this.file,
    required this.sample,
    required this.previewImg,
    required this.source,
  });

  Waifu.fromYandere(dynamic json) {
    author = json["author"] as String?;
    file = json["file_url"] as String?;
    sample = json["sample_url"] as String?;
    previewImg = json["preview_url"] as String?;
    source = json["source"] as String?;
  }

  Waifu.fromGelbooru(dynamic json) {
    author = "unknown";
    file = json["file_url"] as String?;
    sample = json["sample_url"] as String?;
    previewImg = json["preview_url"] as String?;
    source = json["source"] as String?;
  }

  Map<String, dynamic> toJson() {
    return {
      "author": author,
      "file": file,
      "sample": sample,
      "previewImg": previewImg,
      "source": source,
    };
  }
}
