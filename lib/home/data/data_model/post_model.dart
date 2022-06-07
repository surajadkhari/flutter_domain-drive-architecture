class PostModel {
  final String title;
  final String body;
  final int userId;
  final int id;
  PostModel(
      {required this.title,
      required this.body,
      required this.id,
      required this.userId});

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
        title: json["title"] ?? "",
        body: json["body"] ?? "",
        id: json["id"],
        userId: json["userId"]);
  }
}
