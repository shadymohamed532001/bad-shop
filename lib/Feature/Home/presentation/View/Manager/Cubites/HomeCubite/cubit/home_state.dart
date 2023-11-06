part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeChangeBottomIndex extends HomeState {}

final class HomeSucess extends HomeState {
  final HomeModel homeModel;

  HomeSucess({required this.homeModel});
}

final class HomeLoading extends HomeState {}

final class HomeError extends HomeState {
  final String error;

  HomeError({required this.error});
}
