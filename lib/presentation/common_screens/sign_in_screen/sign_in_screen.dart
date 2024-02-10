import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../export_dulex.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  bool rememberMe = false;
  final UserController userController = Get.find();
  FocusNode node = FocusNode();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    node.addListener(() {
      if (!node.hasFocus) {
        formatNickname();
      }
    });
    super.initState();
  }

  void formatNickname() {
    _emailController.text = _emailController.text.replaceAll(" ", "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.all(20.0),
          child: InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: SvgPicture.asset(ImageAssets.arrowLeftIcon)),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppLogoView(),
              SizedBox(height: AppSize.sizeHeight(context)*0.05),
              Text(
                AppStrings.kLoginToYourAccount,
                style: getboldStyle(
                    color: ColorManager.secondary,
                    fontSize: ScreenUtil().setSp(AppSize.s20)),
              ),
              SizedBox(height: AppSize.s30.h),
              CustomTextFormField(
                hintText: AppStrings.kEmailHintText,
                focusNode: node,
                controller: _emailController,

                //fillColor: ColorManager.primarydarkColor,
                validator: (String? val) {
                  formatNickname();
                  if (val == null || val.isEmpty) {
                    return AppStrings.enterEmailAddress;
                  } else if (val.isValidEmail) {
                    return null;
                  }
                  return 'Invalid Email';
                },
              ),
              SizedBox(height: AppSize.s20.h),
              CustomTextFormField(
                controller: _passwordController,
                obscureText: true,
                hintText: AppStrings.kPasswordHintText,
                validator: (String? val) {
                  if (val == null || val.isEmpty) {
                    return AppStrings.enterPassword;
                  } else if (val.isValidPassword) {
                    return null;
                  }
                  return AppStrings.passwordvalidator;
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppSize.sizeWidth(context!) * 0.05,
                    vertical: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        //screenBloc.add(ToggleRememberMeEvent());
                      },
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            height: 18.h,
                            width: 19.w,
                            child: Checkbox(
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              activeColor: ColorManager.secondary,
                              hoverColor: Colors.blue,
                              checkColor: ColorManager.kWhiteColor,
                              value: false,
                              onChanged: (_) {
                                // screenBloc.add(ToggleRememberMeEvent());
                              },
                            ),
                          ),
                          // ),
                          const SizedBox(width: 5.0),
                          Text(
                            AppStrings.kShowPassword,
                            style: getRegularStyle(
                                color: ColorManager.kGreyColor,
                                fontSize: ScreenUtil().setSp(AppSize.s12)),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 0.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            CustomRouteNames.kForgotPasswordScreenRoute,
                          );
                        },
                        child: Text(
                          AppStrings.kForgotPassword,
                          style: getmediumStyle(
                              color: ColorManager.secondary,
                              fontSize: ScreenUtil().setSp(AppSize.s13)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppSize.sizeHeight(context)*0.05),
              button(
                  text: AppStrings.kSignIn,
                  color: ColorManager.secondary,
                  context: context,
                  onTap: () {
                    if (userController.userRole.value == UserRole.Patient) {
                      Navigator.pushNamed(
                        context,
                        CustomRouteNames.kDashboardScreenRoute,
                      );
                    } else {
                      Navigator.pushNamed(
                        context,
                        CustomRouteNames.kDashboardScreenRoute,
                      );
                    }
                    // CustomSnacksBar.showSnackBar(
                    //   context,
                    //   "HealthCare Dashboard Not Found",
                    //   icon: Icon(
                    //     Icons.check,
                    //     color: ColorManager.kWhiteColor,
                    //   ),
                    // );
                    //}

                    //  if (_formKey.currentState!.validate()) {
                    //   print(_emailController.text);
                    //   print(_passwordController.text);
                    //
                    //   CustomSnacksBar.showSnackBar(
                    //     context,
                    //     "Login Successfully",
                    //     icon: Icon(
                    //       Icons.check,
                    //       color: ColorManager.kWhiteColor,
                    //     ),
                    //   );
                    // }
                  }),
              SizedBox(height: 10.h),
              textspan(
                  text1: AppStrings.kYouDontHaveAnAccount,
                  text2: AppStrings.kSignup,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      CustomRouteNames.kSignUpScreenRoute,
                    );
                  }),
            ],
          ),
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

  Widget textspan(
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
}
