part of 'app_bloc.dart';

@immutable
sealed class BlocState {}

final class BlocInitial extends BlocState {}

final class BlocLoading extends BlocState {}

final class BlocFailure extends BlocState {}

final class BlocSuccess extends BlocState {
  final List<Usuario> usuarios;

  BlocSuccess(this.usuarios);
}
