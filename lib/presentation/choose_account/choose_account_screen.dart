import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../export_dulex.dart';

class ChooseAccountScreen extends StatelessWidget {
  const ChooseAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.secondary,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            const SizedBox(height: 20),
            Center(child: Image.asset(ImageAssets.doctorsImage)),
            Container(
              margin: EdgeInsets.only(top: AppSize.sizeHeight(context) * 0.38),
              height: AppSize.sizeHeight(context) / 1.2,
              decoration: BoxDecoration(
                  color: ColorManager.primary,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(AppSize.s30),
                      topRight: Radius.circular(AppSize.s30))),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 35),
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: Image.asset(
                        ImageAssets.appLogoImage,
                      ),
                    ),
                    // Add some spacing
                    SizedBox(height: 30.h),
                    button(
                        text: AppStrings.continueOfPatient,
                        color: ColorManager.kLightBlueColor,
                        context: context,
                        onTap: () {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            CustomRouteNames.kLoginScreenRoute,
                                (page) => true,
                          );
                        }),

                    button(
                        text: AppStrings.continueAsAHealthProfessional,
                        color: ColorManager.secondary,
                        context: context,
                        onTap: () {}),
                  ],
                ),
              ),
            ),
            //
          ],
        ),
      ),
    );
  }

  Widget button(
      {Function()? onTap, String? text, Color? color, BuildContext? context}) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppSize.sizeWidth(context!) * 0.02, vertical: 8.0),
      child: CustomButton(
          color: color!,
          text: text ?? "",
          style: getboldStyle(
            color: ColorManager.kWhiteColor,
            fontSize: AppSize.s14.sp,
          ),
          onTap: onTap),
    );
  }
}
