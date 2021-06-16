import 'package:flutter/material.dart';

const Color lightRed = Color(0xffd64d31);
const Color blue = Colors.blue;
const Color blueMain = Color(0XFF1B5EDF);
const Color green = Colors.green;
const Color lime = Colors.lime;
const Color grey = Colors.black26;
const Color black = Colors.black;
const Color transparent = Colors.transparent;
const Color brown = Colors.brown;

const Color shadowColor = Colors.black45;

const Color colorHint = Color(0xff30395A);
const Color colorTexte = Color(0xff1C2943);

const Color blancAlpha30 = Color(0x4DFFFFFF);
const Color blancAlpha60 = Color(0x80FFFFFF);

final Color colorErreur = Colors.red[700]!;
const Color colorValide = Colors.green;

final Color colorModele1 = Colors.orange[100]!;
final Color colormodele2 = Colors.blue[100]!;
final Color colorModele3 = Colors.purple[100]!;
final Color colorModele4 = Colors.pink[100]!;
final Color colorModele5 = Colors.green[100]!;
final Color colorModele6 = Colors.limeAccent[100]!;

const Color colorTexteFonce = Color(0xff3D3D3D);
const Color colorTexteFonceAlpha50 = Color(0x883D3D3D);
const Color colorTexteClair = Color(0xff666666);

const Color colorBackgroundDark = Color(0xff121212);
const Color colorBackgroundImgBlack = Color(0xff1D1D1D);

const Color colorJulia1 = Color(0xffdc7150);
const Color colorJulia2 = Color(0xffda5f57);
const Color colorJulia3 = Color(0xffd94a5b);
const Color colorJuliaAppBar = Color(0xffD95758);
const Color redAccent = Color(0xffF24C52);

final colorModeleList = [
  colorModele1,
  colormodele2,
  colorModele3,
  colorModele4,
  colorModele5,
  colorModele6,
];

const MaterialColor themeColor = MaterialColor(
  0xffF56B75,
  <int, Color>{
    50: Color(0xFFFEEDEE),
    100: Color(0xFFFCD3D6),
    200: Color(0xFFFAB5BA),
    300: Color(0xFFF8979E),
    350: Color(0xFFF7818A), // only for raised button while pressed in light theme
    400: Color(0xFFF7818A),
    500: Color(0xffF56B75),
    600: Color(0xFFF4636D),
    700: Color(0xFFF25862),
    800: Color(0xFFF04E58),
    850: Color(0xFFF04E58), // only for background color in dark theme
    900: Color(0xFFEE3C45),
  },
);

MaterialColor createMaterialColor(Color color) {
  List<double> strengths = [.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}

//Ajout mobile
const Color red = Color(0xFFF24C52);
const Color primaryDark = Color(0xffECEFFF);
const Color secondarydark = Color(0xffBBBFD2);
const Color tertiaryDark = Color(0xff979BB1);
const Color accentDark = Color(0xff666B84);
const Color accent2 = Color(0xff273464);
const Color primaryLight = Color(0xff16204E);
const Color secondaryLight = Color(0xff495175);
const Color tertiaryLight = Color(0xff6F7592);
const Color accentLight = Color(0xffA1A5B9);
const Color backgroundDark = Color(0xff101735);
const Color dark = Color(0xff090D22);
const Color level1Dark = Color(0xff1D2445);
const Color level2dark = Color(0xff30395A);
const Color backgroundLight = Color(0xffEDEEF3);
const Color level1Light = Color(0xffF3F4F8);
const Color level2Light = Color(0xffF9FAFD);
const Color redNeg = Color(0xFFCE464B);
const Color greenNeg = Color(0xFF2CA099);

const Color text = Color(0xFF0B1647);
const Color degradeBackground = Color(0xFF131C47);
const Color tileColor = Color(0xFF17204A);
const Color white = Colors.white;
const Color whiteBackground = Color(0xFFFAFBFC);
const Color blueLightTerciaire = Color(0xFF7982B1);

// AJOUT Web
const Color web_text = Color(0xFF0B1647);
const Color web_fondCard = Color(0xFF12193A);
const Color web_grisFond = Color(0xFFE5E5E5);
const Color web_rouge = Color(0xFFF24C52);
