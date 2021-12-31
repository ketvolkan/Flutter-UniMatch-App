// To parse this JSON data, do
//
//     final user = userFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

import 'package:unimatch/models/UserPhoto.dart';

User userFromMap(String str) => User.fromMap(json.decode(str));

String userToMap(User data) => json.encode(data.toMap());

class User {
  User({
    required this.data,
    required this.message,
    required this.success,
  });

  final List<Datum> data;
  final String message;
  final bool success;

  factory User.fromMap(Map<String, dynamic> json) => User(
        data: List<Datum>.from(
            (json["data"] as List).map((x) => Datum.fromMap(x))).toList(),
        message: json["message"],
        success: json["success"],
      );

  Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
        "message": message,
        "success": success,
      };
}

class Datum {
  final List<UserPhoto> userPhotoUserId = [];
  Datum({
    required this.active,
    required this.dateOfBirth,
    required this.description,
    required this.firstName,
    required this.gender,
    required this.id,
    required this.lastName,
    required this.mail,
    required this.phoneNumber,
    required this.verifiedAccount,
  });

  final bool active;
  final DateTime dateOfBirth;
  final String description;
  final String firstName;
  final String gender;
  final int id;
  final String lastName;
  final String mail;
  final String phoneNumber;
  final bool verifiedAccount;

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        active: json["active"],
        dateOfBirth: DateTime.parse(json["dateOfBirth"]),
        description: json["description"],
        firstName: json["firstName"],
        gender: json["gender"],
        id: json["id"],
        lastName: json["lastName"],
        mail: json["mail"],
        phoneNumber: json["phoneNumber"],
        verifiedAccount: json["verifiedAccount"],
      );

  Map<String, dynamic> toMap() => {
        "active": active,
        "dateOfBirth": dateOfBirth.toIso8601String(),
        "description": description,
        "firstName": firstName,
        "gender": gender,
        "id": id,
        "lastName": lastName,
        "mail": mail,
        "phoneNumber": phoneNumber,
        "verifiedAccount": verifiedAccount,
      };
}
