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
  double? lat;
  double? long;
}
