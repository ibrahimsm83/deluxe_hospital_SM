import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:pie_chart/pie_chart.dart';
import '../../../../export_dulex.dart';

class HomeHealthView extends StatefulWidget {
  const HomeHealthView({Key? key}) : super(key: key);

  @override
  State<HomeHealthView> createState() => _HomeHealthViewState();
}

class _HomeHealthViewState extends State<HomeHealthView> {
  final HDTRefreshController _hdtRefreshController = HDTRefreshController();

  static const int sortName = 0;
  bool isAscending = true;
  int sortType = sortName;

  @override
  void initState() {
    user.initData(7);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10.0),
                emergencyHelp(),
                const SizedBox(height: 15.0),
                setAvailability(),
                const SizedBox(height: 15.0),
                rowText(
                    text1: AppStrings.kShareYourFlyer, text2: AppStrings.kEdit),
                const SizedBox(height: 15.0),
                flayer(),
                const SizedBox(height: 15.0),
                pieChartWidget(),
                const SizedBox(height: 15.0),
                currentPatientsQueue(),
                const SizedBox(height: 15.0),
                currentPatientsQueue(),
                const SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: viewRow(
                          title: AppStrings.kAllPatients, subtitle: "1,458"),
                    ),
                    Expanded(
                      child: viewRow(
                          title: AppStrings.kNewPatients, subtitle: "448"),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: viewRow(
                          title: AppStrings.kNumberOfAppointments,
                          subtitle: "848"),
                    ),
                    Expanded(
                      child: viewRow(
                          title: AppStrings.kPreviousAppointments,
                          subtitle: "100"),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: viewRow(
                          title: AppStrings.kUpcomingAppointments,
                          subtitle: "848"),
                    ),
                    Expanded(
                      child: viewRow(
                          title: AppStrings.kMissedAppointments,
                          subtitle: "100"),
                    ),
                  ],
                ),
                Align(
                    alignment: Alignment.center,
                    child: viewRow(
                        title: AppStrings.kCompletedConsultations,
                        subtitle: "100")),
                const SizedBox(height: 10.0),
                Text(
                  AppStrings.kInvestigationsList,
                  style: getboldStyle(
                      color: ColorManager.kWhiteColor, fontSize: 16),
                ),
                const SizedBox(height: 5.0),
                InvestigationsTable(),
                const SizedBox(height: 10.0),
                Text(
                  AppStrings.kMyPatients,
                  style: getboldStyle(
                      color: ColorManager.kWhiteColor, fontSize: 16),
                ),
                const SizedBox(height: 10.0),
                _horizantalTableWidget(),
                const SizedBox(height: 30.0),
              ],
            ),
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
              onTap: (){
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
              onTap: (){
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
            Text(
              AppStrings.kSetupYourAvailability,
              style:
                  getboldStyle(color: ColorManager.kWhiteColor, fontSize: 16),
              // textAlign: TextAlign.left,
            ),
            Text(
              AppStrings.kSetupNow,
              style: getboldStyle(color: ColorManager.secondary, fontSize: 16),
              //textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
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
              SvgPicture.asset(ImageAssets.kEditIcon),
              SizedBox(width: 5.0),
              GestureDetector(
                onTap: onTap,
                child: Text(text2 ?? "", //AppStrings.viewAll,
                    style: getmediumStyle(
                        color: ColorManager.secondary,
                        fontSize: AppSize.s12.sp)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget rowText1({String? text1, String? text2, Function()? onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              Icon(
                Icons.add,
                color: ColorManager.kWhiteColor,
                size: 15,
              ),
              SizedBox(width: 5.0),
              GestureDetector(
                onTap: onTap,
                child: Text(text1 ?? "", //AppStrings.viewAll,
                    style: getmediumStyle(
                        color: ColorManager.kWhiteColor,
                        fontSize: AppSize.s14.sp)),
              ),
            ],
          ),
          Row(
            children: [
              SvgPicture.asset(
                ImageAssets.kShareIcon,
                color: ColorManager.secondary,
              ),
              SizedBox(width: 5.0),
              GestureDetector(
                onTap: onTap,
                child: Text(text2 ?? "", //AppStrings.viewAll,
                    style: getmediumStyle(
                        color: ColorManager.secondary,
                        fontSize: AppSize.s12.sp)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget flayer() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
      child: Container(
        height: 300,
        //width: AppSize.sizeWidth(context),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
          image: const DecorationImage(
            colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
            fit: BoxFit.fill,
            image: AssetImage(ImageAssets.kFlayerImage),
          ),
        ),
        child: rowText1(text1: AppStrings.kAddmore, text2: AppStrings.kShare),
      ),
    );
  }

  Widget pieChartWidget() {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(AppStrings.kTotalPatients,
              style: getboldStyle(
                  color: ColorManager.kWhiteColor, fontSize: AppSize.s16.sp)),
          subtitle: Text("412,435 people",
              style: getRegularStyle(
                  color: ColorManager.kWhiteColor, fontSize: AppSize.s12.sp)),
        ),
        PieChart(
          dataMap: dataMap,
          animationDuration: Duration(milliseconds: 800),
          chartLegendSpacing: 32,
          chartRadius: MediaQuery.of(context).size.width / 3.2,
          colorList: colorList,
          initialAngleInDegree: 0,
          chartType: ChartType.disc,
          ringStrokeWidth: 32,
          //centerText: "Total 123456",
          // totalValue: 14.9,
          legendOptions: LegendOptions(
            showLegendsInRow: false,
            legendPosition: LegendPosition.right,
            showLegends: true,
            legendShape: BoxShape.rectangle,
            legendTextStyle:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          chartValuesOptions: ChartValuesOptions(
            showChartValueBackground: true,
            showChartValues: true,
            showChartValuesInPercentage: false,
            showChartValuesOutside: false,
            decimalPlaces: 0,
          ),
          // gradientList: ---To add gradient colors---
          // emptyColorGradient: ---Empty Color gradient---
        ),
      ],
    );
  }

  Map<String, double> dataMap = {
    "New": 64,
    "Recovered": 73,
    "In Treatment": 114,
  };
  List<Color> colorList = [
    Color(0xFF3246D3),
    Color(0xFFFFA800),
    Color(0xFFEE3158),
  ];

  Widget currentPatientsQueue() {
    return Container(
      width: AppSize.sizeWidth(context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: ColorManager.kLightBlueColor,
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipOval(
                        child: Image.asset(
                      ImageAssets.demoUser2Image,
                      height: 30,
                      width: 30,
                    )),
                    const SizedBox(width: 12.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.kSetupYourAvailability,
                          style: getboldStyle(
                              color: ColorManager.kWhiteColor, fontSize: 12),
                          // textAlign: TextAlign.left,
                        ),
                        Text(
                          AppStrings.kSetupNow,
                          style: getboldStyle(
                              color: ColorManager.secondary, fontSize: 10),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "10 min ago",
                      style: getsemiboldStyle(
                          color: ColorManager.kGreyColor, fontSize: 12),
                      // textAlign: TextAlign.left,
                    ),
                    Text(
                      "5 min Left",
                      style: getsemiboldStyle(
                          color: ColorManager.kWhiteColor, fontSize: 14),
                      //textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  //flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                        color: ColorManager.kLightBlueColor,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.blueGrey,
                            offset: Offset(
                              0.0,
                              0.0,
                            ),
                            blurRadius: 3.0,
                            spreadRadius: 2.0,
                          )
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: // Adjust spacing between icon and text
                          Center(
                        child: Text(AppStrings.kReschedule,
                            style: getRegularStyle(
                                fontSize: 12.sp,
                                color: ColorManager.kWhiteColor)),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  //flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorManager.secondary,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child:
                          // Adjust spacing between icon and text
                          Center(
                        child: Text(AppStrings.kStartConsult,
                            style: getRegularStyle(
                                fontSize: 12.sp,
                                color: ColorManager.kWhiteColor)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget viewRow({
    String? title,
    String? subtitle,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: ColorManager.kLightBlueColor,
        ),
        height: 100,
        width: 160,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                title ?? "",
                textAlign: TextAlign.center,
                style: getsemiboldStyle(
                  fontSize: 14,
                  color: ColorManager.secondary,
                ),
              ),
            ),
            Text(
              subtitle ?? "",
              textAlign: TextAlign.center,
              style: getsemiboldStyle(
                fontSize: 22,
                color: ColorManager.kWhiteColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _horizantalTableWidget() {
    return SizedBox(
        height: 420,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: HorizontalDataTable(
            leftHandSideColumnWidth: 60,
            rightHandSideColumnWidth: 600,
            isFixedHeader: true,
            headerWidgets: _getTitleWidget(),
            leftSideItemBuilder: _generateFirstColumnRow,
            rightSideItemBuilder: _generateRightHandSideColumnRow,
            itemCount: 7,
            //user.userInfo.length,
            // rowSeparatorWidget: const Divider(
            //   color: Colors.black54,
            //   height: 1.0,
            //   thickness: 0.0,
            // ),
            leftHandSideColBackgroundColor: ColorManager.kLightBlueColor,
            rightHandSideColBackgroundColor: ColorManager.kLightBlueColor,
            verticalScrollbarStyle: const ScrollbarStyle(
              thumbColor: Colors.grey,
              isAlwaysShown: true,
              thickness: 6.0,
              radius: Radius.circular(5.0),
            ),
            horizontalScrollbarStyle: const ScrollbarStyle(
              thumbColor: Colors.grey,
              isAlwaysShown: true,
              thickness: 6.0,
              radius: Radius.circular(5.0),
            ),
            enablePullToRefresh: true,
            refreshIndicator: const WaterDropHeader(),
            refreshIndicatorHeight: 60,
            onRefresh: () async {
              //Do sth
              await Future.delayed(const Duration(milliseconds: 500));
              _hdtRefreshController.refreshCompleted();
            },
            enablePullToLoadNewData: true,
            loadIndicator: const ClassicFooter(),
            onLoad: () async {
              //Do sth
              await Future.delayed(const Duration(milliseconds: 500));
              _hdtRefreshController.loadComplete();
            },
            htdRefreshController: _hdtRefreshController,
          ),
        ));
  }

  List<Widget> _getTitleWidget() {
    return [
      // TextButton(
      //   style: TextButton.styleFrom(
      //     padding: EdgeInsets.zero,
      //   ),
      //   child: _getTitleItemWidget(
      //       'Order' + (sortType == sortName ? (isAscending ? '↓' : '↑') : ''),
      //       100),
      //   onPressed: () {
      //     sortType = sortName;
      //     isAscending = !isAscending;
      //     user.sortName(isAscending);
      //     setState(() {});
      //   },
      // ),
      // TextButton(
      //   style: TextButton.styleFrom(
      //     padding: EdgeInsets.zero,
      //   ),
      //   child: _getTitleItemWidget(
      //       'Date' +
      //           (sortType == sortStatus ? (isAscending ? '↓' : '↑') : ''),
      //       100),
      //   // onPressed: () {
      //   //   sortType = sortStatus;
      //   //   isAscending = !isAscending;
      //   //   user.sortStatus(isAscending);
      //   //   setState(() {});
      //   // },
      // ),
      _getTitleItemWidget("Patient ID", 60),
      _getTitleItemWidget("Last Consult", 100),
      _getTitleItemWidget("Patient name", 100),
      _getTitleItemWidget("Gender", 100),
      _getTitleItemWidget("Age", 100),
      _getTitleItemWidget("Most Recent diagnosis", 100),
      _getTitleItemWidget("Status", 100),
    ];
  }

  Widget _getTitleItemWidget(String label, double width) {
    return Container(
      //color: Colors.grey.shade400,
      child: Text(label,
          style: getboldStyle(color: ColorManager.secondary, fontSize: 11.sp)),
      width: width,
      height: 56,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.center,
    );
  }

  ///Left First Column
  Widget _generateFirstColumnRow(BuildContext context, int index) {
    return Container(
      // decoration: BoxDecoration(
      //   color: Colors.red,
      //   borderRadius: BorderRadius.circular(10.0),
      // ),
      child: Text(
        "\t\t1",
        style: getRegularStyle(color: ColorManager.kWhiteColor),
      ),
      width: 100,
      height: 52,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
    );
  }

  ///Right row
  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    return Row(
      children: <Widget>[
        // Container(
        //   child: Row(
        //     children: <Widget>[
        //       Icon(
        //           user.userInfo[index].status
        //               ? Icons.notifications_off
        //               : Icons.notifications_active,
        //           color:
        //               user.userInfo[index].status ? Colors.red : Colors.green),
        //       Text(user.userInfo[index].status ? 'Disabled' : 'Active')
        //     ],
        //   ),
        //   width: 100,
        //   height: 52,
        //   padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
        //   alignment: Alignment.centerLeft,
        // ),
        Container(
          child: Text(
            "05 Feb 2024",
            style: getRegularStyle(
              color: ColorManager.kWhiteColor,
              fontSize: 12,
            ),
          ),
          width: 100,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: Text(
            "Ali Ahmed",
            style:
                getRegularStyle(color: ColorManager.kWhiteColor, fontSize: 12),
          ),
          width: 100,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: Text(
            "Male",
            style:
                getRegularStyle(color: ColorManager.kWhiteColor, fontSize: 12),
          ),
          width: 100,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.center,
        ),
        // Container(
        //   child: Text(user.userInfo[index].phone),
        //   width: 100,
        //   height: 52,
        //   padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
        //   alignment: Alignment.centerLeft,
        // ),

        Container(
          child: Text(
            "20 yrs",
            style:
                getRegularStyle(color: ColorManager.kWhiteColor, fontSize: 12),
          ),
          //Text(user.userInfo[index].terminationDate),
          width: 100,
          height: 52,
          padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),

        Container(
          child: Text(
            "Cold & Flu",
            style:
                getRegularStyle(color: ColorManager.kWhiteColor, fontSize: 12),
          ),
          //Text(user.userInfo[index].terminationDate),
          width: 100,
          height: 52,
          padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),

        Container(
          child: Text(
            "New Patient",
            style:
                getRegularStyle(color: ColorManager.kWhiteColor, fontSize: 12),
          ),
          //Text(user.userInfo[index].terminationDate),
          width: 100,
          height: 52,
          padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
      ],
    );
  }
}

User user = User();

class User {
  List<UserInfo> userInfo = [];

  void initData(int size) {
    for (int i = 0; i < size; i++) {
      userInfo.add(UserInfo(
          // "User_$i", i % 3 == 0, 'Billing For', '2019-01-01', 'N/A'));
          " 1",
          i % 3 == 0,
          "Billing For",
          '27 Jan 2024',
          'N/A'));
    }
  }

  ///
  /// Single sort, sort Name's id
  void sortName(bool isAscending) {
    userInfo.sort((a, b) {
      int aId = int.tryParse(a.name.replaceFirst('User_', '')) ?? 0;
      int bId = int.tryParse(b.name.replaceFirst('User_', '')) ?? 0;
      return (aId - bId) * (isAscending ? 1 : -1);
    });
  }

  ///
  /// sort with Status and Name as the 2nd Sort
  void sortStatus(bool isAscending) {
    userInfo.sort((a, b) {
      if (a.status == b.status) {
        int aId = int.tryParse(a.name.replaceFirst('User_', '')) ?? 0;
        int bId = int.tryParse(b.name.replaceFirst('User_', '')) ?? 0;
        return (aId - bId);
      } else if (a.status) {
        return isAscending ? 1 : -1;
      } else {
        return isAscending ? -1 : 1;
      }
    });
  }
}

class UserInfo {
  String name;
  bool status;
  String phone;
  String registerDate;
  String terminationDate;

  UserInfo(this.name, this.status, this.phone, this.registerDate,
      this.terminationDate);
}
