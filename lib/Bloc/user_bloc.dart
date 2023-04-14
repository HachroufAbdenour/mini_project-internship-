// ignore: depend_on_referenced_packages
// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:mini_projet/bloc/user_event.dart';
import 'package:mini_projet/bloc/user_state.dart';
import '../Data/Repository/repository.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final Repository _repository;

  UserBloc(this._repository) : super(UserLoadingState()) {
    on<LoadUserEvent>((event, emit) async {
      emit(UserLoadingState());

      try {
        final users = await _repository.getUsers();
        emit(UserLoadedState(users));
      } catch (error) {
        print('Error while loading users from API: $error');

        final userdb = await _repository.getUsersFromDb();
        emit(UserErrorState(userdb));
      }
    });
  }
}
