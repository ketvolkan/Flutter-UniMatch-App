import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:unimatch/models/Dislike.dart';
import 'package:unimatch/models/User.dart';
import 'package:unimatch/utilities/connection.dart';

Future<http.Response> dislikeUser(User dislikeUser, User outOfFavor) {
  return http.post(
    Uri.parse(connection() + "/dislike/add"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'id': 0,
      'dislikeId': dislikeUser.id,
      'outOfFavorId': outOfFavor.id,
    }),
  );
}

Future<List<Dislike>> getAllDislike({String service = "getAll"}) async {
  try {
    Uri url = Uri.parse(connection() + "/dislike/" + service);
    var response = await http.get(url, headers: {"Accept": "application/json"});
    List<Dislike> likeList = [];
    if (response.statusCode == 200) {
      var resBody = json.decode(utf8.decode(response.bodyBytes));
      for (var i = 0; i < (resBody['data'] as List).length; i++) {
        likeList.add(new Dislike(
          id: resBody['data'][i]['id'],
          dislikeId: resBody['data'][i]['dislikeId'],
          outOfFavorId: resBody['data'][i]['outOfFavorId'],
        ));
      }
    }
    return likeList;
  } on DioError catch (e) {
    return Future.error(e.message);
  }
}

Future<List<Dislike>> getAllDislikeByDisikesId(
    {String service = "/getAllByDislikesId?id=", required int id}) async {
  return await getAllDislike(service: service + id.toString());
}

Future<List<Dislike>> getAllDislikeByOutOfFavorId(
    {String service = "/getAllByOutOfFavorId?id=", required int id}) async {
  return await getAllDislike(service: service + id.toString());
}
