import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'address_model.dart';
import 'name_model.dart';

import '../../localdb/userdb.dart';

class User {
  late final int? id;
  final Addresss? address;
  late final String? email;
  late final String? username;
  late final String? password;
  late final String? phone;
  final int? v;

  late final Namee? name;

  User({
    this.id,
    this.address,
    this.email,
    this.username,
    this.password,
    this.name,
    this.phone,
    this.v,
  });

  User.fromJson(Map<String, dynamic> json)
      : address = (json['address'] as Map<String, dynamic>?) != null
            ? Addresss.fromJson(json['address'] as Map<String, dynamic>)
            : null,
        id = json['id'] as int?,
        email = json['email'] as String?,
        username = json['username'] as String?,
        password = json['password'] as String?,
        name = (json['name'] as Map<String, dynamic>?) != null
            ? Namee.fromJson(json['name'] as Map<String, dynamic>)
            : null,
        phone = json['phone'] as String?,
        v = json['__v'] as int?;

  Map<String, dynamic> toJson() => {
        'address': address?.toJson(),
        'id': id,
        'email': email,
        'username': username,
        'password': password,
        'name': name?.toJson(),
        'phone': phone,
        '__v': v
      };
}

//
// _____A_______ Method to convert User object  To Userlocal object

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
    ..name = name as Name?
    ..address = address
    ..phone = user.phone;
}
