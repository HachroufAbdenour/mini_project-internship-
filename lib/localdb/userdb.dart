import 'package:isar/isar.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

//generate file to get inctance automaicly

part 'userdb.g.dart';

@collection
class UserLocal {
  Id? id;
  String? email;
  String? username;
  String? password;

  Name? name;

  Address? address;

  String? phone;
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
  String? lat;
  String? long;
}

// save list of object<Users> in isar db

Future<void> saveUsers(List<UserLocal> users) async {
  final isar = await Isar.open([UserLocalSchema]);

  isar.writeTxn(() async {
    for (final user in users) {
      isar.userLocals.put(user);
    }
    print("save users successfully");
  });
}

// retrieve list of object from isar db

Future<List<UserLocal>> getUsersFromDatabase() async {
  final isar = await Isar.open([UserLocalSchema]);

  final users = await isar.userLocals.where().findAll();

  return users;
}
