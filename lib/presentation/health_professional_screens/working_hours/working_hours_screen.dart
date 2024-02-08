import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../export_dulex.dart';

class WorkingHourScreen extends StatefulWidget {
  const WorkingHourScreen({Key? key}) : super(key: key);

  @override
  State<WorkingHourScreen> createState() => _WorkingHourScreenState();
}

class _WorkingHourScreenState extends State<WorkingHourScreen> {
  int selectedid = 0;
  bool isSwitched0 = false;
  bool isSwitched1 = false;
  bool isSwitched2 = false;
  bool isSwitched3 = false;
  bool isSwitched4 = false;
  bool isSwitched5 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          AppStrings.kWorkingHours,
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
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                child: Text(AppStrings.kManageAppointmentDec,
                    style: getRegularStyle(
                        color: ColorManager.kGreyColor, fontSize: 12.sp)),
              ),
              const SizedBox(height: 5.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Categories(),
              ),
              rowComponent(
                isSwitched0,
                "Mon",
                (value) {
                  setState(() {
                    isSwitched0 = value;
                  });
                },
              ),
              divider(),
              rowComponent(
                isSwitched1,
                "Tue",
                (value) {
                  setState(() {
                    isSwitched1 = value;
                  });
                },
              ),
              divider(),
              //Value unavailable
              unAvailable(),
              divider(),
              rowComponent(
                isSwitched2,
                "Thu",
                (value) {
                  setState(() {
                    isSwitched2 = value;
                  });
                },
              ),
              cancel(),
              divider(),
              rowComponent(
                isSwitched3,
                "Fri",
                (value) {
                  setState(() {
                    isSwitched3 = value;
                  });
                },
              ),
              divider(),
              rowComponent(
                isSwitched4,
                "Sat",
                (value) {
                  setState(() {
                    isSwitched4 = value;
                  });
                },
              ),
        
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: button(
                    text: AppStrings.kSave,
                    color: ColorManager.secondary,
                    context: context,
                    onTap: () {
                      //Navigator.pushNamed(context, CustomRouteNames.kWorkingHourScreenRoute);
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget unAvailable() {
    return Row(
      children: [
        Transform.scale(
          scale: 0.7,
          child: Switch(
            activeColor: ColorManager.secondary,
            inactiveThumbColor: ColorManager.secondary,
            inactiveTrackColor: ColorManager.primary,
            value: isSwitched5,
            onChanged: (value) {
              // Do something with the new value
              setState(() {
                isSwitched5 = value;
              });
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 5.0),
          child: Text("Wed",
              style: getRegularStyle(
                  color: ColorManager.kWhiteColor, fontSize: 12.sp)),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text("Unavailable",
              style: getRegularStyle(
                  color: ColorManager.kGreyColor, fontSize: 12.sp)),
        ),
      ],
    );
  }

  Widget divider() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      child: Container(
        height: 1,
        color: ColorManager.kGreyColor,
      ),
    );
  }
Widget cancel(){
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(width: 60,),
          SvgPicture.asset(
            ImageAssets.kCloseCircleIcon,
            height: 20,
            width: 20,
          ),
          SizedBox(width: 10,),
        Row(
          children: [
            timeContainer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text("-",
                  style:
                  getboldStyle(color: ColorManager.secondary, fontSize: 16.sp)),
            ),
            timeContainer(),
          ],
        ),
        SvgPicture.asset(
          ImageAssets.kAddCircleIcon,
        )
      ],),
    );
}
  Widget rowComponent(
      bool isFlag, String weekName, void Function(bool)? onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Transform.scale(
          scale: 0.7,
          child: Switch(
            activeColor: ColorManager.secondary,
            inactiveThumbColor: ColorManager.secondary,
            inactiveTrackColor: ColorManager.primary,
            value: isFlag,
            onChanged: onChanged,
            //     (value) {
            //   // Do something with the new value
            //   setState(() {
            //     isFlag = value;
            //   });
            // },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 5.0),
          child: Text(weekName,
              style: getRegularStyle(
                  color: ColorManager.kWhiteColor, fontSize: 12.sp)),
        ),
        timeContainer(),
        Text("-",
            style:
                getboldStyle(color: ColorManager.secondary, fontSize: 16.sp)),
        timeContainer(),
        SvgPicture.asset(
          ImageAssets.kAddCircleIcon,
        )
      ],
    );
  }

  Widget timeContainer() {
    return Container(
      height: 40,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: ColorManager.kLightBlueColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("11:00 am",
              style: getRegularStyle(
                  color: ColorManager.kGreyColor, fontSize: 12.sp)),
          SizedBox(width: 10.0),
          SvgPicture.asset(
            ImageAssets.kArrowDownIcon,
          )
        ],
      ),
    );
  }

  Widget Categories() {
    return ToggleButtonList1(
      selected: selectedid,
      callback: (int index) {
        setState(() {
          selectedid = index;
        });
        //pageController.jumpToPage(index);
      },
      categories: [
        "Chat",
        "Voice call",
        "Video Call",
      ],
    );
  }
}
