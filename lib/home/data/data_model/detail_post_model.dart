class PostDetail {
  final int userId;
  final int id;
  final String titile;
  final String body;

  PostDetail(
      {required this.userId,
      required this.id,
      required this.titile,
      required this.body});

  factory PostDetail.fromJson(Map<String, dynamic> json) => PostDetail(
      userId: json["userId"],
      id: json["id"],
      titile: json["titile"],
      body: json["body"]);
}
