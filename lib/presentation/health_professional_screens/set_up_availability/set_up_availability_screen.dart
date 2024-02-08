import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../export_dulex.dart';

class SetUpAvailabilityScreen extends StatefulWidget {
  const SetUpAvailabilityScreen({super.key});

  @override
  State<SetUpAvailabilityScreen> createState() =>
      _SetUpAvailabilityScreenState();
}

// String? _selectedCurrency;
// String? type;
// String? curencyType;
// int currentindex = 0;

class _SetUpAvailabilityScreenState extends State<SetUpAvailabilityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text(
          AppStrings.kSetupYourAvailability,
          style: getboldStyle(
              color: ColorManager.secondary,
              fontSize: ScreenUtil().setSp(AppSize.s18)),
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(20.0),
          child: InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: SvgPicture.asset(ImageAssets.arrowLeftIcon)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10.0),
              emergencyHelp(),
              const SizedBox(height: 15.0),
              //setUpNow(context),
              setAvailability(),
              SizedBox(
                height: 10.h,
              ),
              // Text("Invite Patient",
              //     style: TextStyle(color: Colors.white, fontSize: 20.sp)),
              Text(
                "Invite Patien",
                style:
                    getboldStyle(color: ColorManager.kWhiteColor, fontSize: 18),
                // textAlign: TextAlign.left,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "to invite your patient to your room, you can share the below link",
                  style: getRegularStyle(
                      color: ColorManager.kGreyColor, fontSize: 14),
                ),
              ),
              SizedBox(height: 20.h),
              Center(
                child: Text(
                  "asdasfancansdkadkq343j1ind",
                  style: getRegularStyle(color: ColorManager.kGreyColor),
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                AppStrings.kScheduledAppointment,
                style:
                    getboldStyle(color: ColorManager.kWhiteColor, fontSize: 18),
              ),
              SizedBox(
                height: 10.h,
              ),
              scheduledAppointments(),
              SizedBox(
                height: 20.h,
              ),
              rowText(
                  text1: AppStrings.kCurrentPatientsQueue,
                  text2: AppStrings.kSeeAll),
              SizedBox(
                height: 10.h,
              ),
              listWidget()
            ],
          ),
        ),
      ),
    );
  }

  Widget emergencyHelp() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  CustomRouteNames.kFinishConsultationScreenRoute,
                );
              },
              child: ClipOval(
                  child: Image.asset(
                ImageAssets.demoUser2Image,
                height: 60,
                width: 60,
              )),
            ),
            const SizedBox(width: 12.0),
            Column(
              children: [
                Text(
                  "Good Morning",
                  style: getlightStyle(
                      color: ColorManager.secondary,
                      fontSize: ScreenUtil().setSp(AppSize.s14)),
                ),
                Text(
                  "John Doe",
                  style: getsemiboldStyle(
                      color: ColorManager.kWhiteColor,
                      fontSize: ScreenUtil().setSp(AppSize.s16)),
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: ColorManager.secondary, shape: BoxShape.circle),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: SvgPicture.asset(
                  ImageAssets.kSendIcon,
                  height: 12,
                  width: 12,
                ),
              ),
            ),
            const SizedBox(width: 7.0),
            InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  CustomRouteNames.kHomeNotificationsScreenRoute,
                );
              },
              child: SvgPicture.asset(
                ImageAssets.kBellIcon,
                height: 20,
                width: 20,
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget setAvailability() {
    return Container(
      width: AppSize.sizeWidth(context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: ColorManager.kLightBlueColor,
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 8, 8, 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.kSetupYourAvailability,
                  style: getboldStyle(
                      color: ColorManager.kWhiteColor, fontSize: 16),
                  // textAlign: TextAlign.left,
                ),
                Icon(
                  Icons.close,
                  color: ColorManager.secondary,
                )
              ],
            ),
            Text(
              "lorem lorem lorem lorem lorem",
              style:
                  getRegularStyle(color: ColorManager.kGreyColor, fontSize: 12),
              // textAlign: TextAlign.left,
            ),
            SizedBox(height: 10.0),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: ColorManager.kBlackColor,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(25.0),
                    ),
                  ),
                  isDismissible: false,
                  context: context,
                  builder: (context) =>
                      SizedBox(height: 0.4.sh, child: bottomSheetWidget()),
                );
              },
              child: Text(
                AppStrings.kSetupNow,
                style:
                    getboldStyle(color: ColorManager.secondary, fontSize: 16),
                //textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListView listWidget() {
    return ListView.separated(
separatorBuilder: (context,i)=>SizedBox(height: 10.0),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 3,
        itemBuilder: (context, index) {
          return Padding(
            padding:  EdgeInsets.only(bottom: index==2?15:0),
            child: currentPatient(),
          );
        });
  }

  Widget userListTile() {
    return ListTile(
      leading: ClipOval(
        child: Image.asset(
          ImageAssets.demoUser2Image,
          height: 40,
          width: 40,
        ),
      ),
      title: Text("Edmund Halvorson",
          style:
              getsemiboldStyle(color: ColorManager.secondary, fontSize: 16.sp)),
      subtitle: Text("Lorem ipsum is a dummy text",
          style:
              getRegularStyle(color: ColorManager.kGreyColor, fontSize: 10.sp)),
      trailing: Icon(Icons.more_vert, color: ColorManager.secondary),
      onTap: () {
        //Navigator.of(context).pop();
      },
    );
  }

  Container currentPatient() {
    return Container(
        width: 1.sw,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: ColorManager.kLightBlueColor,
            borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            userListTile(),
            SizedBox(height: 20.h),
            Row(
              children: [
                Expanded(
                  child: Container(
                    width: 1.sw,
                    // margin: const EdgeInsets.only(bottom: 15),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child:  Text(
                      "Reject",
                      style: getRegularStyle(color: ColorManager.kRedColor,fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(width: 15.w),
                Expanded(
                  child: Container(
                    width: 1.sw,
                    // margin: const EdgeInsets.only(bottom: 15),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Text(
                      "Admit",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }

  Widget rowText({String? text1, String? text2, Function()? onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text1 ?? "",
            style: getboldStyle(color: ColorManager.kWhiteColor, fontSize: 18),
            textAlign: TextAlign.left,
          ),
          Row(
            children: [
              // SvgPicture.asset(ImageAssets.kEditIcon),
              SizedBox(width: 5.0),
              GestureDetector(
                onTap: onTap,
                child: Text(text2 ?? "", //AppStrings.viewAll,
                    style: getmediumStyle(
                        color: ColorManager.secondary,
                        fontSize: AppSize.s14.sp)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container scheduledAppointments() {
    return Container(
        width: 1.sw,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: ColorManager.kLightBlueColor,
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            Icon(Icons.calendar_month,
                size: 50.sp, color: ColorManager.secondary),
            SizedBox(
              width: 10,
            ),
            Text(
              "No appointments yet",
              style:
                  getboldStyle(color: ColorManager.kWhiteColor, fontSize: 16),
            ),
          ],
        ));
  }

  Container setUpNow(BuildContext context) {
    return Container(
      width: 1.sw,
      padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
      decoration: BoxDecoration(
          color: ColorManager.kLightBlueColor,
          borderRadius: BorderRadius.circular(15)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              "Set up a scheduler to your bookings!",
              style: TextStyle(color: Colors.white, fontSize: 16.sp),
            ),
          ),
          const Icon(
            Icons.close,
            color: Color.fromARGB(255, 68, 227, 255),
          )
        ]),
        SizedBox(
          height: 10.h,
        ),
        Text(
          "lorem lorem lorem lorem lorem",
          style: TextStyle(color: Colors.grey, fontSize: 14.sp),
        ),
        SizedBox(
          height: 10.h,
        ),
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: ColorManager.kBlackColor,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(25.0),
                ),
              ),
              isDismissible: false,
              context: context,
              builder: (context) =>
                  SizedBox(height: 0.4.sh, child: bottomSheetWidget()),
            );
          },
          // color: currentindex == 3 ? Colors.blueAccent : null),

          child: Text(
            "Set up now",
            style: TextStyle(
                color: const Color.fromARGB(255, 68, 227, 255),
                fontSize: 14.sp),
          ),
        ),
      ]),
    );
  }

  // Row goodMorningWidget() {
  //   return Row(children: [
  //     const CircleAvatar(
  //       minRadius: 20,
  //       backgroundColor: Colors.grey,
  //     ),
  //     SizedBox(
  //       width: 8.w,
  //     ),
  //     Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         const Text(
  //           "Good Morning",
  //           style: TextStyle(color: Colors.blue),
  //         ),
  //         const Text(
  //           "John Doe",
  //           style: TextStyle(color: Colors.white),
  //         )
  //       ],
  //     ),
  //     const Spacer(),
  //     const Icon(
  //       Icons.notifications_outlined,
  //       color: Colors.blue,
  //     )
  //   ]);
  // }

  Widget bottomSheetWidget() {
    return AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
            color: ColorManager.kLightBlueColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.sp),
                topRight: Radius.circular(25.sp))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                color: Colors.transparent,
                child: Container(
                  margin:
                      EdgeInsets.symmetric(vertical: 5.h, horizontal: 0.43.sw),
                  width: 1.sw,
                  padding: EdgeInsets.symmetric(vertical: 2.h),
                  decoration: BoxDecoration(
                      color: ColorManager.secondary,
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                ),
              ),
            ),
            //----------------Cancel Icon----------------
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "Set up your availability",
                    style: getboldStyle(
                        color: ColorManager.secondary, fontSize: 22),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus et felis dapibus, vulputate libero eget, suscipit nulla. Morbi a finibus lectus. Nulla tincidunt pretium purus.",
                    style: getRegularStyle(
                        color: ColorManager.kWhiteColor, fontSize: 12),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.pushNamed(
                        context,
                        CustomRouteNames.kManageAppointmentScreenRoute,
                      );
                    },
                    child: Container(
                      width: 1.sw,
                      margin: const EdgeInsets.symmetric(horizontal: 50),
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: ColorManager.secondary,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Text(
                        "Continue",
                        style: getsemiboldStyle(
                          color: ColorManager.kWhiteColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Center(
                      child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Not Now",
                      style: TextStyle(color: ColorManager.kRedColor),
                    ),
                  ))
                ],
              ),
            )
          ]),
        ));
  }

  Widget button({required String text, void Function()? onTap, Color? color}) =>
      Expanded(
        child: GestureDetector(
            onTap: onTap,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 3),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: color ?? const Color.fromARGB(255, 5, 60, 102),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                text,
                style: TextStyle(color: ColorManager.kWhiteColor),
              ),
            )),
      );
}
