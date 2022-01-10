import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:unimatch/models/User.dart';
import 'package:unimatch/models/UserPhoto.dart';
import 'package:unimatch/utilities/connection.dart';

Future<List<UserPhoto>> getAllUserPhoto({String service = "getAll"}) async {
  try {
    Uri url = Uri.parse(connection() + "/userPhoto/" + service);
    var response = await http.get(url, headers: {"Accept": "application/json"});
    List<UserPhoto> userPhotoList = [];
    if (response.statusCode == 200) {
      var resBody = json.decode(utf8.decode(response.bodyBytes));
      for (var i = 0; i < (resBody['data'] as List).length; i++) {
        userPhotoList.add(new UserPhoto(
            active: resBody['data'][i]['active'],
            id: resBody['data'][i]['id'],
            photoUrl: resBody['data'][i]['photoUrl'],
            userId: resBody['data'][i]['user']['id']));
      }
    }
    return userPhotoList;
  } on DioError catch (e) {
    return Future.error(e.message);
  }
}
