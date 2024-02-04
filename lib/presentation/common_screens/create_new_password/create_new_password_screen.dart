

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../export_dulex.dart';

class CreateNewPasswordScreen extends StatefulWidget {
   CreateNewPasswordScreen({Key? key}) : super(key: key);

  @override
  State<CreateNewPasswordScreen> createState() => _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  final _newPasswordController = TextEditingController();

  final _confirmNewPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text(
          AppStrings.kCreateANewPassword,
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
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: AppSize.s15.h),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                AppStrings.kCreateYourNewPassword,
                textAlign: TextAlign.left,
                style: getlightStyle(
                    color: ColorManager.kGreyColor,
                    fontSize: ScreenUtil().setSp(AppSize.s16)),
              ),
            ),
            // SizedBox(
            //   height: AppSize.sizeHeight(context) * 0.1,
            // ),

            SizedBox(height: AppSize.s15.h),
            CustomTextFormField(
              controller: _newPasswordController,
              obscureText: true,
              hintText: AppStrings.kNewPasswordHintText,
              validator: (String? val) {
                if (val == null || val.isEmpty) {
                  return AppStrings.enterPassword;
                } else if (val.isValidPassword) {
                  return null;
                }
                return AppStrings.passwordvalidator;
              },
            ),
            SizedBox(height: AppSize.s15.h),
            CustomTextFormField(
              controller: _confirmNewPasswordController,
              obscureText: true,
              hintText: AppStrings.kConfirmNewPasswordHintText,
              validator: (String? val) {
                if (val == null || val.isEmpty) {
                  return AppStrings.enterPassword;
                } else if (val.isValidPassword) {
                  return null;
                }
                return AppStrings.passwordvalidator;
              },
            ),
            Spacer(),
            button(
                text: AppStrings.kContinue,
                color: ColorManager.secondary,
                context: context,
                onTap: () {
                  //Otp Screen
                  if (_formKey.currentState!.validate()) {
                    if(_newPasswordController.text !=_confirmNewPasswordController.text){
                      CustomSnacksBar.showSnackBar(
                        context,
                        "Password not matched",
                        icon: Icon(
                          Icons.error,
                          color: ColorManager.kWhiteColor,
                        ),
                      );
                    }else{
                      _showCongratsDialog(context);

                    }

                  }
                }),
            SizedBox(
              height: AppSize.sizeHeight(context) * 0.1,
            ),
          ],
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
                       // Navigator.pushNamed(
                       //   context,
                       //   CustomRouteNames.kOtpVerificationScreenRoute,
                       //
                       //   ),
                       // );
                     }),
               ],
             ),
           ),
         );
       },
     );
   }
}
