part of 'navegacionCubit.dart';

@immutable
sealed class NavegacionState {}

final class NavegacionInitial extends NavegacionState {}

final class NavegacionLoading extends NavegacionState {}

final class NavegacionSuccess extends NavegacionState {}
