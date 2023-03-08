import 'dart:convert';

List<ListNewsModel> listNewsModelFromJson(String str) => List<ListNewsModel>.from(json.decode(str).map((x) => ListNewsModel.fromJson(x)));

String listNewsModelToJson(List<ListNewsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ListNewsModel {
    ListNewsModel({
        required this.userId,
        required this.id,
        required this.title,
        required this.body,
    });

    int userId;
    int id;
    String title;
    String body;

    factory ListNewsModel.fromJson(Map<String, dynamic> json) => ListNewsModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
    };
}
