// To parse this JSON data, do
//
//     final userPhoto = userPhotoFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

import 'package:unimatch/models/User.dart';

UserPhoto userPhotoFromMap(String str) => UserPhoto.fromMap(json.decode(str));

String userPhotoToMap(UserPhoto data) => json.encode(data.toMap());

class UserPhoto {
  UserPhoto({
    required this.data,
    required this.message,
    required this.success,
  });

  final List<Datum> data;
  final String message;
  final bool success;

  factory UserPhoto.fromMap(Map<String, dynamic> json) => UserPhoto(
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
  Datum({
    required this.active,
    required this.id,
    required this.photoUrl,
    required this.userId,
  });

  final bool active;
  final int id;
  final String photoUrl;
  final User userId;

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        active: json["active"],
        id: json["id"],
        photoUrl: json["photoUrl"],
        userId: User.fromMap(json["userId"]),
      );

  Map<String, dynamic> toMap() => {
        "active": active,
        "id": id,
        "photoUrl": photoUrl,
        "userId": userId.toMap(),
      };
}
