import 'package:equatable/equatable.dart';

sealed class BlocEvent extends Equatable {
  const BlocEvent();

  @override
  List<Object> get props => [];
}

final class BlocSearchPressed extends BlocEvent {}
