part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginSucess extends LoginState {
  final BagLoginModel bagLoginModel;

  LoginSucess({required this.bagLoginModel});
}

final class LoginLoading extends LoginState {}

final class LoginErorr extends LoginState {
  final String error;

  LoginErorr({required this.error});
}
