// ignore_for_file: public_member_api_docs, sort_constructors_first
// To parse this JSON data, do
//
//     final userModel = userModelFromMap(jsonString);

import 'dart:convert';

import 'package:meta/meta.dart';

UserModel userModelFromMap(String str) => UserModel.fromMap(json.decode(str));

String userModelToMap(UserModel data) => json.encode(data.toMap());

class UserModel {
    final int id;
    final String name;
    final String username;
    final String email;
    final Address address;
    final String phone;
    final String website;
    final Company company;

    UserModel({
        required this.id,
        required this.name,
        required this.username,
        required this.email,
        required this.address,
        required this.phone,
        required this.website,
        required this.company,
    });

    factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        address: Address.fromMap(json["address"]),
        phone: json["phone"],
        website: json["website"],
        company: Company.fromMap(json["company"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "username": username,
        "email": email,
        "address": address.toMap(),
        "phone": phone,
        "website": website,
        "company": company.toMap(),
    };
}

class Address {
    final String street;
    final String suite;
    final String city;
    final String zipcode;
    final Geo geo;

    Address({
        required this.street,
        required this.suite,
        required this.city,
        required this.zipcode,
        required this.geo,
    });

    factory Address.fromMap(Map<String, dynamic> json) => Address(
        street: json["street"],
        suite: json["suite"],
        city: json["city"],
        zipcode: json["zipcode"],
        geo: Geo.fromMap(json["geo"]),
    );

    Map<String, dynamic> toMap() => {
        "street": street,
        "suite": suite,
        "city": city,
        "zipcode": zipcode,
        "geo": geo.toMap(),
    };

  @override
  String toString() {
    return 'Address(street: $street, suite: $suite, city: $city, zipcode: $zipcode, geo: $geo)';
  }
}

class Geo {
    final String lat;
    final String lng;

    Geo({
        required this.lat,
        required this.lng,
    });

    factory Geo.fromMap(Map<String, dynamic> json) => Geo(
        lat: json["lat"],
        lng: json["lng"],
    );

    Map<String, dynamic> toMap() => {
        "lat": lat,
        "lng": lng,
    };
}

class Company {
    final String name;
    final String catchPhrase;
    final String bs;

    Company({
        required this.name,
        required this.catchPhrase,
        required this.bs,
    });

    factory Company.fromMap(Map<String, dynamic> json) => Company(
        name: json["name"],
        catchPhrase: json["catchPhrase"],
        bs: json["bs"],
    );

    Map<String, dynamic> toMap() => {
        "name": name,
        "catchPhrase": catchPhrase,
        "bs": bs,
    };
}
