import 'package:flutter/material.dart';
import 'package:model_test/services/response_model.dart';
import 'package:model_test/services/services.dart';
import 'dart:convert';
import '../models/user_model.dart';

import 'package:http/http.dart' as http;

class ProfileViewModel extends ChangeNotifier {
  User? user;
  List<User> users = [];

  final Services services = Services();
  int perPage = 6;
  int page = 1;
  int totalPage = 1;
  bool loading = false;

  Future getUser(int id) async {
    loading = true;
    notifyListeners();
    ResponseModel response = await services.getUser(id);
    if (response.success) {
      user = User.fromJson(response.data!);
    }
    loading = false;

    notifyListeners();
  }

  Future getUsers() async {
    loading = true;
    notifyListeners();
    ResponseModel response = await services.getUsers(page);
    // "?page=$page&per_page=$perPage&delay=3"

    if (response.success) {
      users.clear();
      totalPage = response.data!["total_pages"];
      for (var item in response.data!["data"]) {
        users.add(User.fromJson(item));
      }
    }
    loading = false;

    notifyListeners();
  }

  Future setPage(int p) async {
    page = p;
    await getUsers();
  }
}
