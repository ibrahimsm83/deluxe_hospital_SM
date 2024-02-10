import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../export_dulex.dart';

class ChooseAccountScreen extends StatelessWidget {
  ChooseAccountScreen({super.key});

  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.secondary,
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Container(
                height: AppSize.sizeHeight(context) * 0.5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(ImageAssets.doctorsImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: AppSize.sizeHeight(context) -
                    (AppSize.sizeHeight(context) * 0.4),
                decoration: BoxDecoration(
                    color: ColorManager.primary,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(AppSize.s30),
                        topRight: Radius.circular(AppSize.s30))),
                // color: Colors.yellow,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 60.0),
                      child: Image.asset(
                        ImageAssets.appLogoImage,
                        height: 210,
                      ),
                    ),

                    Column(
                      children: [
                        button(
                            text: AppStrings.continueOfPatient,
                            color: ColorManager.kLightBlueColor,
                            context: context,
                            onTap: () {
                              userController.setUserRole(UserRole.Patient);
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
                            onTap: () {
                              userController
                                  .setUserRole(UserRole.HealthProfessional);
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                CustomRouteNames.kLoginScreenRoute,
                                    (page) => true,
                              );
                            }),
                      ],
                    ),

                  ]),
                ),
              ),
            )
          ],
        )
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
