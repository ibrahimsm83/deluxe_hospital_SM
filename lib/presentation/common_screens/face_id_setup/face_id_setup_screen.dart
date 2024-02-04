import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../export_dulex.dart';

class FaceIdSetupScreen extends StatelessWidget {
   FaceIdSetupScreen({Key? key}) : super(key: key);
  final UserController userController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text(
          AppStrings.kSetupYourFaceId,
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
              SizedBox(
                height: 30,
              ),
              Center(
                child: Image.asset(ImageAssets.faceIdImage),
              ),
              const SizedBox(height: 80),
              Text(
                AppStrings.kSignInYourAccountQuicklyBYUsingFaceID,
                textAlign: TextAlign.center,
                style: getlightStyle(
                    color: ColorManager.kGreyColor,
                    fontSize: ScreenUtil().setSp(AppSize.s18)),
              ),
              SizedBox(
                height: AppSize.sizeHeight(context) * 0.1,
              ),
              button(
                  text: AppStrings.kContinue,
                  color: ColorManager.secondary,
                  context: context,
                  onTap: () {
                    _showCongratsDialog(context);
                  }),
              const SizedBox(height: 10.0),
              button(
                  text: AppStrings.kSkip,
                  color: ColorManager.kLightBlackColor,
                  context: context,
                  onTap: () {
                    //Home page
                    Navigator.pushNamed(
                      context,
                      CustomRouteNames.kDashboardScreenRoute,
                    );
                  }),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  void _showCongratsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Theme(
          data: Theme.of(context).copyWith(
            dialogBackgroundColor: Colors.lightBlueAccent,
            // Change dialog background color
          ),
          child: AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(ImageAssets.doneImage),
                SizedBox(height: 10),
                Text(
                  AppStrings.kCongratulations,
                  style: getboldStyle(
                      color: ColorManager.kWhiteColor,
                      fontSize: ScreenUtil()
                          .setSp(AppSize.s24)), // Change title color
                ),
                SizedBox(height: 10),
                Text(
                  AppStrings.kYourAccountIsReadyToUse,
                  textAlign: TextAlign.center,
                  style: getRegularStyle(
                      color: ColorManager.kWhiteColor,
                      fontSize: ScreenUtil()
                          .setSp(AppSize.s16)), // Change title color
                ),
                SizedBox(
                  height: AppSize.sizeHeight(context) * 0.02,
                ),
                SpinKitCircle(
                  color: ColorManager.kWhiteColor,
                  size: 60.0,
                ),
                SizedBox(
                  height: AppSize.sizeHeight(context) * 0.03,
                ),
                button(
                    text: AppStrings.kContinue,
                    color: ColorManager.kLightBlueColor,
                    context: context,
                    onTap: () {
                      //Home page navigator
                      if(userController.userRole.value== UserRole.Patient){
                        Navigator.pushNamed(
                          context,
                          CustomRouteNames.kDashboardScreenRoute,
                        );
                      }
                      else{
                        CustomSnacksBar.showSnackBar(
                          context,
                          "HealthCare Dashboard Not Found",
                          icon: Icon(
                            Icons.check,
                            color: ColorManager.kWhiteColor,
                          ),
                        );
                        // Navigator.pushNamed(
                        //   context,
                        //   CustomRouteNames.kProfessionalInformationScreenRoute,
                        // );
                      }

                    }),
              ],
            ),

            // actions: [
            //   TextButton(
            //     onPressed: () {
            //       Navigator.of(context).pop(); // Close the dialog
            //     },
            //     child: GestureDetector(
            //         onTap: () {
            //           // Navigate to the sign-up screen when "Sign up" is clicked
            //           //    Get.to(() => homeScreen());
            //         },
            //         child: Text('Close')),
            //   ),
            // ],
          ),
        );
      },
    );
  }

}
