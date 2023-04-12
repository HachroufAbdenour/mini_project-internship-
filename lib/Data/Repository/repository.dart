import 'dart:convert';
import 'package:http/http.dart';
import 'package:mini_projet/constant/constant.dart';
import 'package:mini_projet/localdb/userdb.dart';
import '../web_services/web_services.dart';
import 'package:mini_projet/Data/model/user_model.dart';

class Repository {
  final WebServices apiProvider;

  Repository(this.apiProvider);

// call method from webservices to get data from api 'with fetching'

  Future<List<User>> getUsers() async {
    try {
      final response = await apiProvider.getUser();

// call method to convert User Object To UserModel Object

      final userlocal =
          response.map((user) => convertUserToUserLocal(user)).toList();

      print(" call method to convert User Object To UserModel Object");

// save list of users into database isardb

      await saveUsers(userlocal);
//

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

// Method to convert User object  To Userlocal object

UserLocal convertUserToUserLocal(User user) {
  final name = Name()
    ..firstname = user.name!.firstname
    ..lastname = user.name!.lastname;

  final geolocation = Geolocation()
    ..lat = user.address!.geolocation!.lat
    ..long = user.address!.geolocation!.long;

  final address = Address()
    ..geolocation = geolocation
    ..city = user.address!.city
    ..street = user.address!.street
    ..number = user.address!.number
    ..zipcode = user.address!.zipcode;

  return UserLocal()
    ..id = user.id
    ..email = user.email
    ..username = user.username
    ..password = user.password
    ..name = name
    ..address = address
    ..phone = user.phone;
}
