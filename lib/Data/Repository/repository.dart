import 'dart:convert';

import 'package:http/http.dart';

import 'package:mini_projet/constant/constant.dart';

import '../web_services/web_services.dart';
import '../model/user_model.dart';

class Repository {
  final WebServices apiProvider;

  Repository(this.apiProvider);

  Future<List<User>> getUsers() async {
    try {
      final response = await apiProvider.getUser();

      return response;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
