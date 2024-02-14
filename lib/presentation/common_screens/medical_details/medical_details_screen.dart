import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../export_dulex.dart';

class MedicalDetailsScreen extends StatefulWidget {
  const MedicalDetailsScreen({Key? key}) : super(key: key);

  @override
  State<MedicalDetailsScreen> createState() => _MedicalDetailsScreenState();
}

class _MedicalDetailsScreenState extends State<MedicalDetailsScreen> {
  final formKey = GlobalKey<FormState>();
  final _pastMedicalHistoryController = TextEditingController();
  final _pastSurgicalController = TextEditingController();
  final _allergyController = TextEditingController();
  final _drugsHistoryController = TextEditingController();
  final _gynaecologicalHistoryController = TextEditingController();
  final _obsetricHistoryFemaleController = TextEditingController();
  final _recentHospitalStaysHospitalizationController = TextEditingController();
  final _familyHistoryController = TextEditingController();
  final _socialHistoryController = TextEditingController();
  final _occupationController = TextEditingController();
  final _previousOccupationController = TextEditingController();
  final _centimeterController = TextEditingController();
  final _kiloGramController = TextEditingController();
  final UserController userController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          AppStrings.kMedicalDetails,
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
              CustomTextFormField(
                  hintText: AppStrings.kPastSurgicalHistory,
                  controller: _pastSurgicalController,
                  maxLines: 4,
                  validator: (String? val) {
                    (String? val) {
                      if (val == null || val.isEmpty) {
                        return "Enter Past Surgical History";
                      }
                      return null;
                    };
                  }),
              SizedBox(height: AppSize.s15.h),
              CustomTextFormField(
                  hintText: AppStrings.kPastMedicalHistory,
                  controller: _pastMedicalHistoryController,
                  maxLines: 4,
                  validator: (String? val) {
                    (String? val) {
                      if (val == null || val.isEmpty) {
                        return "Enter Past Medical History";
                      }
                      return null;
                    };
                  }),
              SizedBox(height: AppSize.s15.h),
              CustomTextFormField(
                  hintText: AppStrings.kAllergy,
                  controller: _allergyController,
                  maxLines: 4,
                  validator: (String? val) {
                    (String? val) {
                      if (val == null || val.isEmpty) {
                        return "Enter Allergy Details";
                      }
                      return null;
                    };
                  }),

              SizedBox(height: AppSize.s15.h),
              CustomTextFormField(
                  hintText: AppStrings.kDrugsHistory,
                  controller: _drugsHistoryController,
                  maxLines: 4,
                  validator: (String? val) {
                    (String? val) {
                      if (val == null || val.isEmpty) {
                        return "Enter Drugs Details";
                      }
                      return null;
                    };
                  }),
              SizedBox(height: AppSize.s15.h),
              CustomTextFormField(
                  hintText: AppStrings.kGynaecologicalHistoryFemale,
                  controller: _gynaecologicalHistoryController,
                  maxLines: 4,
                  validator: (String? val) {
                    (String? val) {
                      if (val == null || val.isEmpty) {
                        return "Enter Gynaecological Details";
                      }
                      return null;
                    };
                  }),

              SizedBox(height: AppSize.s15.h),
              CustomTextFormField(
                  hintText: AppStrings.kObsetricHistoryFemale,
                  controller: _obsetricHistoryFemaleController,
                  maxLines: 4,
                  validator: (String? val) {
                    (String? val) {
                      if (val == null || val.isEmpty) {
                        return "Enter Obsetric Details";
                      }
                      return null;
                    };
                  }),
              SizedBox(height: AppSize.s15.h),
              CustomTextFormField(
                  hintText: AppStrings.kRecentHospitalStaysHospitalization,
                  controller: _recentHospitalStaysHospitalizationController,
                  maxLines: 4,
                  validator: (String? val) {
                    (String? val) {
                      if (val == null || val.isEmpty) {
                        return "Enter Recent Hospital Stays Details";
                      }
                      return null;
                    };
                  }),
              SizedBox(height: AppSize.s15.h),
              CustomTextFormField(
                  hintText: AppStrings.kFamilyHistory,
                  controller: _familyHistoryController,
                  maxLines: 4,
                  validator: (String? val) {
                    (String? val) {
                      if (val == null || val.isEmpty) {
                        return "Enter Family Details";
                      }
                      return null;
                    };
                  }),
              SizedBox(height: AppSize.s15.h),
              CustomTextFormField(
                  hintText: AppStrings.kSocialHistory,
                  controller: _socialHistoryController,
                  maxLines: 4,
                  validator: (String? val) {
                    (String? val) {
                      if (val == null || val.isEmpty) {
                        return "Enter Social History Details";
                      }
                      return null;
                    };
                  }),

