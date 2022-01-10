// To parse this JSON data, do
//
//     final user = userFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

import 'package:unimatch/models/UserPhoto.dart';

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
  final String dateOfBirth;
  final String description;
  final String firstName;
  final String gender;
  final int id;
  final String lastName;
  final String mail;
  final String phoneNumber;
  final String password;
  final bool verifiedAccount;
}
