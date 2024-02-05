import 'package:flutter/material.dart';

import '../export_dulex.dart';

class InvestigationModel {
  String? heading;
  List<String>? list;

  InvestigationModel({this.heading, this.list});
}

class InvestigationsTable extends StatelessWidget {
  InvestigationsTable({Key? key}) : super(key: key);

  InvestigationModel patientId = InvestigationModel(
      heading: "Patient ID", list: ["1", "1", "1", "1", "1", "1", "1"]);
  InvestigationModel test = InvestigationModel(heading: "Test", list: [
    "Blood Count",
    "Blood Count",
    "Blood Count",
    "Blood Count",
    "Blood Count",
    "Blood Count",
    "Blood Count"
  ]);
  InvestigationModel lab = InvestigationModel(heading: "Lab", list: [
    "Micro Biology",
    "Micro Biology",
    "Micro Biology",
    "Micro Biology",
    "Micro Biology",
    "Micro Biology",
    "Micro Biology"
  ]);
  InvestigationModel dateOfSubmission =
      InvestigationModel(heading: "Date of submission", list: [
    "24 Jan 2024",
    "24 Jan 2024",
    "24 Jan 2024",
    "24 Jan 2024",
    "24 Jan 2024",
    "24 Jan 2024",
    "24 Jan 2024"
  ]);
  InvestigationModel status = InvestigationModel(heading: "Status", list: [
    "Result added",
    "Result added",
    "Result added",
    "Result added",
    "Result added",
    "Result added",
    "Result added"
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                        width: 45,
                        child: Text(
                          patientId.heading ?? "",
                          textAlign: TextAlign.center,
                          style: getsemiboldStyle(
                            fontSize: 12,
                            color: ColorManager.secondary,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
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
                    Text(
                      test.heading ?? "",
                      textAlign: TextAlign.center,
                      style: getsemiboldStyle(
                        fontSize: 12,
                        color: ColorManager.secondary,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    builder(test.list!),
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
                    Text(
                      lab.heading ?? "",
                      textAlign: TextAlign.center,
                      style: getsemiboldStyle(
                        fontSize: 12,
                        color: ColorManager.secondary,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    builder(lab.list!),
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
                    Text(
                      dateOfSubmission.heading ?? "",
                      textAlign: TextAlign.left,
                      style: getsemiboldStyle(
                        fontSize: 12,
                        color: ColorManager.secondary,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    builder(dateOfSubmission.list!),
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
                    Text(
                      status.heading ?? "",
                      textAlign: TextAlign.center,
                      style: getsemiboldStyle(
                        fontSize: 12,
                        color: ColorManager.secondary,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 0),
                      child: ListView.separated(
                          separatorBuilder: (context, i) =>
                              SizedBox(height: 5.0),
                          shrinkWrap: true,
                          itemCount: status.list!.length,
                          //patientId.list!.length,
                          itemBuilder: (context, index) {
                            return Container(
                              //color: Colors.red,
                              height: 40,
                              // width: 40,
                              child: Text(
                                status.list![index],
                                style: getRegularStyle(
                                  fontSize: 12,
                                  color: ColorManager.secondary,
                                ),
                              ),
                            );
                          }),
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
