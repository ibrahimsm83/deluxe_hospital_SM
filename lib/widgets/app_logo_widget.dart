import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../export_dulex.dart';



class AppLogoView extends StatelessWidget {
  const AppLogoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSize.sizeWidth(context) * 0.2),
      child: Container(
        alignment: Alignment.center,
        child: Image.asset(
          ImageAssets.appLogoImage,
        ),
      ),
    );
  }
}