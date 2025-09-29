import 'package:equatable/equatable.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

final class HomeLoginPressed extends HomeEvent {
  final String correo;
  final String usuario;
  final String contra;

  const HomeLoginPressed(this.correo, this.usuario, this.contra);

  @override
  List<Object> get props => [correo, usuario, contra];
}