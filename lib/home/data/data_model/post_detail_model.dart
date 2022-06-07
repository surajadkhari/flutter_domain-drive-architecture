class PostDetailModel {
  final int userId;
  final int id;
  final String titile;
  final String body;

  PostDetailModel(
      {required this.userId,
      required this.id,
      required this.titile,
      required this.body});

  factory PostDetailModel.fromJson(Map<String, dynamic> json) {
    return PostDetailModel(
        userId: json["userId"],
        id: json["id"],
        titile: json["titile"],
        body: json["body"]);
  }
}
