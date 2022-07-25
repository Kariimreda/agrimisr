// To parse this JSON data, do
//
//     final adress = adressFromMap(jsonString);

import 'dart:convert';

class Address {
  Address({
    required this.id,
    required this.firstName,
    required this.lastName,
    this.company,
    required this.firstAdress,
    this.secondAdress,
    required this.city,
    this.postalCode,
    required this.country,
    required this.governorate,
    required this.virtualAdress,
  });

  int id;
  String firstName;
  String lastName;
  String? company;
  String firstAdress;
  String? secondAdress;
  String city;
  String? postalCode;
  String country;
  String governorate;
  bool virtualAdress;

  factory Address.fromJson(String str) => Address.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Address.fromMap(Map<String, dynamic> json) => Address(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        company: json["company"],
        firstAdress: json["firstAdress"],
        secondAdress: json["secondAdress"],
        city: json["city"],
        postalCode: json["postalCode"],
        country: json["country"],
        governorate: json["governorate"],
        virtualAdress: json["virtualAdress"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "company": company,
        "firstAdress": firstAdress,
        "secondAdress": secondAdress,
        "city": city,
        "postalCode": postalCode,
        "country": country,
        "governorate": governorate,
        "virtualAdress": virtualAdress,
      };
}
