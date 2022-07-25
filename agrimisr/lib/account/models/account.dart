// To parse this JSON data, do
//
//     final account = accountFromMap(jsonString);

import 'dart:convert';

class Account {
  Account({
    required this.id,
    required this.firstName,
    required this.lastName,
    this.email,
    required this.phone,
  });

  int id;
  String firstName;
  String lastName;
  String? email;
  String phone;

  factory Account.fromJson(String str) => Account.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Account.fromMap(Map<String, dynamic> json) => Account(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        phone: json["phone"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "phone": phone,
      };
}
