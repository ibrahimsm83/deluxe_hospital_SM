class UserCardModel {
  String name = "";
  String specialist = "";
  String language = "";
  int reviews = 5;
  String userImage = "";

  UserCardModel.isEmpty();

  UserCardModel.required({
    required this.name,
    required this.specialist,
    required this.language,
    required this.reviews,
    required this.userImage,
  });
}


