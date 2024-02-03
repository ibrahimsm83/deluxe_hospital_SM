import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../export_dulex.dart';


class OtpCodeVerificationScreen extends StatefulWidget {
  String? email;
   OtpCodeVerificationScreen({super.key,this.email});

  @override
  State<OtpCodeVerificationScreen> createState() => _OtpCodeVerificationScreenState();
}

class _OtpCodeVerificationScreenState extends State<OtpCodeVerificationScreen> {
  TextEditingController textEditingController = TextEditingController();
  StreamController<ErrorAnimationType>? errorController;
  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }
  // snackBar Widget
  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: const Duration(seconds: 2),
      ),
    );
  }
  @override
  void dispose() {
    errorController!.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text(AppStrings.otpCodeVerification,style: getboldStyle(color: ColorManager.secondary,fontSize:  ScreenUtil().setSp(AppSize.s18) ),),
        leading: Padding(
          padding: const EdgeInsets.all(20.0),
          child: InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: SvgPicture.asset(ImageAssets.arrowLeftIcon)),
        ),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            child: Column(
              children: [
                headingText(),

                SizedBox(height: AppSize.sizeHeight(context) * 0.06),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppSize.sizeWidth(context) * 0.12),
                  child: PinCodeTextField(
                    appContext: context,
                    length: 4,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    keyboardType: TextInputType.number,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    pinTheme: PinTheme(
                      inactiveColor: ColorManager.kGreyColor,
                      inactiveFillColor: ColorManager.primary,
                      selectedFillColor: ColorManager.primary,
                      shape: PinCodeFieldShape.box,
                      activeColor: ColorManager.secondary,
                      errorBorderColor: ColorManager.kRedColor,
                      borderRadius: BorderRadius.circular(10),
                      fieldHeight: 50,
                      fieldWidth: 50,
                      activeFillColor: ColorManager.secondary,
                    ),
                    animationDuration: Duration(milliseconds: 300),
                    enableActiveFill: true,
                    errorAnimationController: errorController,
                    controller: textEditingController,
                    onCompleted: (v) {
                      print("Completed");
                    },
                    onChanged: (value) {
                      print(value);
                      setState(() {
                        currentText = value;
                      });
                    },
                    beforeTextPaste: (text) {
                      print("Allowing to paste $text");
                      //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                      //but you can show anything you want here, like your pop up saying wrong paste format or etc
                      return true;
                    },
                  ),
                ),

                textSpan(
                    text1: AppStrings.kResendCodeIn,
                    text2: "53s",
                    onTap: () {
                      // Navigator.pushNamed(
                      //   context,
                      //   CustomRouteNames.kSignUpScreenRoute,
                      // );
                    }),
                SizedBox(height: AppSize.sizeHeight(context) * 0.4),

                button(
                    text: AppStrings.kVerify,
                    color: ColorManager.secondary,
                    context: context,
                    onTap: () {
                      // CustomSnacksBar.showSnackBar(
                      //   context,
                      //   "OTP Verified!!",
                      //   icon: Icon(
                      //     Icons.check,
                      //     color: ColorManager.kWhiteColor,
                      //   ),
                      // );

                      if (currentText.length != 4 || currentText != "1234") {
                        errorController!.add(ErrorAnimationType
                            .shake);
                        // Triggering error shake animation
                        setState(() => hasError = true);
                        CustomSnacksBar.showSnackBar(
                          context,
                          "Enter OTP code  1234",
                          icon: Icon(
                            Icons.check,
                            color: ColorManager.kWhiteColor,
                          ),
                        );
                      } else {
                        setState(
                          () {
                            hasError = false;
                            CustomSnacksBar.showSnackBar(
                              context,
                              "OTP Verified!!",
                              icon: Icon(
                                Icons.check,
                                color: ColorManager.kWhiteColor,
                              ),
                            );
                            Navigator.pushNamed(
                              context,
                              CustomRouteNames.kPersonalInformationScreenRoute,
                            );
                            //context.push('/Personalisation');
                          },
                        );
                      }

                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget  headingText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          AppStrings.kCodeHasBeenSendTo,
          style: getlightStyle(
              color: ColorManager.kGreyColor,
              fontSize: ScreenUtil().setSp(AppSize.s16)),
        ),
        const SizedBox(width: 2.0),
        Text(
          widget.email ?? "",
          style: getRegularStyle(
              color: ColorManager.secondary,
              fontSize: ScreenUtil().setSp(AppSize.s14)),
        ),
      ],
    );
  }
}


Widget textSpan(
    {String? text1,
      String? text2,
      BuildContext? context,
      Function()? onTap}) {
  return Container(
    padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p14, vertical: AppPadding.p20),
    child: RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: text1,
        style: getRegularStyle(
            color: ColorManager.kGreyColor,
            fontSize: ScreenUtil().setSp(AppSize.s12)),
        children: <TextSpan>[
          TextSpan(
              text: text2,
              style: TextStyle(
                  color: ColorManager.secondary,
                  fontFamily: FontConstants.fontFamily,
                  fontWeight: FontWeightManager.bold,
                  fontSize: ScreenUtil().setSp(AppSize.s12)),
              recognizer: TapGestureRecognizer()..onTap = onTap)
        ],
      ),
    ),
  );
}

Widget button(
    {Function()? onTap, String? text, Color? color, BuildContext? context}) {
  return Padding(
    padding: EdgeInsets.symmetric(
        horizontal: AppSize.sizeWidth(context!) * 0.05, vertical: 8.0),
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
Container buildOtpTextFieldContainer() {
  return Container(
    height: 80,
    width: 80,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      border: Border.all(color: Colors.grey, width: 2),
    ),
    child: TextField(
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 28, color: Colors.lightBlueAccent),
      keyboardType: TextInputType.number,
      maxLength: 1,
      decoration: InputDecoration(
        counterText: "", // Remove the built-in counter
        border: InputBorder.none,
        contentPadding: EdgeInsets.zero,
      ),
    ),
  );
}
