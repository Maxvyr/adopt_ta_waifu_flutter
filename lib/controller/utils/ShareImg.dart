import 'dart:io';

import 'package:adopt_ta_waifu/controller/constant/Strings.dart';
import 'package:adopt_ta_waifu/controller/utils/ConvertUrlToFile.dart';
import 'package:adopt_ta_waifu/models/Waifu.dart';
import 'package:share_plus/share_plus.dart';

void shareImg(Waifu waifu) {
  File imgFile;
  fileFromImageUrl(waifu.file, waifu.author).then((file) {
    imgFile = file;
    Share.shareFiles([imgFile.path], text: strBodySharing);
  });
}

void shareText() {
  Share.share(strShareAppText);
}
