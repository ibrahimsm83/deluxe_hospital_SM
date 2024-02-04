import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../../../export_dulex.dart';

class PersonalInformationScreen extends StatefulWidget {
  const PersonalInformationScreen({Key? key}) : super(key: key);

  @override
  State<PersonalInformationScreen> createState() =>
      _PersonalInformationScreenState();
}

class _PersonalInformationScreenState extends State<PersonalInformationScreen> {
  final formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _stateAndRegionController = TextEditingController();
  final _countryController = TextEditingController();
  final _centimeterController = TextEditingController();
  final _kiloGramController = TextEditingController();
  final _dateOfBirthController = TextEditingController();
  final _cityController = TextEditingController();
  final UserController userController = Get.find();
  String countryValue = "";
  String selectedTitle = 'Mr'; // Initial value
  String? selectedGender;
  String? selectedLanguage;
  String? speak;
  // GlobalKey<CSCPickerState> _cscPickerKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text(
          AppStrings.kPersonalInformation,
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
          child:  Column(
            children: [
              firstName(),
              CustomTextFormField(
                  hintText: AppStrings.kLastName,
                  controller: _lastNameController,
                  validator: (String? val) {
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
                  controller: _emailController,
                validator: (String? val) {
                  if (val == null || val.isEmpty) {
                    return AppStrings.enterEmailAddress;
                  } else if (val.isValidEmail) {
                    return null;
                  }
                  return 'Invalid Email';
                },
              ),
              SizedBox(height: AppSize.s15.h),
              ///PhoneNumber
              phoneNumber(),
              SizedBox(height: AppSize.s15.h),
              CustomTextFormField(
                  hintText: AppStrings.kDateOfBirth,
                  controller: _dateOfBirthController,
                  validator: (String? val) {
                        (String? val) {
                      if (val == null || val.isEmpty) {
                        return "Enter Date of birth";
                      }
                      return null;
                    };
                  }
              ),
              SizedBox(height: AppSize.s15.h),
              ///Gender
              gender(),
              ///Select Country
            SizedBox(height: AppSize.s15.h),
              selectCountry(),
              SizedBox(height: AppSize.s15.h),
              CustomTextFormField(
                  hintText: AppStrings.kStateAndRegion,
                  controller: _stateAndRegionController,
                  validator: (String? val) {
                        (String? val) {
                      if (val == null || val.isEmpty) {
                        return "Enter State And  Region";
                      }
                      return null;
                    };
                  }
              ),
              SizedBox(height: AppSize.s15.h),
              CustomTextFormField(
                  hintText: AppStrings.kCity,
                  controller: _cityController,
                  validator: (String? val) {
                        (String? val) {
                      if (val == null || val.isEmpty) {
                        return "Enter City";
                      }
                      return null;
                    };
                  }
              ),
            Obx(() {
              return userController.userRole.value ==
                  UserRole.Patient?
              Column(
                children: [
                  SizedBox(height: AppSize.s15.h),
                  height(),
                  SizedBox(height: AppSize.s15.h),
                  weight(),
                  SizedBox(height: AppSize.s15.h),
                  ///Language
                  language(),
                  ///Next Buttons
                ],
              ):iSpeak();}),

              SizedBox(height: 10.h),
              button(
                  text: AppStrings.kNext,
                  color: ColorManager.secondary,
                  context: context,
                  onTap: () {
                    /* if (_formKey.currentState!.validate()) {
                    }*/
                    if(userController.userRole.value== UserRole.Patient){
                      Navigator.pushNamed(
                        context,
                        CustomRouteNames.kMedicalDetailsScreenRoute,
                      );
                    }else{
                      Navigator.pushNamed(
                        context,
                        CustomRouteNames.kProfessionalInformationScreenRoute,
                      );
                    }

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

  Widget phoneNumber(){
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        height: 70,
        child: IntlPhoneField(
          decoration: InputDecoration(
            labelText: 'Phone Number',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            labelStyle: TextStyle(color: Colors.white),
          ),
          initialCountryCode:
          'US', // Initial country code, you can change it to the desired one
          onChanged: (phone) {
            print(phone.completeNumber);
            // Callback when phone number changes
          },
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
  Widget firstName(){
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0,bottom: 15.0),
              child: SizedBox(
                height: 52,
                child: DropdownButtonFormField<String>(
                  padding: EdgeInsets.zero,
                  iconSize: 18,
                  value: selectedTitle,
                  decoration: InputDecoration(
                    // labelText: 'Select Title',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedTitle = newValue!;
                    });
                  },
                  dropdownColor: Color(0xfff0C1A32),
                  items: ['Mr', 'Mrs'].map((String title) {
                    return DropdownMenuItem<String>(
                      alignment: Alignment.center,
                      value: title,
                      child: Text(
                        title,
                        style: getRegularStyle(color: ColorManager.kWhiteColor,fontSize: 10.sp),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
          SizedBox(width: 5.0),
          Flexible(
            flex: 4,
            child: CustomTextFormField(
                hintText: AppStrings.kFirstName,
                horizontalMergin: 0.0,
                // focusNode: node,
                controller: _firstNameController,
                validator: (String? val) {
                      (String? val) {
                    if (val == null || val.isEmpty) {
                      return "Enter First Name";
                    }
                    return null;
                  };
                }
            ),
          ),
        ],
      ),
    );
  }
  Widget gender(){
    return   Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: SizedBox(
        height: 55,
        child: DropdownButtonFormField<String>(
          value: selectedGender,
          style: TextStyle(
            color: Colors.white,
          ),
          dropdownColor: ColorManager.primary,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color:ColorManager.kGreyColor,
              ),
            ),
            labelText: 'Select Gender',
            labelStyle: getRegularStyle(color: ColorManager.kGreyColor),
          ),
          onChanged: (String? newValue) {
            setState(() {
              selectedGender = newValue;
            });
          },
          items: ['Male', 'Female', 'Other'].map((String gender) {
            return DropdownMenuItem<String>(
              value: gender,
              child: Text(gender),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget iSpeak(){
    return   Padding(
      padding: EdgeInsets.only(left: 18.0,right: 18,top:AppSize.s15.h),
      child: SizedBox(
        height: 55,
        child: DropdownButtonFormField<String>(
          value: speak,
          style: TextStyle(
            color: Colors.white,
          ),
          dropdownColor: ColorManager.primary,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color:ColorManager.kGreyColor,
              ),
            ),
            labelText: AppStrings.kISpeakLanguage,
            labelStyle: getRegularStyle(color: ColorManager.kGreyColor),
          ),
          onChanged: (String? newValue) {
            setState(() {
              speak = newValue;
            });
          },
          items: ['English', 'Arabic', 'Turkish'].map((String lang) {
            return DropdownMenuItem<String>(
              value: lang,
              child: Text(lang),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget language(){
    return   Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: SizedBox(
        height: 55,
        child: DropdownButtonFormField<String>(
          value: selectedLanguage,
          style: TextStyle(
            color: Colors.white,
          ),
          dropdownColor: ColorManager.primary,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color:ColorManager.kGreyColor,
              ),
            ),
            labelText: AppStrings.kSelectLanguage,
            labelStyle: getRegularStyle(color: ColorManager.kGreyColor),
          ),
          onChanged: (String? newValue) {
            setState(() {
              selectedLanguage = newValue;
            });
          },
          items: ['English', 'Arabic', 'Turkish'].map((String lang) {
            return DropdownMenuItem<String>(
              value: lang,
              child: Text(lang),
            );
          }).toList(),
        ),
      ),
    );
  }
  Widget selectCountry(){
    return CustomTextFormField(
        hintText: AppStrings.kSelectCountry,
        controller: _countryController,
        suffixIcon: Icon(Icons.arrow_drop_down),
        readOnly: true,
        onTextFiledTap: (){
          showCountryPicker(
            context: context,
            //Optional.  Can be used to exclude(remove) one ore more country from the countries list (optional).
            exclude: <String>['KN', 'MF'],
            favorite: <String>['SE'],
            //Optional. Shows phone code before the country name.
            showPhoneCode: true,
            onSelect: (Country country) {
              print('Select country: ${country.displayName}');
              print('Select country: ${country.name}');
              _countryController.text=country.name;
            },
            // Optional. Sets the theme for the country list picker.
            countryListTheme: CountryListThemeData(
              // Optional. Sets the border radius for the bottomsheet.
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0),
              ),
              // Optional. Styles the search field.
              inputDecoration: InputDecoration(
                labelText: 'Search',
                hintText: 'Start typing to search',
                prefixIcon: const Icon(Icons.search),
                // border: OutlineInputBorder(
                //   borderSide: BorderSide(
                //     color: const Color(0xFF8C98A8).withOpacity(0.2),
                //   ),
                // ),
              ),
              // Optional. Styles the text in the search field
              searchTextStyle: TextStyle(
                color: Colors.blue,
                fontSize: 18,
              ),
            ),
          );
        },
        validator: (String? val) {
              (String? val) {
            if (val == null || val.isEmpty) {
              return "Select Country ";
            }
            return null;
          };
        }
    );
}

Widget height(){
    return Padding(
      padding: const EdgeInsets.only(left: 18.0,right: 8.0),
      child: Row(children: [
        Container(
          height: 48,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(color: ColorManager.kGreyColor),
          ),
          child: Center(child: Text(AppStrings.kCm,style: getRegularStyle(color: ColorManager.kGreyColor),)),
        ),
        Flexible(
          child: CustomTextFormField(
              hintText: AppStrings.kHeight,
              horizontalMergin: 0.03,
              controller: _centimeterController,
              validator: (String? val) {
                    (String? val) {
                  if (val == null || val.isEmpty) {
                    return "Enter height in cm";
                  }
                  return null;
                };
              }
          ),
        ),
      ],),
    );
}

Widget weight(){
    return Padding(
      padding: const EdgeInsets.only(left: 18.0,right: 8.0),
      child: Row(children: [
        Container(
          height: 48,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(color: ColorManager.kGreyColor),
          ),
          child: Center(child: Text(AppStrings.kKg,style: getRegularStyle(color: ColorManager.kGreyColor),)),
        ),
        Flexible(
          child: CustomTextFormField(
              hintText: AppStrings.kWeight,
              horizontalMergin: 0.03,
              controller: _kiloGramController,
              validator: (String? val) {
                    (String? val) {
                  if (val == null || val.isEmpty) {
                    return "Enter weight in kg";
                  }
                  return null;
                };
              }
          ),
        ),
      ],),
    );
}
}
