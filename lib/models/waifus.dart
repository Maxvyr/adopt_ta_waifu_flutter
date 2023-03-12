class Waifu {
  Waifu({
    required this.author,
    required this.file,
    required this.sample,
    required this.previewImg,
    required this.source,
  });
  Waifu.fromGelbooru(Map<String, dynamic> json) {
    author = "unknown";
    file = json["file_url"] as String?;
    sample = json["sample_url"] as String?;
    previewImg = json["preview_url"] as String?;
    source = json["source"] as String?;
  }

  Waifu.fromYandere(Map<String, dynamic> json) {
    author = json["author"] as String?;
    file = json["file_url"] as String?;
    sample = json["sample_url"] as String?;
    previewImg = json["preview_url"] as String?;
    source = json["source"] as String?;
  }

  Waifu.fromKonachan(Map<String, dynamic> json) {
    author = json["author"] as String?;
    file = json["file_url"] as String?;
    sample = json["sample_url"] as String?;
    previewImg = json["preview_url"] as String?;
    source = json["source"] as String?;
  }
  String? author, file, previewImg, sample, source;

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
