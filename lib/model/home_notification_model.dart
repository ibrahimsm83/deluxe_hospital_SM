class HomeNotificationModel {
  String title = "";
  String dateTime = "";
  String iconPath = "";
  String description = "";


  HomeNotificationModel.isEmpty();

  HomeNotificationModel.required({
    required this.title,
    required this.dateTime,
    required this.iconPath,
    required this.description,
  });
}
