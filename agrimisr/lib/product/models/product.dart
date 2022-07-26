// To parse this JSON data, do
//
//     final product = productFromMap(jsonString);

import 'dart:convert';

class Product {
  Product({
    required this.id,
    required this.title,
    required this.rating,
    required this.imageUrl,
    required this.seller,
    required this.weight,
    required this.quantity,
    required this.price,
    required this.min,
    required this.wishlisted,
  });

  int id;
  String title;
  double rating;
  String imageUrl;
  String seller;
  String weight;
  int quantity;
  double price;
  int min;
  bool wishlisted;

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        rating: json["rating"].toDouble(),
        imageUrl: json["imageUrl"],
        seller: json["seller"],
        weight: json["weight"],
        quantity: json["quantity"],
        price: json["price"].toDouble(),
        min: json["min"],
        wishlisted: json["wishlisted"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "rating": rating,
        "imageUrl": imageUrl,
        "seller": seller,
        "weight": weight,
        "quantity": quantity,
        "price": price,
        "min": min,
        "wishlisted": wishlisted,
      };
}
