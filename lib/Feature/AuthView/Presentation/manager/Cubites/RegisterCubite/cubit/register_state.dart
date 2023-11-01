part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterSucess extends RegisterState {
  final BagAuthModel bagAuthModel;

  RegisterSucess({required this.bagAuthModel});
}

final class RegisterLoading extends RegisterState {}

final class RegisterError extends RegisterState {
  final String error;

  RegisterError({required this.error});
}

final class RegisterChangePasswordVisiablity extends RegisterState {}
