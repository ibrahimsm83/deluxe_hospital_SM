import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../export_dulex.dart';

class ArticlesView extends StatelessWidget {
  const ArticlesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(AppStrings.kArticles,
            style: getboldStyle(
                color: ColorManager.secondary,
                fontSize: ScreenUtil().setSp(AppSize.s18))),
      ),
      body: Column(
        children: [
          Flexible(
              child: ListView.separated(
                  padding: EdgeInsets.zero,
                  separatorBuilder: ((context, index) => SizedBox(
                        height: 10.0,
                      )),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return userDetails();
                  })),
        ],
      ),
    );
  }

  Widget userDetails() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Container(
        decoration: BoxDecoration(
            color: ColorManager.kLightBlueColor,
            borderRadius: BorderRadius.circular(10.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
              child: Container(
                height: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0)),
                  image: const DecorationImage(
                    colorFilter:
                        ColorFilter.mode(Colors.black12, BlendMode.darken),
                    fit: BoxFit.cover,
                    image: AssetImage(ImageAssets.kShopingImageIcon),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.kHowtoEatHealthy,
                    style: getmediumStyle(
                        color: ColorManager.kWhiteColor, fontSize: 12.sp),
                  ),
                  Text(
                    "Category: Diabetes",
                    style: getRegularStyle(
                        color: ColorManager.kGreyColor, fontSize: 10.sp),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: ClipOval(child: Image.asset(ImageAssets.demoUserImage)),
              title: Text(
                "Edmund Halvorson",
                style: getmediumStyle(
                    color: ColorManager.secondary, fontSize: 12.sp),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Jan 29 2024",
                    style: getmediumStyle(
                        color: ColorManager.kGreyColor, fontSize: 10.sp),
                  ),
                  SizedBox(height: AppSize.s4),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      border: Border.all(color: ColorManager.secondary),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 5.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            ImageAssets.kAddPersonIcon,
                            height: 15,
                            width: 15,
                          ),
                          SizedBox(width: AppSize.s4),
                          Text(
                            "Follow",
                            style: getRegularStyle(
                                color: ColorManager.kWhiteColor,
                                fontSize: 8.sp),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              trailing: Text(
                "12:00 AM",
                style: getmediumStyle(
                    color: ColorManager.kWhiteColor, fontSize: 10.sp),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
              child: Text(
                AppStrings.kArticlesDesc,
                style: getmediumStyle(
                    color: ColorManager.kWhiteColor, fontSize: 10.sp),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          SvgPicture.asset(
                            ImageAssets.kHeartIcon,
                            // color: ColorManager.primary,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text("12",
                                style: getmediumStyle(
                                    color: ColorManager.kWhiteColor,
                                    fontSize: AppSize.s10.sp)),
                          ),
                        ],
                      ),
                      SizedBox(width: 15.0),
                      Column(
                        children: [
                          SvgPicture.asset(
                            ImageAssets.kDoubleChatMessageIcon,
                            color: ColorManager.secondary,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text("12",
                                style: getmediumStyle(
                                    color: ColorManager.kWhiteColor,
                                    fontSize: AppSize.s10.sp)),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SvgPicture.asset(
                        ImageAssets.kShareIcon,
                        color: ColorManager.secondary,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text("12",
                            style: getmediumStyle(
                                color: ColorManager.kWhiteColor,
                                fontSize: AppSize.s10.sp)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
