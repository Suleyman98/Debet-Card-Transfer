part of 'home_cubit.dart';

// @immutable
abstract class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoaded extends HomeState {
  final List<UserModel> users;
  final UserModel currentUser;

  HomeLoaded({
    required this.users,
    required this.currentUser,
  });
}

final class HomeError extends HomeState {}
