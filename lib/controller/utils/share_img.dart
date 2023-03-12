import 'dart:io';

import 'package:adopt_ta_waifu/controller/constant/strings.dart';
import 'package:adopt_ta_waifu/controller/utils/convert_url_to_file.dart';
import 'package:adopt_ta_waifu/models/waifus.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

void shareImg(Waifu waifu) {
  File imgFile;
  fileFromImageUrl(waifu.file!, waifu.author!).then((file) {
    imgFile = file;
    Share.shareFiles([imgFile.path], text: strBodySharing).then((value) {
      // launch share and hide loading indicator
      EasyLoading.dismiss();
    });
  });
}

void shareText() {
  Share.share(strShareAppText);
}

Future<void> openImgLink(Waifu waifu) async {
  final linkImg = waifu.file!;
  if (await canLaunch(linkImg)) {
    await launch(
      linkImg,
      forceSafariVC: false,
      headers: <String, String>{'my_header_key': 'my_header_value'},
    );
  } else {
    throw 'Could not launch $linkImg';
  }
}
