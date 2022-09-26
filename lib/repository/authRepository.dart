import 'dart:convert';

import '../app_configurations/app_config.dart';
import 'BaseRepository.dart';
import 'package:http/http.dart' as http;

class AuthRepository extends BaseRepository{
  AuthRepository() : super(controller: "auth");

  Future<bool> login({required String email, required String password}) async {
    Map user = {'email': email,
    'password' : password,};
    var res = await http.post(
        Uri.parse("${AppConfiguration.baseUrl}/$controller/login"),
        body: json.encode(user),
        headers: header());
    return res.statusCode == 200;
  }
}