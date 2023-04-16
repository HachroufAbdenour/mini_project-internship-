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

      return response;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

// call method to retrive list of users from local db

  Future<List<User>> getUsersFromDb() async {
    try {
      final response = await getUsersFromDatabase();

      final user = response
          .map((userlocal) => convertUserLocalToUser(userlocal))
          .toList();

      return user;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
