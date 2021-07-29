import 'package:adopt_ta_waifu/models/waifus.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  //variable
  final _json = {
    "id": 329776,
    "tags": "blue_archive ichinose_asuna kakudate_karin tamada_heijun",
    "created_at": 1627569045,
    "creator_id": 181250,
    "author": "BattlequeenYume",
    "change": 2032762,
    "source": "",
    "score": 3,
    "md5": "da0ef90513bfb1a50853befec5d4006f",
    "file_size": 8126607,
    "file_url":
        "https://konachan.com/image/da0ef90513bfb1a50853befec5d4006f/Konachan.com%20-%20329776%20blue_archive%20ichinose_asuna%20kakudate_karin%20tamada_heijun.png",
    "is_shown_in_index": true,
    "preview_url":
        "https://konachan.com/data/preview/da/0e/da0ef90513bfb1a50853befec5d4006f.jpg",
    "preview_width": 150,
    "preview_height": 106,
    "actual_preview_width": 300,
    "actual_preview_height": 212,
    "sample_url":
        "https://konachan.com/sample/da0ef90513bfb1a50853befec5d4006f/Konachan.com%20-%20329776%20sample.jpg",
    "sample_width": 1500,
    "sample_height": 1061,
    "sample_file_size": 715252,
    "jpeg_url":
        "https://konachan.com/jpeg/da0ef90513bfb1a50853befec5d4006f/Konachan.com%20-%20329776%20blue_archive%20ichinose_asuna%20kakudate_karin%20tamada_heijun.jpg",
    "jpeg_width": 4093,
    "jpeg_height": 2894,
    "jpeg_file_size": 1442537,
    "rating": "e",
    "has_children": false,
    "parent_id": 329775,
    "status": "active",
    "width": 4093,
    "height": 2894,
    "is_held": false,
    "frames_pending_string": "",
    "frames_pending": [],
    "frames_string": "",
    "frames": []
  };
  const _authorBase = "BattlequeenYume";
  const _sourceBase = "";
  const _previewImgBase =
      "https://konachan.com/data/preview/da/0e/da0ef90513bfb1a50853befec5d4006f.jpg";
  const _sampleBase =
      "https://konachan.com/sample/da0ef90513bfb1a50853befec5d4006f/Konachan.com%20-%20329776%20sample.jpg";
  const _fileBase =
      "https://konachan.com/image/da0ef90513bfb1a50853befec5d4006f/Konachan.com%20-%20329776%20blue_archive%20ichinose_asuna%20kakudate_karin%20tamada_heijun.png";

  test("build Waifu", () {
    // init var
    final waifu = Waifu(
      author: _authorBase,
      file: _fileBase,
      sample: _sampleBase,
      previewImg: _previewImgBase,
      source: _sourceBase,
    );
    // expect
    expect(waifu.author, _authorBase);
    expect(waifu.file, _fileBase);
    expect(waifu.sample, _sampleBase);
    expect(waifu.previewImg, _previewImgBase);
    expect(waifu.source, _sourceBase);
  });

  test("build Waifu from Konachan", () {
    // init var
    final waifu = Waifu.fromKonachan(_json);
    // expect
    expect(waifu.author, _authorBase);
    expect(waifu.file, _fileBase);
    expect(waifu.sample, _sampleBase);
    expect(waifu.previewImg, _previewImgBase);
    expect(waifu.source, _sourceBase);
  });

  test("build Waifu from Yandere", () {
    // init var
    final waifu = Waifu.fromYandere(_json);
    // expect
    expect(waifu.author, _authorBase);
    expect(waifu.file, _fileBase);
    expect(waifu.sample, _sampleBase);
    expect(waifu.previewImg, _previewImgBase);
    expect(waifu.source, _sourceBase);
  });

  test("build Waifu from Gelbooru", () {
    // init var
    final waifu = Waifu.fromGelbooru(_json);
    // expect
    expect(waifu.author, "unknown");
    expect(waifu.file, _fileBase);
    expect(waifu.sample, _sampleBase);
    expect(waifu.previewImg, _previewImgBase);
    expect(waifu.source, _sourceBase);
  });

  test("Waifu to Json", () {
    // init var
    final waifu = Waifu(
      author: _authorBase,
      file: _fileBase,
      sample: _sampleBase,
      previewImg: _previewImgBase,
      source: _sourceBase,
    );
    final jsonWaifu = waifu.toJson();
    // expect
    expect(jsonWaifu["author"], _authorBase);
    expect(jsonWaifu["file"], _fileBase);
    expect(jsonWaifu["sample"], _sampleBase);
    expect(jsonWaifu["previewImg"], _previewImgBase);
    expect(jsonWaifu["source"], _sourceBase);
  });
}
