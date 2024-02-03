
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../export_dulex.dart';
import '../../model/otp_screen_argument_Model.dart';

class ForgotPasswordScreen extends StatefulWidget {
   ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text(
          AppStrings.kForgotPasswords,
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
              AppStrings.kEnterYourEmailToSendYouOtp,
              textAlign: TextAlign.left,
              style: getlightStyle(
                  color: ColorManager.kGreyColor,
                  fontSize: ScreenUtil().setSp(AppSize.s16)),
            ),
          ),
           SizedBox(height: AppSize.s15.h),
          CustomTextFormField(
            hintText: AppStrings.kEmailHintText,
           // controller: _emailController,
            validator: (String? val) {
              if (val == null || val.isEmpty) {
                return AppStrings.enterEmailAddress;
              } else if (val.isValidEmail) {
                return null;
              }
              return 'Invalid Email';
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
              Navigator.pushNamed(
                context,
                CustomRouteNames.kOtpVerificationScreenRoute,
                arguments: OtpScreenArgumentModel.required(
                  email: _emailController.text,
                  isForgotPwPage: true
                ),
              );
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
}
