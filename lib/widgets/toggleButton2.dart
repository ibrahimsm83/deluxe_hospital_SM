import 'package:flutter/material.dart';
import '../export_dulex.dart';


class ToggleButtonList1 extends StatelessWidget {
  final int? selected;
  final Function? callback;
  final List? categories;

  const ToggleButtonList1(
      {Key? key, this.selected, this.callback, this.categories})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          //physics: NeverScrollableScrollPhysics(),
          itemCount: categories!.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => callback!(index),
              child: Container(
                margin: EdgeInsets.only(
                    left: index == AppMargin.m0 ? AppMargin.m5 : AppMargin.m0,
                    right:5,
                    top: AppMargin.m15,
                    bottom: AppMargin.m8),
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p30),
                decoration: BoxDecoration(
                    color: selected == index
                        ? ColorManager.secondary
                        : ColorManager.kLightBlueColor,
                    borderRadius: BorderRadius.circular(AppSize.s15),
                    boxShadow: [
                      BoxShadow(color: Colors.grey.withOpacity(0.3)),
                    ]),
                child: Center(
                  child: Text(categories![index],
                      style: getmediumStyle(
                        fontSize: AppSize.s12,
                        color: selected == index
                            ? ColorManager.kWhiteColor
                            : ColorManager.kGreyColor,
                      )),
                ),
              ),
            );
          }),
    );
  }
}
