import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:unimatch/models/User.dart';
import 'package:unimatch/models/Like.dart';
import 'package:unimatch/utilities/connection.dart';

Future<http.Response> likeUser(User likedUser, User popularUser) {
  return http.post(
    Uri.parse(connection() + "/like/add"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'id': 0,
      'likesId': likedUser.id,
      'popularId': popularUser.id
    }),
  );
}

Future<List<Like>> getAllLike({String service = "getAll"}) async {
  try {
    Uri url = Uri.parse(connection() + "/like/" + service);
    var response = await http.get(url, headers: {"Accept": "application/json"});
    List<Like> likeList = [];
    if (response.statusCode == 200) {
      var resBody = json.decode(utf8.decode(response.bodyBytes));
      for (var i = 0; i < (resBody['data'] as List).length; i++) {
        likeList.add(new Like(
          id: resBody['data'][i]['id'],
          likesId: resBody['data'][i]['likesId'],
          popularId: resBody['data'][i]['popularId'],
        ));
      }
    }
    return likeList;
  } on DioError catch (e) {
    return Future.error(e.message);
  }
}

Future<List<Like>> getAllLikeByLikesId(
    {String service = "/getAllByLikesId?id=", required int id}) async {
  return await getAllLike(service: service + id.toString());
}

Future<List<Like>> getAllLikeByPopularId(
    {String service = "/getAllByPopularId?id=", required int id}) async {
  return await getAllLike(service: service + id.toString());
}
