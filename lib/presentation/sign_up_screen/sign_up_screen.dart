import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../export_dulex.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  bool rememberMe = false;

  FocusNode node = FocusNode();
  final _emailController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
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
              SizedBox(height: AppSize.s20.h),
              Text(
                AppStrings.kCreateNewAccount,
                style: getboldStyle(
                    color: ColorManager.secondary,
                    fontSize: ScreenUtil().setSp(AppSize.s24)),
              ),
              SizedBox(height: AppSize.s20.h),
              CustomTextFormField(
                hintText: AppStrings.kFirstName,
                focusNode: node,
                controller: _firstNameController,
                validator: (String? val) {
                  formatNickname();
                      (String? val) {
                    if (val == null || val.isEmpty) {
                      return "Enter First Name";
                    }
                    return null;
                  };
                }
              ),
              SizedBox(height: AppSize.s15.h),
              CustomTextFormField(
                  hintText: AppStrings.kLastName,
                  focusNode: node,
                  controller: _lastNameController,
                  validator: (String? val) {
                    formatNickname();
                        (String? val) {
                      if (val == null || val.isEmpty) {
                        return "Enter Last Name";
                      }
                      return null;
                    };
                  }
              ),
              SizedBox(height: AppSize.s15.h),
              CustomTextFormField(
                  hintText: AppStrings.kEmailHintText,
                  focusNode: node,
                  controller: _emailController,
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
              SizedBox(height: AppSize.s15.h),
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
              Text(AppStrings.kPasswordMustBeAtLeast8Chr, style: getRegularStyle(
                  color: ColorManager.kGreyColor,
                  fontSize: ScreenUtil().setSp(AppSize.s12)),
              ),

              CustomTextFormField(
                hintText: AppStrings.kPhoneNumber,
                focusNode: node,
                controller: _phoneNumberController,
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
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppSize.sizeWidth(context!) * 0.05,
                    vertical: 15.0),
                child: GestureDetector(
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
              ),
              const SizedBox(height: 5),
              SizedBox(height: 10.h),
              button(
                  text: AppStrings.kSignup,
                  color: ColorManager.secondary,
                  context: context,
                  onTap: () {
                    // context.go('/Homepage');

                    /* if (_formKey.currentState!.validate()) {
                      print(_emailController.text);
                      print(_passwordController.text);
                      context.go('/Homepage');
                      CustomSnacksBar.showSnackBar(
                        context,
                        "Login Successfully",
                        icon: Icon(
                          Icons.check,
                          color: ColorManager.whiteColor,
                        ),
                      );
                    }
                    */
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

}
