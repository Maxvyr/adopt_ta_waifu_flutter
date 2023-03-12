import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

Future<File> fileFromImageUrl(String imgUrl, String author) async {
  // file name
  final String fileName = "author_$author.jpeg";
  // get for return image bytes
  final reponse = await http.get(Uri.parse(imgUrl));
  // recover app directory
  final docDirectory = await getApplicationDocumentsDirectory();
  // create file
  // and write body return for get in file
  final file = File(join(docDirectory.path, fileName))
    ..writeAsBytesSync(reponse.bodyBytes);
  // return file
  return file;
}
