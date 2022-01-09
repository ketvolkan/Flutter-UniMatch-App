import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:unimatch/models/User.dart';
import 'package:unimatch/utilities/connection.dart';

Future<List<User>> getAllUser({String service = "getAll"}) async {
  try {
    Uri url = Uri.parse(connection() + "/user/" + service);
    var response = await http.get(url, headers: {"Accept": "application/json"});
    List<User> userList = [];
    if (response.statusCode == 200) {
      var resBody = json.decode(utf8.decode(response.bodyBytes));
      for (var i = 0; i < (resBody['data'] as List).length; i++) {
        userList.add(new User(
          active: resBody['data'][i]['active'],
          dateOfBirth: DateTime.parse(resBody['data'][i]['dateOfBirth']),
          description: resBody['data'][i]['description'],
          firstName: resBody['data'][i]['firstName'],
          gender: resBody['data'][i]['gender'],
          id: resBody['data'][i]['id'],
          lastName: resBody['data'][i]['lastNamea'],
          mail: resBody['data'][i]['mail'],
          phoneNumber: resBody['data'][i]['phoneNumber'],
          verifiedAccount: resBody['data'][i]['verifiedAccount'],
          password: resBody['data'][i]["password"],
          userPhotos: [],
        ));
      }
    }
    return userList;
  } on DioError catch (e) {
    return Future.error(e.message);
  }
}

Future<List<User>> getAllUserById(
    {String service = "/getById?id=", required int id}) async {
  return await getAllUser(service: service + id.toString());
}

Future<List<User>> getAllUserByGender(
    {String service = "getAll", required String gender}) async {
  return getAllUser(service: "/getAllByGender?gender=" + gender.toString());
}

Future<List<User>> getAllUserByPhoneNumber(
    {String service = "getAll", required String phoneNumber}) async {
  return getAllUser(service: "/getAllByPhoneNumber?phoneNumber=" + phoneNumber);
}

Future<List<User>> getAllUserByMail(
    {String service = "getAll", required String mail}) async {
  return getAllUser(service: "/getAllByMail?mail=" + mail.toString());
}

Future<List<User>> getAllByVerifiedAccount(
    {String service = "getAll", required bool VerifiedAccount}) async {
  return getAllUser(
      service: "/getAllByVerifiedAccount?verifiedAccount=" +
          VerifiedAccount.toString());
}

Future<List<User>> getAllUserByActive(
    {String service = "getAll", required bool Active}) async {
  return getAllUser(service: "/getAllByActive?active=" + Active.toString());
}
