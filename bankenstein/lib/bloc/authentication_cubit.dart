import 'package:bankenstein/models/user.dart';
import 'package:bankenstein/service/authentication_service.dart';
import 'package:bankenstein/service/user_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AuthenticationState {}

class AuthenticationStateInitial extends AuthenticationState {}

class AuthenticationStateLoading extends AuthenticationState {}

class AuthenticationStateAuthenticated extends AuthenticationState {
  final UserModel user;
  
  AuthenticationStateAuthenticated({required this.user});
}

class AuthenticationStateError extends AuthenticationState {
  final String message;

  AuthenticationStateError({required this.message});
}

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationStateInitial());

  Future<void> login(email, password) async {
    emit(AuthenticationStateLoading());
    try {
      final authenticationService = AuthenticationServiceImpl(); // Instancier AuthenticationService
      await authenticationService.saveToken(email, password);
      final UserModel user = await UserService.getUser();
      emit(AuthenticationStateAuthenticated(user: user));
    } catch (e) {
      emit(AuthenticationStateError(message: e.toString()));
    }
  }
}