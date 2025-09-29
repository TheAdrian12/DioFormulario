import 'package:equatable/equatable.dart';

sealed class LoadEvent extends Equatable {
  const LoadEvent();

  @override
  List<Object> get props => [];
}

final class LoadDataPressed extends LoadEvent {}