import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../export_dulex.dart';

class FingerPrintSetupScreen extends StatelessWidget {
  const FingerPrintSetupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text(
          AppStrings.kSetupYourFingerPrint,
          style: getboldStyle(
              color: ColorManager.secondary,
              fontSize: ScreenUtil().setSp(AppSize.s18)),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(20.0),
          child: InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: SvgPicture.asset(ImageAssets.arrowLeftIcon)),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: Column(
            children: [
              Text(
                AppStrings.kAddFingerPrintToMake,
                textAlign: TextAlign.center,
                style: getlightStyle(
                    color: ColorManager.kGreyColor,
                    fontSize: ScreenUtil().setSp(AppSize.s18)),
              ),
              SizedBox(height: 20),
              Center(
                child: Image.asset(ImageAssets.fingerPrintImage),
              ),
              SizedBox(
                height: AppSize.sizeHeight(context)*0.05,
              ),
              Text(
                AppStrings.kPleasePutYourFingerOnThe,
                textAlign: TextAlign.center,
                style: getlightStyle(
                    color: ColorManager.kGreyColor,
                    fontSize: ScreenUtil().setSp(AppSize.s18)),
              ),
              SizedBox(
                height: AppSize.sizeHeight(context)*0.1,
              ),
              button(
                  text: AppStrings.kContinue,
                  color: ColorManager.secondary,
                  context: context,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      CustomRouteNames.kFaceIdSetupScreenRoute,
                    );
                  }),
             const SizedBox(height: 10.0),
              button(
                  text: AppStrings.kSkip,
                  color: ColorManager.kLightBlackColor,
                  context: context,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      CustomRouteNames.kFaceIdSetupScreenRoute,
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
