import 'package:flutter/material.dart';

import '../export_dulex.dart';


// ignore: must_be_immutable
class CustomTextFormField extends StatefulWidget {
  String? hintText;
  bool obscureText;
  bool readOnly;
  double horizontalMergin;
  int maxLines;
  Color fillColor;
  TextInputType? keyboardType;
  TextEditingController? controller;
  Widget? suffixIcon;
  FocusNode? focusNode;
  void Function()? onTextFiledTap;
  String? Function(String?)? validator;
  CustomTextFormField({
    Key? key,
    this.hintText,
    this.validator,
    this.readOnly=false,
    this.fillColor = Colors.transparent,
    this.onTextFiledTap,
    this.keyboardType,
    this.focusNode,
    this.maxLines = 1,
    this.suffixIcon,
    this.horizontalMergin = 0.05,
    this.controller,
    this.obscureText = false,
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomeTextFormFieldState();
}

class _CustomeTextFormFieldState extends State<CustomTextFormField> {
  late bool _pwShow;
  @override
  void initState() {
    _pwShow = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: AppSize.sizeWidth(context) * widget.horizontalMergin),
      child: TextFormField(
        readOnly: widget.readOnly,
        onTap: widget.onTextFiledTap,
        keyboardType: widget.keyboardType,
        validator: widget.validator,
        obscureText: _pwShow,
        focusNode: widget.focusNode,
        controller: widget.controller,
        maxLines: widget.maxLines,
        style: getRegularStyle(color: ColorManager.kWhiteColor),
        decoration: InputDecoration(
          filled: true,
          errorMaxLines: 2,
          isCollapsed: true,
          fillColor: widget.fillColor,
          hintText: widget.hintText,
          hintStyle: getmediumStyle(color: ColorManager.kGreyColor),
          contentPadding: const EdgeInsets.fromLTRB(14, 14.0, 14.0, 14.0),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide:
              BorderSide(color: ColorManager.kGreyColor, width: 1.5)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide:
              BorderSide(color: ColorManager.kGreyColor, width: 1.5)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(color: ColorManager.primary, width: 1.5)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(color: ColorManager.kRedColor, width: 1.5)),
          suffixIcon: widget.suffixIcon ??
              Visibility(
                visible: widget.obscureText,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _pwShow = !_pwShow;
                    });
                  },
                  child: _pwShow
                      ? Icon(
                    Icons.visibility_off,
                    color: ColorManager.kGreyColor,
                  )
                      : Icon(
                    Icons.visibility,
                    color: ColorManager.kGreyColor,
                  ),
                ),
              ),
        ),
      ),
    );
  }
}