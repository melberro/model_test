import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:model_test/services/response_model.dart';

import '../services/services.dart';

class LoginViewModel extends ChangeNotifier {
  TextEditingController usernameController =
      TextEditingController(text: "eve.holt@reqres.in");
  TextEditingController passwordController =
      TextEditingController(text: "cityslicka");

  Services services = Services();

  bool isLogin = false;

  Future<bool> login() async {
    var body = {
      "email": usernameController.text,
      "password": passwordController.text,
    };
    print(body);

    ResponseModel response = await services.login(body);

    if (response.success) {
      print(response.data);
    }
    isLogin = response.success;
    return response.success;
  }
}
