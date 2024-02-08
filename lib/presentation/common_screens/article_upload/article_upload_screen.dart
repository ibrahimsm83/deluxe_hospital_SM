import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../export_dulex.dart';

class ArticlesUploadScreen extends StatefulWidget {
  const ArticlesUploadScreen({Key? key}) : super(key: key);

  @override
  State<ArticlesUploadScreen> createState() => _ArticlesUploadScreenState();
}

class _ArticlesUploadScreenState extends State<ArticlesUploadScreen> {
  String? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          AppStrings.kArticleUpload,
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
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              SizedBox(height: 10.0),
              Row(
                children: [
                  SvgPicture.asset(
                    ImageAssets.kInfoCircleIcon,
                    color: ColorManager.kGreyColor,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Publish an article and get paid between \$5 - \$50",
                      style: getRegularStyle(
                          color: ColorManager.kGreyColor,
                          fontSize: ScreenUtil().setSp(AppSize.s12)),
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSize.s20.h),
              CustomTextFormField(
                  hintText: "Article Title",
                  // controller: _firstNameController,
                  validator: (String? val) {
                    (String? val) {
                      if (val == null || val.isEmpty) {
                        return "Enter Article Title ";
                      }
                      return null;
                    };
                  }),
              SizedBox(height: AppSize.s15.h),
              selectCategory(),
              SizedBox(height: AppSize.s15.h),
              CustomTextFormField(
                  hintText: "Select Thumbnail (Optional)",
                  // controller: _firstNameController,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgPicture.asset(ImageAssets.kCameraIcon),
                  ),
                  validator: (String? val) {
                    (String? val) {
                      if (val == null || val.isEmpty) {
                        return "Enter Article Title ";
                      }
                      return null;
                    };
                  }),
              SizedBox(height: AppSize.s15.h),
              CustomTextFormField(
                  hintText: "Video (Optional)",
                  // controller: _firstNameController,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgPicture.asset(ImageAssets.kCameraIcon),
                  ),
                  validator: (String? val) {
                    (String? val) {
                      if (val == null || val.isEmpty) {
                        return "Enter Article Title ";
                      }
                      return null;
                    };
                  }),
        
              Container(
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0)),
                  image: const DecorationImage(
                    colorFilter:
                    ColorFilter.mode(Colors.black12, BlendMode.darken),
                    fit: BoxFit.cover,
                    image: AssetImage(ImageAssets.kTextEditorImage),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              button(
                  text: AppStrings.kSave,
                  color: ColorManager.secondary,
                  context: context,
                  onTap: () {
                    //Home page
                    // Navigator.pushNamed(
                    //   context,
                    //   CustomRouteNames.kDashboardScreenRoute,
                    // );
                  }),

              button(
                  text: AppStrings.kSubmit,
                  color: ColorManager.secondary,
                  context: context,
                  onTap: () {
                    //Home page
                    // Navigator.pushNamed(
                    //   context,
                    //   CustomRouteNames.kDashboardScreenRoute,
                    // );
                  }),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget selectCategory() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: SizedBox(
        height: 55,
        child: DropdownButtonFormField<String>(
          value: selectedCategory,
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
            labelText: 'Select Category',
            labelStyle: getRegularStyle(color: ColorManager.kGreyColor),
          ),
          onChanged: (String? newValue) {
            setState(() {
              selectedCategory = newValue;
            });
          },
          items: ['Select Category', 'Category1', 'Category2']
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
