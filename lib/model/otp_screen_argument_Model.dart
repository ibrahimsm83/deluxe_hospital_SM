class OtpScreenArgumentModel {
  String email = "";
  bool isForgotPwPage = false;

  OtpScreenArgumentModel.isEmpty();

  OtpScreenArgumentModel.required({
    required this.email,
    required this.isForgotPwPage,
  });
}