              SizedBox(height: AppSize.s15.h),
              CustomTextFormField(
                  hintText: AppStrings.kOccupation,
                  controller: _occupationController,
                  maxLines: 4,
                  validator: (String? val) {
                    (String? val) {
                      if (val == null || val.isEmpty) {
                        return "Enter Occupation Details";
                      }
                      return null;
                    };
                  }),
              SizedBox(height: AppSize.s15.h),
              CustomTextFormField(
                  hintText: AppStrings.kPreviousOccupation,
                  controller: _previousOccupationController,
                  maxLines: 4,
                  validator: (String? val) {
                    (String? val) {
                      if (val == null || val.isEmpty) {
                        return "Enter Previous Occupation Details";
                      }
                      return null;
                    };
                  }),
              //SizedBox(height: 10.h),
              // Obx(() {
              //   return userController.userRole.value ==
              //       UserRole.Patient?
              //   Column(
              //     children: [
              //       // SizedBox(height: AppSize.s15.h),
              //       // height(),
              //       // SizedBox(height: AppSize.s15.h),
              //       // weight(),
              //       SizedBox(height: AppSize.s15.h),
              //       ///Language
              //       language(),
              //       ///Next Buttons
              //     ],
              //   ):iSpeak();}),

              ///Select Documents
              Obx(() {
                return userController.userRole.value == UserRole.Patient
                    ? Column(
                        children: [
                          SizedBox(height: AppSize.s15.h),
                          height(),
                          SizedBox(height: AppSize.s15.h),
                          weight(),
                          SizedBox(height: AppSize.s15.h),
                        ],
                      )
                    : Column(
                        children: [
                          SizedBox(height: AppSize.s10.h),
                          selectDoc(),
                          SizedBox(height: 10.h),
                          upload(),
                        ],
                      );
              }),

              ///Next Buttons

              SizedBox(height: 10.h),
              button(
                  text: AppStrings.kNext,
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

  Widget height() {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0, right: 8.0),
      child: Row(
        children: [
          Container(
            height: 48,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: ColorManager.kGreyColor),
            ),
            child: Center(
                child: Text(
              AppStrings.kCm,
              style: getRegularStyle(color: ColorManager.kGreyColor),
            )),
          ),
          Flexible(
            child: CustomTextFormField(
                hintText: AppStrings.kHeight,
                horizontalMergin: 0.03,
                controller: _centimeterController,
                keyboardType: TextInputType.number,
                validator: (String? val) {
                  (String? val) {
                    if (val == null || val.isEmpty) {
                      return "Enter height in cm";
                    }
                    return null;
                  };
                }),
          ),
        ],
      ),
    );
  }

  Widget weight() {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0, right: 8.0),
      child: Row(
        children: [
          Container(
            height: 48,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: ColorManager.kGreyColor),
            ),
            child: Center(
                child: Text(
              AppStrings.kKg,
              style: getRegularStyle(color: ColorManager.kGreyColor),
            )),
          ),
          Flexible(
            child: CustomTextFormField(
                hintText: AppStrings.kWeight,
                horizontalMergin: 0.03,
                controller: _kiloGramController,
                keyboardType: TextInputType.number,
                validator: (String? val) {
                  (String? val) {
                    if (val == null || val.isEmpty) {
                      return "Enter weight in kg";
                    }
                    return null;
                  };
                }),
          ),
        ],
      ),
    );
  }

  Widget selectDoc() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 5.0),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0)),
                border: Border.all(
                  color: ColorManager.kGreyColor,
                )),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                AppStrings.kTypeOf,
                style: getsemiboldStyle(color: ColorManager.kGreyColor),
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0)),
                  border: Border.all(
                    color: ColorManager.kGreyColor,
                  )),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  AppStrings.kSelectDocument,
                  style: getsemiboldStyle(color: ColorManager.kGreyColor),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget upload() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, bottom: 30),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.lightBlueAccent,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(AppStrings.kAddNew,
                style: getsemiboldStyle(color: ColorManager.kWhiteColor)),
          ),
          const SizedBox(width: 10),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            decoration: BoxDecoration(
              color: Color(0xfff2F579A),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.camera_alt,
                  size: 18,
                  color: ColorManager.kWhiteColor,
                ),
                SizedBox(width: 8),
                Text(
                  AppStrings.kUpload,
                  style: getsemiboldStyle(color: ColorManager.kWhiteColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
