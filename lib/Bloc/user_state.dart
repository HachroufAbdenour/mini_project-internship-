import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../Data/model/user_model.dart';

@immutable
abstract class UserState extends Equatable {}

//Data loading state

class UserLoadingState extends UserState {
  @override
  List<Object?> get props => [];
}

//Data Loaded state

class UserLoadedState extends UserState {
  UserLoadedState(this.users);

  final List<User> users;

  @override
  List<Object?> get props => [users];
}

// Data error  loading state

class UserErrorState extends UserState {
  UserErrorState(this.error);
  String error;

  @override
  List<Object?> get props => [];
}
