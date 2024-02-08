import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../export_dulex.dart';

class PayForSomeOneScreen extends StatelessWidget {
  const PayForSomeOneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          AppStrings.kPayForSomeone,
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.kEnterTheCode,
              style: getboldStyle(
                  color: ColorManager.secondary,
                  fontSize: ScreenUtil().setSp(AppSize.s14)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                AppStrings.kEnterTheCopyWhichWasSentToYou,
                style: getRegularStyle(
                    color: ColorManager.kWhiteColor,
                    fontSize: ScreenUtil().setSp(AppSize.s12)),
              ),
            ),
            SizedBox(
              height: 55,
              child: TextField(
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: ColorManager.kGreyColor,
                    ),
                  ),
                  labelText: AppStrings.kEnterTheCode,
                  labelStyle: getRegularStyle(
                    color: ColorManager.kGreyColor,
                  ),
                ),
              ),
            ),
            Spacer(),
            button(
                text: AppStrings.kNext,
                color: ColorManager.secondary,
                context: context,
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    CustomRouteNames.kPayForSomeOneTwoScreenRoute,
                  );
                }),
            SizedBox(height: 50.0),
          ],
        ),
      ),
    );
  }
}
