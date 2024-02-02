import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:async';
import '../resources/export_resources.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final GlobalKey<ScaffoldState> screenKey = GlobalKey<ScaffoldState>();
  Timer? _timer;

  _startDelay() {
    _timer = Timer(Duration(seconds: 5), _goNext);
  }

  _goNext() {
    print("Splash screen");
    Navigator.pushNamedAndRemoveUntil(
      context,
      CustomRouteNames.kChooseAccountScreenRoute,
          (page) => false,
    );
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(top:AppSize.sizeWidth(context) * 0.3,
                  left: AppSize.sizeWidth(context) * 0.2, right: AppSize.sizeWidth(context) * 0.2),
              child: Image.asset(
                ImageAssets.appLogoImage,
              ),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SpinKitCircle(
                  color: ColorManager.secondary,
                  size: 60.0,
                ),
                SizedBox(height: 80.h),
                Text(
                  AppStrings.productOf,
                  style: getsemiboldStyle(color: ColorManager.kGreyColor),
                ),
                Padding(
                  padding:  EdgeInsets.only(bottom: 20.h),
                  child: Text(
                    AppStrings.millionDollarGlobalInitiatives,
                    style: getboldStyle(
                        color: ColorManager.secondary, fontSize: FontSize.s18),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
