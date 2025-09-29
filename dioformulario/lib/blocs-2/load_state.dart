import 'package:equatable/equatable.dart';
import '../models/usuario.dart';

sealed class LoadState extends Equatable {
  const LoadState();

  @override
  List<Object?> get props => [];
}

class LoadInitial extends LoadState {}
class LoadLoading extends LoadState {}
class LoadSuccess extends LoadState {
  final Usuario usuario;
  const LoadSuccess(this.usuario);

  @override
  List<Object?> get props => [usuario];
}
class LoadFailure extends LoadState {}