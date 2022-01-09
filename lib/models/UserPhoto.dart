// To parse this JSON data, do
//
//     final userPhoto = userPhotoFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

import 'package:unimatch/models/User.dart';

UserPhoto userPhotoFromMap(String str) => UserPhoto.fromMap(json.decode(str));

class UserPhoto {
  UserPhoto({
    required this.active,
    required this.id,
    required this.photoUrl,
    required this.userId,
  });

  final bool active;
  final int id;
  final String photoUrl;
  final int userId;

  factory UserPhoto.fromMap(Map<String, dynamic> json) => UserPhoto(
        active: json["active"],
        id: json["id"],
        photoUrl: json["photoUrl"],
        userId: json["userId"]['id'],
      );
}
