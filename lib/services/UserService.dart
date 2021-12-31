import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:unimatch/models/User.dart';
import 'package:unimatch/utilities/connection.dart';

Future<List<User>> getAllUser() async {
  try {
    var response = await Dio().get(connection() + "/user/getAll");
    List<User> userList = [];
    if (response.statusCode == 200) {
      userList = (response.data as List).map((e) => User.fromMap(e)).toList();
    }
    return userList;
  } on DioError catch (e) {
    return Future.error(e.message);
  }
}
