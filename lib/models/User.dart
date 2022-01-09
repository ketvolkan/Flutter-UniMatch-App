// To parse this JSON data, do
//
//     final user = userFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

import 'package:unimatch/models/UserPhoto.dart';

User userFromMap(String str) => User.fromMap(json.decode(str));

class User {
  User(
      {required this.active,
      required this.dateOfBirth,
      required this.description,
      required this.firstName,
      required this.gender,
      required this.id,
      required this.lastName,
      required this.mail,
      required this.phoneNumber,
      required this.verifiedAccount,
      required this.password,
      required this.userPhotos});
  late List<String> userPhotos = [];
  final bool active;
  final DateTime dateOfBirth;
  final String description;
  final String firstName;
  final String gender;
  final int id;
  final String lastName;
  final String mail;
  final String phoneNumber;
  final String password;
  final bool verifiedAccount;

  factory User.fromMap(Map<String, dynamic> json) => User(
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
      password: json["password"],
      userPhotos: []);
}
