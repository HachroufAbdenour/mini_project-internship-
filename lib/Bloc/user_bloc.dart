// ignore: depend_on_referenced_packages
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
      } catch (e) {
        emit(UserErrorState(e.toString()));
      }
      ;
    });
  }
}
