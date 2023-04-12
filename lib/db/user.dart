import 'package:isar/isar.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

//generate file to get inctance automaicly

part 'user.g.dart';

@collection
class User {
  late Id id = Isar.autoIncrement;
  late String email;
  late String username;
  late String password;

  late Name name;

  late Address address;

  late String phone;
}

@embedded
class Name {
  String? firstname;
  String? lastname;
}

@embedded
class Address {
  Geolocation? geolocation;
  String? city;
  String? street;
  int? number;
  String? zipcode;
}

@embedded
class Geolocation {
  double? lat;
  double? long;
}

// save list of object<Users> in isar db

Future<void> saveUsers(List<User> users) async {
  final isar = await Isar.open([UserSchema]);

  isar.writeTxn(() async {
    for (final user in users) {
      isar.users.put(user);
    }
  });
}
