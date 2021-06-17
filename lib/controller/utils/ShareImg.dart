import 'package:share_plus/share_plus.dart';

void shareImg() {
  Share.shareFiles([""], text: "share file");
}

void shareText() {
  Share.share("Great app if you like Waifu");
}
