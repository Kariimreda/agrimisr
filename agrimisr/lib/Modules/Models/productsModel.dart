// To parse this JSON data, do
//
//     final cartItem = cartItemFromMap(jsonString);

import 'dart:convert';

class ProductsModel {
  ProductsModel({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.quantity,
    required this.price,
  });

  int id;
  String imageUrl;
  String title;
  int quantity;
  double price;

  factory ProductsModel.fromJson(String str) =>
      ProductsModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductsModel.fromMap(Map<String, dynamic> json) => ProductsModel(
        id: json["id"],
        imageUrl: json["imageUrl"],
        title: json["title"],
        quantity: json["quantity"],
        price: json["price"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "imageUrl": imageUrl,
        "title": title,
        "quantity": quantity,
        "pricePerItem": price,
      };
}
