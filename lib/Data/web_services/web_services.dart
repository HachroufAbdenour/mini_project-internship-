import 'dart:convert';

import 'package:http/http.dart';

import 'package:mini_projet/constant/constant.dart';

import '../model/user_model.dart';

class WebServices {
  Future<List<User>> getUser() async {
    Response response = await get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      result.map((e) => print(e));
      return result.map((e) => User.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
