import 'package:flutter/material.dart';

class ColorManager {
  static Color primary = const Color(0xff0C1A32);
  static Color secondary = const Color(0xff00CAFD);
  static Color kLightBlueColor = const Color(0xff255899);
  static Color kLightBlueColor1 = const Color(0xff2F579A);
  static Color kWhiteColor = Colors.white;
  static Color kBlackColor = Colors.black;
  static Color kRedColor = Colors.red;
  static Color kGreyColor = const Color(0xffB5B5C3);
  static Color kLightBlackColor = const Color(0xff5F5F6B);
  static Color kGreenColor = const Color(0xff1CA046);
  static Color kStarColor = const Color(0xffFFAD0A);
  static Color kDarkGreyColor = const Color(0xff6F6F6F);
  static Color kbtnBgColor = const Color(0xff707070);
  static Color textInputColor = const Color(0xff1F2024);
  static Color dialogBoxColor = const Color(0xff00CCFF);
  // static Color subheadingColor = const Color(0xff71727A);
  // static Color borderColor = const Color(0xffC5C6CC);
  // static Color redColor = const Color(0xffED3241);
  // static Color appleColor = const Color(0xff1F2024);
  // static Color selectedColor = const Color(0xffE5F9F9);
  // static Color unselectedIconColor = const Color(0xffD4D6DD);
  // static Color unselectedSizeColor = const Color(0xffEAF2FF);


  static Color seacrhFilledColor = const Color(0xffF8F9FE);
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF" + hexColorString; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}