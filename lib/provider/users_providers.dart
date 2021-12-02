import 'dart:convert';

import 'package:eos_app/api/enviroment.dart';
// import 'package:eos_app/models/response_api.dart';
import 'package:eos_app/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UsersProvider {
  String _url = Enviroment.API_LOGIN;
  String _api = 'api/login';

  BuildContext context;

  Future init(BuildContext context) {
    this.context = context;
  }

  Future<User> login(String username, String password) async {
    try {
      Uri url = Uri.parse(_url + '$_api/authenticate');
      String bodyParams =
          json.encode({'username': username, 'password': password});
      Map<String, String> headers = {'Content-type': 'application/json'};
      final res = await http.post(url, headers: headers, body: bodyParams);
      print(res.body);
      final data = json.decode(res.body);
      print(data);

      User user = User.fromJson(data);

      return user;
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
}
