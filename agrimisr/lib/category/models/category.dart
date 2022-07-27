// To parse this JSON data, do
//
//     final category = categoryFromMap(jsonString);

import 'dart:convert';

class Category {
  Category({
    required this.id,
    required this.title,
    required this.path,
    this.productCount,
  });

  int id;
  String title;
  String path;
  int? productCount;

  factory Category.fromJson(String str) => Category.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Category.fromMap(Map<String, dynamic> json) => Category(
        id: json["id"],
        title: json["title"],
        path: json["path"],
        productCount: json["productCount"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "path": path,
        "productCount": productCount,
      };
}
