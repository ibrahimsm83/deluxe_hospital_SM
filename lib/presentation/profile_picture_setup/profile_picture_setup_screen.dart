import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../export_dulex.dart';

class ProfilePictureSetup extends StatefulWidget {
  const ProfilePictureSetup({Key? key}) : super(key: key);

  @override
  State<ProfilePictureSetup> createState() => _ProfilePictureSetupState();
}

class _ProfilePictureSetupState extends State<ProfilePictureSetup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text(
          AppStrings.kAddYourProfilePhotoSetup,
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
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: Column(
            children: [
              Center(
                child: Container(
                  height: 250,
                  width: 250,
                  decoration: BoxDecoration(
                      color: ColorManager.kLightBlueColor,
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: const Icon(
                    Icons.person,
                    color: Colors.lightBlueAccent,
                    size: 200,
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Text(
                AppStrings.kYourInformationWillBe,
                style: TextStyle(color: ColorManager.kGreyColor),
                textAlign: TextAlign.center,
              ),
             const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorManager.secondary,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.photo,
                          size: 20,
                          color: ColorManager.kWhiteColor,
                        ),
                        const SizedBox(
                            width: 8), // Adjust spacing between icon and text
                        Text(AppStrings.kUploadFromGallery,
                            style: getboldStyle(
                                fontSize: 16.sp,
                                color: ColorManager.kWhiteColor)),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorManager.secondary,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.browse_gallery,
                          size: 20,
                          color: ColorManager.kWhiteColor,
                        ),
                        SizedBox(
                            width: 15), // Adjust spacing between icon and text
                        Text(AppStrings.kTakePhoto,
                            style: getboldStyle(
                                fontSize: 16.sp,
                                color: ColorManager.kWhiteColor)),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: AppSize.sizeHeight(context) * 0.1,
              ),
              button(
                  text: AppStrings.kContinue,
                  color: ColorManager.secondary,
                  context: context,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      CustomRouteNames.kFingerPrintSetupScreenRoute,
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
