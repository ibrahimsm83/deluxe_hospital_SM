import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../export_dulex.dart';

class SearchFilterScreen extends StatefulWidget {
  const SearchFilterScreen({super.key});

  @override
  State<SearchFilterScreen> createState() => _SearchFilterScreenState();
}

class _SearchFilterScreenState extends State<SearchFilterScreen> {
  String? selectedProfessionalCategory;
  String? selectedLocation;
  String? selectedRating;
  String? selectedLanguage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.kLightBlueColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          AppStrings.kSearch,
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: searchFiled(),
          ),
          SizedBox(height: 20.0),
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                color: ColorManager.primary,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Filter
                    filter(),
                    //Availablity
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        AppStrings.kAvailability,
                        style: getboldStyle(
                            color: ColorManager.kWhiteColor,
                            fontSize: ScreenUtil().setSp(AppSize.s16)),
                      ),
                    ),
                    availablity(),
                    const SizedBox(height: 15.0),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        AppStrings.kProfessionalCategory,
                        style: getboldStyle(
                            color: ColorManager.kWhiteColor,
                            fontSize: ScreenUtil().setSp(AppSize.s14)),
                      ),
                    ),
                    professionalCategory(),
                    const SizedBox(height: 15.0),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        AppStrings.kLocation,
                        style: getboldStyle(
                            color: ColorManager.kWhiteColor,
                            fontSize: ScreenUtil().setSp(AppSize.s14)),
                      ),
                    ),
                    location(),
                    const SizedBox(height: 15.0),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        AppStrings.kRating,
                        style: getboldStyle(
                            color: ColorManager.kWhiteColor,
                            fontSize: ScreenUtil().setSp(AppSize.s14)),
                      ),
                    ),
                    rating(),
                    const SizedBox(height: 15.0),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "Language",
                        style: getboldStyle(
                            color: ColorManager.kWhiteColor,
                            fontSize: ScreenUtil().setSp(AppSize.s14)),
                      ),
                    ),
                    language(),
                    SizedBox(height: 10.h),
                    button(
                        text: AppStrings.kApplyFilter,
                        color: ColorManager.secondary,
                        context: context,
                        onTap: () {
                          CustomSnacksBar.showSnackBar(
                            context,
                            "Filter Applied Successfully",
                            icon: Icon(
                              Icons.error,
                              color: ColorManager.kWhiteColor,
                            ),
                          );
                          /* if (_formKey.currentState!.validate()) {
                      }*/
                        }),
                    const SizedBox(height: 30.0),
                    //TextFields
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget searchFiled() {
    return SizedBox(
      height: 55,
      child: Row(
        children: [
          Flexible(
            child: InkWell(
              onTap: (){
                  Navigator.pushNamed(
                    context,
                    CustomRouteNames.kSearchResultScreenRoute,
                  );
              },
              child: TextField(
                enabled: false,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: ColorManager.kGreyColor,
                    ),
                  ),
                  disabledBorder:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: ColorManager.kGreyColor,
                    ),
                  )  ,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.lightBlueAccent,
                  ),
                  labelText: 'Search a health professional',
                  labelStyle: getRegularStyle(
                    color: ColorManager.kGreyColor,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 15),
          InkWell(
            onTap: () {
              // Navigator.pushNamed(
              //   context,
              //   CustomRouteNames.kSearchFilterScreenRoute,
              // );
            },
            child: Container(
              padding: EdgeInsets.all(15),
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  color: ColorManager.primary,
                  borderRadius: BorderRadius.circular(12)),
              child: SvgPicture.asset(
                ImageAssets.kFilterIcon,
                // width: 10,
                // height: 10,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget filter() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
              onTap: () {}, //=> Navigator.of(context).pop(),
              child: SvgPicture.asset(ImageAssets.kFilterCloseIcon)),
          Text(
            AppStrings.kFilters,
            style: getsemiboldStyle(
                color: ColorManager.kWhiteColor,
                fontSize: ScreenUtil().setSp(AppSize.s14)),
          ),
          Text(
            AppStrings.kReset,
            style: getsemiboldStyle(
                color: ColorManager.secondary,
                fontSize: ScreenUtil().setSp(AppSize.s14)),
          ),
        ],
      ),
    );
  }

  Widget availablity() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Row(
        children: [
          Flexible(
            child: CustomTextFormField(
                hintText: "Date",
                horizontalMergin: 0.0,
                //controller: _lastNameController,
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(ImageAssets.kCalendarIcon),
                ),
                validator: (String? val) {
                  (String? val) {
                    if (val == null || val.isEmpty) {
                      return "Enter Last Name";
                    }
                    return null;
                  };
                }),
          ),
          SizedBox(width: 10.0),
          Flexible(
            child: CustomTextFormField(
                hintText: "Time",
                //controller: _lastNameController,
                horizontalMergin: 0.0,
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(ImageAssets.kClockIcon),
                ),
                validator: (String? val) {
                  (String? val) {
                    if (val == null || val.isEmpty) {
                      return "Enter Last Name";
                    }
                    return null;
                  };
                }),
          ),
        ],
      ),
    );
  }

  Widget professionalCategory() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: SizedBox(
        height: 55,
        child: DropdownButtonFormField<String>(
          value: selectedProfessionalCategory,
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
            labelText: AppStrings.kCardiologist,
            labelStyle: getRegularStyle(color: ColorManager.kGreyColor),
          ),
          onChanged: (String? newValue) {
            setState(() {
              selectedProfessionalCategory = newValue;
            });
          },
          items: ['Cardiologist', 'Cardiologist1', 'Cardiologist2'].map((String lang) {
            return DropdownMenuItem<String>(
              value: lang,
              child: Text(lang),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget location() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: SizedBox(
        height: 55,
        child: DropdownButtonFormField<String>(
          value: selectedLocation,
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
            labelText: "New York",
            labelStyle: getRegularStyle(color: ColorManager.kGreyColor),
          ),
          onChanged: (String? newValue) {
            setState(() {
              selectedLocation = newValue;
            });
          },
          items: ['New York', 'China', 'USA'].map((String lang) {
            return DropdownMenuItem<String>(
              value: lang,
              child: Text(lang),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget rating() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: SizedBox(
        height: 55,
        child: DropdownButtonFormField<String>(
          value: selectedRating,
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
            labelText: "4 stars or above",
            labelStyle: getRegularStyle(color: ColorManager.kGreyColor),
          ),
          onChanged: (String? newValue) {
            setState(() {
              selectedRating = newValue;
            });
          },
          items: ['4 stars or above', '4 stars or below', 'None'].map((String lang) {
            return DropdownMenuItem<String>(
              value: lang,
              child: Text(lang),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget language() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: SizedBox(
        height: 55,
        child: DropdownButtonFormField<String>(
          value: selectedLanguage,
          style: const TextStyle(
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
            labelText: "English US",
            labelStyle: getRegularStyle(color: ColorManager.kGreyColor),
          ),
          onChanged: (String? newValue) {
            setState(() {
              selectedLanguage = newValue;
            });
          },
          items: ['English', 'Arabic',].map((String lang) {
            return DropdownMenuItem<String>(
              value: lang,
              child: Text(lang),
            );
          }).toList(),
        ),
      ),
    );
  }
}
