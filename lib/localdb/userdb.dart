import 'package:isar/isar.dart';
import 'package:mini_projet/Data/model/address_model.dart';
import 'package:mini_projet/Data/model/geolocation_model.dart';
import '../Data/model/name_model.dart';
import '../Data/model/user_model.dart';

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

  print("of course get incrance from isar db ");

  isar.writeTxn(() async {
    for (final user in users) {
      isar.userLocals.put(user);
    }
    // testing proccess debugging

    print("save users successfully");
  });
}

// retrieve list of object from isar db

Future<List<UserLocal>> getUsersFromDatabase() async {
  final isar = await Isar.open([UserLocalSchema]);
  print(
      "get inctance from   getUsersFromDatabase() to get list Users from db storage ");

  final users = await isar.userLocals.where().findAll();

  return users;
}

// _____B_______ Method to convert Userlocal object  To User  object

User convertUserLocalToUser(UserLocal userLocal) {
  final name = Namee(
      firstname: userLocal.name!.firstname, lastname: userLocal.name!.lastname);

  final geolocation = Geolocationn(
      lat: userLocal.address!.geolocation!.lat,
      long: userLocal.address!.geolocation!.long);

  final address = Addresss(
    geolocation: geolocation,
    city: userLocal.address!.city,
    number: userLocal.address!.number,
    street: userLocal.address!.street,
    zipcode: userLocal.address!.street,
  );

  return User(
    id: userLocal.id,
    email: userLocal.email,
    username: userLocal.username,
    password: userLocal.password,
    name: name,
    address: address,
    phone: userLocal.phone,
  );
}
