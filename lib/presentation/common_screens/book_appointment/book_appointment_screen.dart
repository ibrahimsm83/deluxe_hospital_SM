import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../export_dulex.dart';

class BookAppointmentScreen extends StatefulWidget {
  const BookAppointmentScreen({super.key});

  @override
  State<BookAppointmentScreen> createState() => _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text(
          AppStrings.kBookAppointment,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              calenderWidget(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  AppStrings.kSelectDay,
                  style: getboldStyle(
                      color: ColorManager.kWhiteColor,
                      fontSize: ScreenUtil().setSp(AppSize.s18)),
                ),
              ),
              selectDateAndHour("Mon"),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  AppStrings.kSelectHour,
                  style: getboldStyle(
                      color: ColorManager.kWhiteColor,
                      fontSize: ScreenUtil().setSp(AppSize.s18)),
                ),
              ),
              selectDateAndHour("10.00 AM"),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  AppStrings.kSelectConsult,
                  style: getboldStyle(
                      color: ColorManager.kWhiteColor,
                      fontSize: ScreenUtil().setSp(AppSize.s18)),
                ),
              ),
              listTile("Chat - \$40", ImageAssets.kmoreIcon),
              listTile("Voice - \$40", ImageAssets.kAudioCallIcon),
              listTile("Video - \$40", ImageAssets.kVideoCallIcon),
              const SizedBox(height: 50.0),
              button(
                  text: AppStrings.kContinue,
                  color: ColorManager.secondary,
                  context: context,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      CustomRouteNames.kPatientDetailsScreenRoute,
                    );
                  }),
              const SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget button(
      {Function()? onTap, String? text, Color? color, BuildContext? context}) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppSize.sizeWidth(context!) * 0.00, vertical: 8.0),
      child: CustomButton(
          color: color!,
          text: text ?? "",
          style: getboldStyle(
            color: ColorManager.kWhiteColor,
            fontSize: AppSize.s14.sp,
          ),
          onTap: onTap),
    );
  }

  Widget calenderWidget() {
    return Container(
      decoration: BoxDecoration(
        color: ColorManager.kLightBlueColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TableCalendar(
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime.utc(2030, 3, 14),
          focusedDay: _focusedDay,
          selectedDayPredicate: (day) {
            return isSameDay(_selectedDay, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay; // update `_focusedDay` here as well
            });
          },
          daysOfWeekHeight: 42,

          daysOfWeekStyle: DaysOfWeekStyle(
            weekdayStyle:
                getboldStyle(color: ColorManager.kWhiteColor, fontSize: 16),
            weekendStyle:
                getboldStyle(color: ColorManager.kWhiteColor, fontSize: 16),
            //decoration: BoxDecoration(shape: BoxShape.circle, color: ColorManager.kWhiteColor,

            //),
          ),

          headerStyle: HeaderStyle(
            // Customize the text style of week day labels here
            headerPadding: const EdgeInsets.symmetric(horizontal: 40.0),
            formatButtonVisible: false,
            titleCentered: true,

            titleTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: ColorManager.kWhiteColor,
              fontSize: 18,
            ),
            rightChevronMargin: const EdgeInsets.only(right: 0),
            rightChevronIcon: Container(
              padding: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                // color: ColorManager.kRedColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.chevron_right,
                color: ColorManager.kWhiteColor,
              ),
            ),
            leftChevronIcon: Container(
              padding: const EdgeInsets.all(4.0),
              child: Icon(
                Icons.chevron_left,
                color: ColorManager.kWhiteColor,
              ),
            ),
            leftChevronMargin: const EdgeInsets.only(
              left: 0,
            ),
          ),
          calendarStyle: CalendarStyle(
            defaultTextStyle:
                getboldStyle(color: ColorManager.kWhiteColor, fontSize: 16),

            todayTextStyle:
                getboldStyle(color: ColorManager.kWhiteColor, fontSize: 16),
            outsideTextStyle:
                getboldStyle(color: ColorManager.kWhiteColor, fontSize: 16),
            selectedTextStyle:
                getboldStyle(color: ColorManager.kWhiteColor, fontSize: 16),
            // outsideDecoration: ,
            todayDecoration: BoxDecoration(
                color: ColorManager.secondary, shape: BoxShape.circle),
            selectedDecoration: BoxDecoration(
                color: ColorManager.primary, shape: BoxShape.circle),
            // weekendDecoration: BoxDecoration(
            //     shape: BoxShape.circle, color: Colors.grey.withOpacity(0.3)),
            weekendTextStyle:
                getboldStyle(color: ColorManager.kWhiteColor, fontSize: 16),
          ), // Change the color as needed
        ),
      ),
    );
  }

  Widget selectDateAndHour(String text) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        border: Border.all(color: ColorManager.secondary),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: getboldStyle(
                  color: ColorManager.secondary,
                  fontSize: ScreenUtil().setSp(AppSize.s16)),
            ),
            // SizedBox(width: 10.0),
            SvgPicture.asset(ImageAssets.kArrowDownIcon),
          ],
        ),
      ),
    );
  }

  Widget listTile(String text, String iconPath) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: ColorManager.kLightBlueColor,
        ),
        child: ListTile(
          leading: SvgPicture.asset(
            iconPath,
            height: 20,
            width: 20,
          ),
          title: Text(text,
              style: getsemiboldStyle(
                  color: ColorManager.secondary, fontSize: 14.sp)),
        ),
      ),
    );
  }
}
