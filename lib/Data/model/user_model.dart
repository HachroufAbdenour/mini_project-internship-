import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'address_model.dart';
import 'name_model.dart';

class User {
  late final int? id;
  final Address? address;
  late final String? email;
  late final String? username;
  late final String? password;
  late final String? phone;
  final int? v;

  late final Name? name;

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
            ? Address.fromJson(json['address'] as Map<String, dynamic>)
            : null,
        id = json['id'] as int?,
        email = json['email'] as String?,
        username = json['username'] as String?,
        password = json['password'] as String?,
        name = (json['name'] as Map<String, dynamic>?) != null
            ? Name.fromJson(json['name'] as Map<String, dynamic>)
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
