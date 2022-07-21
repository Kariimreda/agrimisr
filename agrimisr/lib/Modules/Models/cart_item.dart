// To parse this JSON data, do
//
//     final cartItem = cartItemFromMap(jsonString);

import 'dart:convert';

class CartItem {
  CartItem({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.quantity,
    required this.pricePerItem,
    required this.total,
    required this.minQuant,
    required this.maxQuant,
  });

  int id;
  String imageUrl;
  String title;
  int quantity;
  int pricePerItem;
  int total;
  int minQuant;
  int maxQuant;

  factory CartItem.fromJson(String str) => CartItem.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CartItem.fromMap(Map<String, dynamic> json) => CartItem(
        id: json["id"],
        imageUrl: json["imageUrl"],
        title: json["title"],
        quantity: json["quantity"],
        pricePerItem: json["pricePerItem"],
        total: json["total"],
        minQuant: json["minQuant"],
        maxQuant: json["maxQuant"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "imageUrl": imageUrl,
        "title": title,
        "quantity": quantity,
        "pricePerItem": pricePerItem,
        "total": total,
        "minQuant": minQuant,
        "maxQuant": maxQuant,
      };
}
