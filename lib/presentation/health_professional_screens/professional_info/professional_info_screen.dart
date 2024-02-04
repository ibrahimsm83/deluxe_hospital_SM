import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../export_dulex.dart';

class ProfessionalInformationScreen extends StatefulWidget {
  const ProfessionalInformationScreen({Key? key}) : super(key: key);

  @override
  State<ProfessionalInformationScreen> createState() =>
      _ProfessionalInformationScreenState();
}

class _ProfessionalInformationScreenState
    extends State<ProfessionalInformationScreen> {
  final formKey = GlobalKey<FormState>();
  final _registrationNumberController = TextEditingController();
  final _workPlaceController = TextEditingController();
  final _licenseAuthorityController = TextEditingController();
  final _degreeController = TextEditingController();
  final _institutionController = TextEditingController();
  final _yearOfExperienceController = TextEditingController();
  final _addBioController = TextEditingController();
  // final UserController userController = Get.find();
  // Initial value
  String? selectProfession;
  String? selectRank;
  // GlobalKey<CSCPickerState> _cscPickerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text(
          AppStrings.kProfessionalInformation,
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
        child: Form(
          key: formKey,
          child: Column(
            children: [
              selectProfessionWidget(),
              SizedBox(height: AppSize.s15.h),
              selectSpecialityRankWidget(),
              SizedBox(height: AppSize.s15.h),
              CustomTextFormField(
                  hintText: AppStrings.kLicensingAuthority,
                  controller: _licenseAuthorityController,
                  validator: (String? val) {
                    (String? val) {
                      if (val == null || val.isEmpty) {
                        return "Enter License Authority";
                      }
                      return null;
                    };
                  }),
              SizedBox(height: AppSize.s15.h),
              CustomTextFormField(
                  hintText: AppStrings.kRegistrationNumber,
                  controller: _registrationNumberController,
                  validator: (String? val) {
                    (String? val) {
                      if (val == null || val.isEmpty) {
                        return "Enter Registration Number";
                      }
                      return null;
                    };
                  }),
              SizedBox(height: AppSize.s15.h),
              CustomTextFormField(
                  hintText: AppStrings.kIWorkAt,
                  controller: _workPlaceController,
                  validator: (String? val) {
                    (String? val) {
                      if (val == null || val.isEmpty) {
                        return "Enter Work place";
                      }
                      return null;
                    };
                  }),
              SizedBox(height: AppSize.s15.h),
              CustomTextFormField(
                  hintText: AppStrings.kYearsOfExperience,
                  controller: _yearOfExperienceController,
                  validator: (String? val) {
                    (String? val) {
                      if (val == null || val.isEmpty) {
                        return "Enter Years of Experience";
                      }
                      return null;
                    };
                  }),
              SizedBox(height: AppSize.s15.h),
              CustomTextFormField(
                  hintText: AppStrings.kAddBio,
                  controller: _addBioController,
                  maxLines: 3,
                  validator: (String? val) {
                    (String? val) {
                      if (val == null || val.isEmpty) {
                        return "Enter your Bio Details";
                      }
                      return null;
                    };
                  }),
              SizedBox(height: AppSize.s15.h),
              CustomTextFormField(
                  hintText: AppStrings.kDegree,
                  controller: _degreeController,
                  validator: (String? val) {
                    (String? val) {
                      if (val == null || val.isEmpty) {
                        return "Enter degree details";
                      }
                      return null;
                    };
                  }),
              SizedBox(height: AppSize.s15.h),
              CustomTextFormField(
                  hintText: AppStrings.kInstitution,
                  controller: _institutionController,
                  validator: (String? val) {
                    (String? val) {
                      if (val == null || val.isEmpty) {
                        return "Enter Institution Details";
                      }
                      return null;
                    };
                  }),
              addMore(),
              SizedBox(height: 10.h),
              uploadWidget(AppStrings.kUploadYourIdCard,ImageAssets.kIdCardIcon),
              SizedBox(height: 15.h),
              uploadWidget(AppStrings.kUploadYourDegreeDocuments,ImageAssets.kIdCardIcon),
              SizedBox(height: 15.h),
              uploadWidget(AppStrings.kUploadYourSignature,ImageAssets.kIdCardIcon),
              SizedBox(height: 15.h),
              uploadWidget(AppStrings.kDrawYourSignature,ImageAssets.kSignatureIcon),
              SizedBox(height: 15.h),
              button(
                  text: AppStrings.kContinue,
                  color: ColorManager.secondary,
                  context: context,
                  onTap: () {
                    /* if (_formKey.currentState!.validate()) {
                    }*/
                    Navigator.pushNamed(
                      context,
                      CustomRouteNames.kProfilePictureSetupScreenRoute,
                    );
                    //   CustomSnacksBar.showSnackBar(
                    //     context,
                    //     "Please Enter Email address ",
                    //     icon: Icon(
                    //       Icons.error,
                    //       color: ColorManager.kWhiteColor,
                    //     ),
                  }),
              const SizedBox(height: 30.0),
            ],
          ),
        ),
      ),
    );
  }
  Widget uploadWidget(String title,String imagePath){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Container(
        width: AppSize.sizeWidth(context),
          decoration: BoxDecoration(
             // color: ColorManager.kLightBlueColor,
              border: Border.all(color: ColorManager.kGreyColor),
              borderRadius: BorderRadius.circular(12)),

        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: getsemiboldStyle(
                    color: ColorManager.kGreyColor,
                    fontSize: ScreenUtil().setSp(AppSize.s15)),
              ),
              SizedBox(height: 20),
              SvgPicture.asset(
              imagePath,
              )
            ],
          ),
        ),
      ),
    );
  }

Widget addMore(){
    return  Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 8.0, 20.0, 8.0),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              Icons.add,
              color: ColorManager.secondary,
              size: 18,
            ),
            Text(AppStrings.kAddMore,
                style: getboldStyle(
                    color: ColorManager.secondary, fontSize: 12.sp)),
          ]),
    );
}
  Widget selectProfessionWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: SizedBox(
        height: 55,
        child: DropdownButtonFormField<String>(
          value: selectProfession,
          style: TextStyle(
            color: Colors.white,
          ),
          dropdownColor: ColorManager.primary,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: ColorManager.kGreyColor,
              ),
            ),
            labelText: AppStrings.kProfession,
            labelStyle: getRegularStyle(color: ColorManager.kGreyColor),
          ),
          onChanged: (String? newValue) {
            setState(() {
              selectProfession = newValue;
            });
          },
          items: ['Doctor', 'Nurse', 'Other'].map((String gender) {
            return DropdownMenuItem<String>(
              value: gender,
              child: Text(gender),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget selectSpecialityRankWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: SizedBox(
        height: 55,
        child: DropdownButtonFormField<String>(
          value: selectRank,
          style: TextStyle(
            color: Colors.white,
          ),
          dropdownColor: ColorManager.primary,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: ColorManager.kGreyColor,
              ),
            ),
            labelText: AppStrings.kSelectSpecialtyOrRank,
            labelStyle: getRegularStyle(color: ColorManager.kGreyColor),
          ),
          onChanged: (String? newValue) {
            setState(() {
              selectRank = newValue;
            });
          },
          items: ['Specialist Doctor', 'Operator Doctor', 'Ordinaryus Doctor']
              .map((String gender) {
            return DropdownMenuItem<String>(
              value: gender,
              child: Text(gender),
            );
          }).toList(),
        ),
      ),
    );
  }
}
