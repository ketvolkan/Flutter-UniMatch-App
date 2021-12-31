import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:unimatch/models/User.dart';
import 'package:unimatch/models/UserPhoto.dart';
import 'package:unimatch/utilities/connection.dart';

Future<List<UserPhoto>> getAllUserPhoto() async {
  try {
    var response = await Dio().get(connection() + "/userPhoto/getAll");
    List<UserPhoto> userPhotoList = [];
    if (response.statusCode == 200) {
      userPhotoList =
          (response.data as List).map((e) => UserPhoto.fromMap(e)).toList();
    }
    return userPhotoList;
  } on DioError catch (e) {
    return Future.error(e.message);
  }
}
