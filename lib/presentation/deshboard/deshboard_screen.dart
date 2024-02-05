// ignore_for_file: deprecated_member_use

import 'package:deluxe_hospital_sm/presentation/deshboard/Articles_screen.dart';
import 'package:deluxe_hospital_sm/presentation/deshboard/appointment_screen.dart';
import 'package:deluxe_hospital_sm/presentation/deshboard/chat_screen.dart';
import 'package:deluxe_hospital_sm/presentation/deshboard/home_screen.dart';
import 'package:deluxe_hospital_sm/presentation/deshboard/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../export_dulex.dart';
import '../health_professional_screens/dashboard/home_helath_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late PageController _pagecontroller;
  var _currentIndex = 0;
  @override
  void initState() {
    _pagecontroller = PageController(initialPage: _currentIndex);
    super.initState();
  }
  final UserController userController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      extendBody: true,
      body: SafeArea(

        child: PageView(
          scrollDirection: Axis.horizontal,
          controller: _pagecontroller,
          onPageChanged: (val) {
            setState(() {
              _currentIndex = val;
            });
          },
          children: <Widget>[
            userController.userRole.value==UserRole.Patient?HomeView():HomeHealthView(),
            AppointmentView(),
            ChatView(),
            ArticlesView(),
            ProfileView(),
          ],
        ),
      ),

      bottomNavigationBar:
      ClipRRect(
      borderRadius: const BorderRadius.only(
    topLeft: Radius.circular(26.0), topRight: Radius.circular(26.0)),
    child:
      BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        backgroundColor: ColorManager.kLightBlueColor,
        selectedItemColor: ColorManager.secondary,
        showUnselectedLabels: true,
        selectedFontSize: 0.0,
        onTap: (value) {
          setState(() => _currentIndex = value);
          _pagecontroller.jumpToPage(value);
        },
        items: [
          bottomNavbaritem(
              title: AppStrings.kHome, IconName: ImageAssets.kHomeIcon, currentindex: 0),
          bottomNavbaritem(
              title: AppStrings.kAppointment,
              IconName: ImageAssets.kAppointmentIcon,
              currentindex: 1),
          bottomNavbaritem(
              title: AppStrings.kChat,
              IconName: ImageAssets.kChatIcon,
              currentindex: 2),
          bottomNavbaritem(
              title: AppStrings.kArticles,
              IconName: ImageAssets.kArticlesIcon,
              currentindex: 3),
          bottomNavbaritem(
              title: AppStrings.kProfile,
              IconName: ImageAssets.kProfileIcon,
              currentindex: 4),
        ],
      ),
      ),
    );
  }

  BottomNavigationBarItem bottomNavbaritem(
      {String? title, String? IconName, int? currentindex}) {
    return BottomNavigationBarItem(
      label: "",
      icon: Padding(
        padding: const EdgeInsets.only(top:10.0,bottom: 5.0),
        child: Column(
          children: [
            SvgPicture.asset(
              IconName!,
              color: currentindex == _currentIndex
                  ? ColorManager.secondary
                  : ColorManager.kWhiteColor,
            ),
            SizedBox(height: 5.0),
            Text(
              title ?? "",
              style: TextStyle(
                fontSize: 10.sp,
                color: currentindex == _currentIndex
                    ? ColorManager.secondary
                    : ColorManager.kWhiteColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
