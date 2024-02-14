import 'package:flutter/material.dart';

import '../export_dulex.dart';

class RefundHistoryModel {
  String? heading;
  List<String>? list;

  RefundHistoryModel({this.heading, this.list});
}

class RefundHistoryTable extends StatelessWidget {
  RefundHistoryTable({Key? key}) : super(key: key);

  RefundHistoryModel patientId = RefundHistoryModel(
      heading: "Transaction #", list: ["1", "1", "1", "1","1","1"]);

  RefundHistoryModel amount =
  RefundHistoryModel(heading: "Amount", list: [
    "\$20",
    "\$20",
    "\$20",
    "\$20",
    "\$20",
    "\$20",
  ]);
  RefundHistoryModel dateAndTime = RefundHistoryModel(heading: "Date and Time", list: [
    "2024/09/17",
    "2024/09/17",
    "2024/09/17",
    "2024/09/17",
    "2024/09/17",
    "2024/09/17",
  ]);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: ColorManager.kLightBlueColor,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 0.0,top:10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 75,
                        child: Text(
                          patientId.heading ?? "",
                          textAlign: TextAlign.center,
                          style: getsemiboldStyle(
                            fontSize: 10,
                            color: ColorManager.secondary,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: builder(patientId.list!),
                    ),
                  ],
                ),
              ),
            ),

            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        amount.heading ?? "",
                        textAlign: TextAlign.left,
                        style: getsemiboldStyle(
                          fontSize: 12,
                          color: ColorManager.secondary,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: builder(amount.list!),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      dateAndTime.heading ?? "",
                      textAlign: TextAlign.left,
                      style: getsemiboldStyle(
                        fontSize: 12,
                        color: ColorManager.secondary,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: builder(dateAndTime.list!),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget builder(dynamic list) {
    return Padding(
      padding: const EdgeInsets.only(left: 00),
      child: ListView.separated(
          separatorBuilder: (context, i) => SizedBox(height: 5.0),
          shrinkWrap: true,
          itemCount: list.length, //patientId.list!.length,
          itemBuilder: (context, index) {
            return Container(
              //color: Colors.red,
              height: 40,
              // width: 40,
              child: Text(
                list![index],
                style: getRegularStyle(
                  fontSize: 12,
                  color: ColorManager.kWhiteColor,
                ),
              ),
            );
          }),
    );
  }
}
