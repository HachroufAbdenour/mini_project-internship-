import 'dart:convert';
import 'package:http/http.dart';
import 'package:mini_projet/constant/constant.dart';
import '../web_services/web_services.dart';
import 'package:mini_projet/Data/model/user_model.dart';

class Repository {
  final WebServices apiProvider;

  Repository(this.apiProvider);

// call method from webservices to get data from api 'with fetching'

  Future<List<User>> getUsers() async {
    try {
      final response = await apiProvider.getUser();

// save list of users into database isardb
      // await saveUsers(response);

      return response;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

// call method to retrive list of users from local db
/*
  Future<List<User>> getUsersFromDb() async {
    try {
      final response = await getUsersFromDatabase();

      return response;
    } catch (e) {
      throw Exception(e.toString());
    }
  }*/
}
